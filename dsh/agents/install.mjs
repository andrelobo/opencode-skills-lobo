#!/usr/bin/env node
/**
 * Instala os agent presets gerados (`dsh/agents/presets.patch.yml`) no perfil do
 * DeepSeek Harness, anexando um bloco marcado ao `cordis.patch.yml` do perfil.
 *
 * O bloco é idempotente: rodar de novo substitui o bloco anterior; `--uninstall`
 * remove. Nada mais do arquivo é tocado (backup opcional com --backup).
 *
 * Uso:
 *   node dsh/agents/install.mjs [--profile web] [--dry-run] [--uninstall] [--backup]
 */

import { copyFile, readFile, writeFile } from "node:fs/promises";
import { existsSync } from "node:fs";
import { homedir } from "node:os";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const REPO = dirname(dirname(dirname(fileURLToPath(import.meta.url))));
const SOURCE = join(REPO, "dsh", "agents", "presets.patch.yml");
const BEGIN = "# >>> opencode-skills-lobo: agent presets (gerado por dsh/agents/install.mjs; não edite) >>>";
const END = "# <<< opencode-skills-lobo: agent presets <<<";
const BLOCK = new RegExp(`${escapeRe(BEGIN)}[\\s\\S]*?${escapeRe(END)}\\n?`, "u");

function escapeRe(value) {
  return value.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

const argv = process.argv.slice(2);
const flag = (name) => argv.includes(`--${name}`);
const value = (name, fallback) => (argv.indexOf(`--${name}`) >= 0 ? argv[argv.indexOf(`--${name}`) + 1] : fallback);

const profile = value("profile", process.env.DSH_PROFILE ?? "web");
const dryRun = flag("dry-run");
const uninstall = flag("uninstall");
const backup = flag("backup");
const DSH_HOME = process.env.DSH_HOME ?? join(homedir(), ".dsh");
const patchPath = join(DSH_HOME, "profiles", profile, "cordis.patch.yml");

/** Conta presets lendo as linhas `id: preset-<slug>` do bloco gerado. */
function presetIds(text) {
  return [...text.matchAll(/^\s*- id: (preset-[a-z0-9-]+)$/gm)].map((match) => match[1]);
}

async function main() {
  if (!existsSync(patchPath)) {
    console.error(`perfil não encontrado: ${patchPath}`);
    console.error("Rode o harness uma vez com esse perfil (ex.: dsh web) para criá-lo, ou use --profile <nome>.");
    process.exitCode = 1;
    return;
  }
  if (!uninstall && !existsSync(SOURCE)) {
    console.error(`presets não gerados: ${SOURCE}\nRode antes: node dsh/agents/build-presets.mjs`);
    process.exitCode = 1;
    return;
  }

  const current = await readFile(patchPath, "utf8");
  const stripped = current.replace(BLOCK, "").replace(/\s*$/u, "\n");
  const hadBlock = stripped !== current.replace(/\s*$/u, "\n");

  let next = stripped;
  if (!uninstall) {
    const presets = (await readFile(SOURCE, "utf8")).trimEnd();
    next = `${stripped.trimEnd()}\n\n${BEGIN}\n${presets}\n${END}\n`;
  }

  const ids = presetIds(next);
  console.log(`perfil:  ${profile}`);
  console.log(`arquivo: ${patchPath}`);
  console.log(`bloco:   ${uninstall ? `removendo${hadBlock ? "" : " (não existe)"}` : `${ids.length} presets: ${ids.join(", ")}`}`);

  if (dryRun) {
    console.log("\n--- conteúdo resultante (dry-run, não escrito) ---");
    console.log(uninstall ? lastLines(stripped) : `${lastLines(stripped)}\n\n${BEGIN}\n…${SOURCE}…\n${END}`);
    return;
  }
  if (next === current) {
    console.log("nada a fazer: o arquivo já está nesse estado.");
    return;
  }
  if (backup) {
    const backupPath = `${patchPath}.bak`;
    await copyFile(patchPath, backupPath);
    console.log(`backup:  ${backupPath}`);
  }
  await writeFile(patchPath, next);
  console.log("\nok. O harness aplica o patch ao (re)iniciar o perfil.");
  console.log(`Reinicie o harness (ex.: dsh ${profile}) para ver os agentes no seletor de presets.`);
}

function lastLines(text) {
  return text.trimEnd();
}

await main();
