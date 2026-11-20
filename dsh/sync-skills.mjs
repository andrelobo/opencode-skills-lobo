#!/usr/bin/env node
/**
 * Sync this library's nested `skills/<categoria>/<skill>/SKILL.md` tree into the
 * FLAT roots that DeepSeek Harness (dsh) discovers:
 *
 *   - project scope: <repo>/.dsh/skills      (rank 100, wins over user roots)
 *   - user scope:    $DSH_HOME/skills        (default ~/.dsh/skills)
 *
 * dsh's filesystem skill provider lists one directory level and expects either
 * `<name>/SKILL.md` (directory bundle) or `<name>.md` (flat file). Category
 * folders are therefore flattened with symlinks that point back into this repo,
 * so `git pull` here updates every registered skill with no copy step.
 *
 * Uso:
 *   node dsh/sync-skills.mjs [--scope project|user|both] [--dry-run] [--json]
 */

import { mkdir, readdir, readFile, lstat, symlink, unlink, readlink, writeFile } from "node:fs/promises";
import { dirname, join, relative, resolve, sep } from "node:path";
import { homedir } from "node:os";
import { fileURLToPath } from "node:url";

const REPO = dirname(dirname(fileURLToPath(import.meta.url)));
const SKILLS = join(REPO, "skills");
const DSH_HOME = process.env.DSH_HOME ?? join(homedir(), ".dsh");
const NAME = /^[a-z0-9]+(?:-[a-z0-9]+)*$/;
const MAX_DESCRIPTION = 150; // library convention; dsh itself only requires non-empty

const argv = process.argv.slice(2);
const dryRun = argv.includes("--dry-run");
const asJson = argv.includes("--json");
const scopeArg = (() => {
  const i = argv.indexOf("--scope");
  const value = i >= 0 ? argv[i + 1] : "both";
  if (!["project", "user", "both"].includes(value)) {
    throw new Error(`--scope must be project|user|both (got "${value}")`);
  }
  return value;
})();

/** Parse the small YAML subset used by this library's skill frontmatter. */
function parseFrontmatter(raw) {
  const match = /^---\r?\n([\s\S]*?)\r?\n---(?:\r?\n|$)/.exec(raw);
  if (!match) return undefined;
  const data = {};
  const lines = match[1].split(/\r?\n/);
  for (let i = 0; i < lines.length; i += 1) {
    const kv = /^([A-Za-z0-9_-]+):\s*(.*)$/.exec(lines[i]);
    if (!kv) continue;
    const [, key, inline] = kv;
    if (/^[|>][-+]?$/.test(inline)) {
      const collected = [];
      while (i + 1 < lines.length && /^\s{2,}/.test(lines[i + 1])) {
        collected.push(lines[(i += 1)].trim());
      }
      data[key] = collected.join(inline.startsWith(">") ? " " : "\n");
      continue;
    }
    let value = inline.trim();
    if (
      (value.startsWith('"') && value.endsWith('"') && value.length > 1) ||
      (value.startsWith("'") && value.endsWith("'") && value.length > 1)
    ) {
      const quote = value[0];
      value = value.slice(1, -1);
      if (quote === '"') value = value.replace(/\\(["\\])/g, "$1");
      else value = value.replace(/''/g, "'");
    }
    data[key] = value;
  }
  return { data, body: raw.slice(match[0].length) };
}

/** Collect every skill in the nested library with validation diagnostics. */
async function collectSkills() {
  const skills = [];
  const errors = [];
  const warnings = [];
  const seen = new Map();

  for (const category of (await readdir(SKILLS, { withFileTypes: true }))
    .filter((entry) => entry.isDirectory() && !entry.name.startsWith("_"))
    .map((entry) => entry.name)
    .sort()) {
    const categoryDir = join(SKILLS, category);
    for (const entry of (await readdir(categoryDir, { withFileTypes: true }))
      .filter((item) => item.isDirectory())
      .map((item) => item.name)
      .sort()) {
      const dir = join(categoryDir, entry);
      const file = join(dir, "SKILL.md");
      let raw;
      try {
        raw = await readFile(file, "utf8");
      } catch {
        errors.push(`${relative(REPO, dir)}: sem SKILL.md`);
        continue;
      }
      const parsed = parseFrontmatter(raw);
      if (parsed === undefined) {
        errors.push(`${relative(REPO, file)}: frontmatter YAML ausente`);
        continue;
      }
      const { name, description, whenToUse } = parsed.data;
      if (typeof name !== "string" || name.length === 0) {
        errors.push(`${relative(REPO, file)}: frontmatter "name" obrigatório`);
        continue;
      }
      if (!NAME.test(name)) {
        errors.push(`${relative(REPO, file)}: nome "${name}" não é kebab-case (^[a-z0-9]+(-[a-z0-9]+)*$)`);
        continue;
      }
      if (name !== entry) {
        errors.push(`${relative(REPO, file)}: nome "${name}" difere do diretório "${entry}"`);
      }
      if (typeof description !== "string" || description.length === 0) {
        errors.push(`${relative(REPO, file)}: frontmatter "description" obrigatório`);
        continue;
      }
      if (seen.has(name)) {
        errors.push(`${relative(REPO, file)}: nome duplicado "${name}" (já em ${seen.get(name)})`);
        continue;
      }
      seen.set(name, relative(REPO, file));
      if (description.length > MAX_DESCRIPTION) {
        warnings.push(`${relative(REPO, file)}: description com ${description.length} chars (> ${MAX_DESCRIPTION})`);
      }
      if (!/^Use when/i.test(description)) {
        warnings.push(`${relative(REPO, file)}: description não começa com "Use when..."`);
      }
      skills.push({
        name,
        category,
        dir,
        file,
        description,
        ...(typeof whenToUse === "string" && whenToUse.length > 0 ? { whenToUse } : {}),
        lines: raw.split("\n").length,
      });
    }
  }
  return { skills, errors, warnings };
}

/** Roots to populate for the requested scope. */
function targets(scope) {
  const roots = [];
  if (scope === "project" || scope === "both") {
    roots.push({ kind: "project", path: join(REPO, ".dsh", "skills"), link: (skill) => join("..", "..", "skills", skill.category, skill.name) });
  }
  if (scope === "user" || scope === "both") {
    roots.push({ kind: "user", path: join(DSH_HOME, "skills"), link: (skill) => skill.dir });
  }
  return roots;
}

/** Remove only stale symlinks this script previously created inside `root`. */
async function prune(root, live, log) {
  let entries;
  try {
    entries = await readdir(root, { withFileTypes: true });
  } catch (error) {
    if (error.code === "ENOENT") return;
    throw error;
  }
  for (const entry of entries) {
    if (live.has(entry.name)) continue;
    const path = join(root, entry.name);
    const info = await lstat(path);
    if (!info.isSymbolicLink()) {
      log.push(`preservado (não é symlink): ${path}`);
      continue;
    }
    let target;
    try {
      target = await readlink(path);
    } catch {
      continue;
    }
    const absolute = resolve(root, target);
    if (absolute !== SKILLS && !absolute.startsWith(SKILLS + sep)) continue;
    if (dryRun) {
      log.push(`removeria symlink obsoleto: ${path}`);
      continue;
    }
    await unlink(path);
    log.push(`symlink obsoleto removido: ${relative(REPO, path)}`);
  }
}

async function main() {
  const { skills, errors, warnings } = await collectSkills();
  if (errors.length > 0) {
    for (const error of errors) console.error(`erro: ${error}`);
    console.error(`\n${errors.length} erro(s): nenhuma skill foi sincronizada.`);
    process.exitCode = 1;
    return;
  }

  const links = [];
  const log = [];
  for (const root of targets(scopeArg)) {
    await mkdir(root.path, { recursive: true });
    await prune(root.path, new Set(skills.map((skill) => skill.name)), log);
    for (const skill of skills) {
      const path = join(root.path, skill.name);
      const target = root.link(skill);
      let existing;
      try {
        existing = await lstat(path);
      } catch {
        existing = undefined;
      }
      if (existing !== undefined) {
        if (!existing.isSymbolicLink()) {
          log.push(`ignorado (entrada real já existe): ${path}`);
          continue;
        }
        const current = await readlink(path);
        if (current === target) {
          links.push({ scope: root.kind, name: skill.name, path, target, status: "unchanged" });
          continue;
        }
        if (dryRun) {
          log.push(`atualizaria symlink: ${path}`);
          links.push({ scope: root.kind, name: skill.name, path, target, status: "would-update" });
          continue;
        }
        await unlink(path);
      }
      if (dryRun) {
        links.push({ scope: root.kind, name: skill.name, path, target, status: "would-create" });
        continue;
      }
      await symlink(target, path, "dir");
      links.push({ scope: root.kind, name: skill.name, path, target, status: "created" });
    }
  }

  const manifest = {
    generatedBy: "dsh/sync-skills.mjs",
    repo: REPO,
    scopes: [...new Set(links.map((link) => link.scope))],
    total: skills.length,
    categories: Object.fromEntries(
      [...new Set(skills.map((skill) => skill.category))]
        .sort()
        .map((category) => [category, skills.filter((skill) => skill.category === category).length]),
    ),
    skills: skills.map((skill) => ({
      name: skill.name,
      category: skill.category,
      description: skill.description,
      ...(skill.whenToUse !== undefined ? { whenToUse: skill.whenToUse } : {}),
      lines: skill.lines,
      path: relative(REPO, skill.file),
    })),
  };
  if (!dryRun) {
    await writeFile(join(REPO, "dsh", "skills.manifest.json"), `${JSON.stringify(manifest, null, 2)}\n`);
  }

  if (asJson) {
    console.log(JSON.stringify({ ...manifest, links, warnings, log }, null, 2));
    return;
  }

  const label = { project: ".dsh/skills (projeto)", user: `${DSH_HOME}/skills (usuário)` };
  for (const root of targets(scopeArg)) {
    const created = links.filter((link) => link.scope === root.kind && link.status === "created").length;
    console.log(`${label[root.kind]}: ${skills.length} skills ${dryRun ? "(dry-run)" : "registradas"}${created ? `, ${created} novos links` : ""}`);
  }
  console.log(`\n${skills.length} skills · ${Object.keys(manifest.categories).length} categorias`);
  console.log(Object.entries(manifest.categories).map(([category, count]) => `  ${category.padEnd(14)} ${count}`).join("\n"));
  for (const warning of warnings) console.warn(`aviso: ${warning}`);
  for (const line of log) console.log(line);
  if (dryRun) console.log("\ndry-run: nada foi escrito.");
}

await main();
