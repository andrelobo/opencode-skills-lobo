#!/usr/bin/env node
/**
 * Gera `dsh/agents/presets.patch.yml`: cinco agent presets do DeepSeek Harness
 * derivados do preset `standard` que acompanha o dsh.
 *
 * Cada preset é uma linha `@deepseek-ai/dsh-agent-preset` (composition) que
 * aparece no seletor de agentes do harness. A árvore de plugins vem do preset
 * `standard` (que já é válido para a versão instalada do dsh); este script
 * apenas:
 *   - troca a identidade (id, name, description, order);
 *   - troca a persona (prefix + suffix) pelo papel do especialista;
 *   - remove as ferramentas de orquestração que não fazem sentido no especialista
 *     (agendamentos, goals, workflow multi-agente, gerenciador de plugins);
 *   - no caso do agente de qualidade, deixa o filesystem em modo somente leitura.
 *
 * Uso:
 *   node dsh/agents/build-presets.mjs [--template <standard.patch.yml>]
 */

import { mkdir, readFile, writeFile } from "node:fs/promises";
import { execSync } from "node:child_process";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { existsSync } from "node:fs";

const REPO = dirname(dirname(dirname(fileURLToPath(import.meta.url))));
const OUT_DIR = join(REPO, "dsh", "agents");
const OUTPUT = join(OUT_DIR, "presets.patch.yml");
const MANIFEST = join(OUT_DIR, "agents.manifest.json");

const argv = process.argv.slice(2);
const templateArg = argv.indexOf("--template") >= 0 ? argv[argv.indexOf("--template") + 1] : process.env.DSH_PRESET_TEMPLATE;

/** Localiza o preset `standard` da instalação do dsh. */
function findTemplate() {
  const candidates = [];
  if (templateArg) candidates.push(templateArg);
  try {
    const bin = execSync("command -v dsh", { encoding: "utf8" }).trim();
    const real = execSync(`readlink -f ${JSON.stringify(bin)}`, { encoding: "utf8" }).trim();
    // <dsh>/lib/bin.js -> <dsh>
    const dshRoot = dirname(dirname(real));
    candidates.push(join(dshRoot, "node_modules", "@deepseek-ai", "dsh-web-app", "presets", "standard.patch.yml"));
  } catch {
    /* segue para os fallbacks */
  }
  try {
    const root = execSync("npm root -g", { encoding: "utf8" }).trim();
    candidates.push(join(root, "@deepseek-ai", "dsh", "node_modules", "@deepseek-ai", "dsh-web-app", "presets", "standard.patch.yml"));
  } catch {
    /* segue */
  }
  const found = candidates.find((candidate) => existsSync(candidate));
  if (found === undefined) {
    throw new Error(
      "preset standard não encontrado. Passe --template <caminho de standard.patch.yml> " +
        "ou instale o dsh globalmente (@deepseek-ai/dsh).",
    );
  }
  return found;
}

/** Skills que cada especialista deve carregar primeiro (nomes do catálogo). */
const AGENTS = [
  {
    slug: "backend",
    name: "Backend Engineer",
    description: "APIs, banco de dados, serviços e integrações backend.",
    order: 10,
    prefix: "Você é um(a) engenheiro(a) backend sênior, um agente de código rodando no modelo {{model}}.",
    skills: [
      "api-design", "rest", "graphql", "openapi", "express", "nestjs", "nodejs", "python", "php",
      "postgresql", "mongodb", "redis", "jwt", "oauth", "docker", "test-generation", "code-review", "security-audit",
    ],
    rules: [
      "Antes de implementar, carregue a skill da stack principal do projeto (ex.: `nestjs`, `python`, `postgresql`) e siga o Fluxo de Trabalho e os Critérios de Qualidade dela.",
      "Valide contratos de API contra a especificação (OpenAPI/GraphQL schema) e cubra o caminho feliz + erros com testes.",
      "Nunca invente endpoints, tabelas ou variáveis de ambiente: confirme no repositório e nas migrations/configs.",
      "Mudanças de schema exigem migration + rollback descritos; nada de alterar dados de produção por conta própria.",
      "Segurança primeiro: autenticação/autorização explícitas, entradas validadas, segredos fora do código.",
    ],
  },
  {
    slug: "frontend",
    name: "Frontend Engineer",
    description: "React, Next.js, TypeScript, acessibilidade e performance de UI.",
    order: 11,
    prefix: "Você é um(a) engenheiro(a) frontend sênior, um agente de código rodando no modelo {{model}}.",
    skills: [
      "react", "nextjs", "typescript", "javascript", "acessibilidade-web", "wcag", "performance",
      "playwright", "code-review",
    ],
    rules: [
      "Carregue a skill do framework do projeto (`react`, `nextjs`) e a de acessibilidade (`acessibilidade-web`, `wcag`) antes de escrever componentes.",
      "Todo componente novo precisa de estados de loading/erro/vazio e navegação por teclado.",
      "Acessibilidade é definição de pronto: contraste, foco visível, labels e semântica correta.",
      "Performance: evite re-render desnecessário, bundle crescente e imagens sem dimensão; meça antes de otimizar.",
      "Verifique o comportamento em pelo menos um teste E2E (`playwright`) quando a mudança afetar fluxo de usuário.",
    ],
  },
  {
    slug: "devops",
    name: "DevOps / SRE",
    description: "CI/CD, containers, cloud, deploy e observabilidade.",
    order: 12,
    prefix: "Você é um(a) engenheiro(a) DevOps/SRE sênior, um agente de código rodando no modelo {{model}}.",
    skills: [
      "cicd", "docker", "docker-compose", "cloud", "deploy", "linux", "git-workflow",
      "observabilidade", "logs", "security-audit", "n8n",
    ],
    rules: [
      "Carregue a skill do alvo da mudança (`cicd`, `docker`, `cloud`, `observabilidade`) e siga o Fluxo de Trabalho dela.",
      "Toda alteração de infraestrutura precisa de plano de rollback e deve ser idempotente.",
      "Nunca rode comandos destrutivos (`rm -rf`, `terraform apply`, `kubectl delete`, `push --force`) sem confirmar o alvo com o usuário.",
      "Segredos nunca entram no repositório nem em logs; use variáveis de ambiente ou secret manager.",
      "Prefira mudanças pequenas e observáveis: métricas, logs estruturados e alertas antes de escalar.",
    ],
  },
  {
    slug: "qualidade",
    name: "QA & Segurança",
    description: "Revisão de código, estratégia de testes e auditoria de segurança (somente leitura).",
    order: 13,
    prefix: "Você é um(a) engenheiro(a) de qualidade e segurança sênior, um agente de análise rodando no modelo {{model}}.",
    skills: [
      "code-review", "security-audit", "test-strategy", "test-generation", "playwright",
      "refactor", "performance", "skill-validator", "skill-auditor",
    ],
    rules: [
      "Você trabalha em modo somente leitura: diagnostique, proponha patches no chat e peça a outro perfil para aplicar.",
      "Carregue `code-review` ou `security-audit` conforme o foco e entregue achados com arquivo:linha, severidade e correção sugerida.",
      "Classifique cada achado (crítico/alto/médio/baixo) e separe o que foi confirmado do que é suspeita.",
      "Não reporte vulnerabilidade sem caminho de exploração ou evidência no código.",
      "Para qualidade de testes, avalie pirâmide, determinismo e cobertura de caminhos de erro, não só percentual.",
    ],
    readOnlyFs: true,
  },
  {
    slug: "docs-educacao",
    name: "Docs & Educação",
    description: "Documentação técnica, conteúdo educacional e linguagem inclusiva.",
    order: 14,
    prefix: "Você é um(a) redator(a) técnico(a) e educador(a) sênior, um agente de conteúdo rodando no modelo {{model}}.",
    skills: [
      "doc-writer", "linguagem-simples", "acessibilidade-conteudo", "cursos", "planejamento",
      "materiais-didaticos", "apostilas", "palestras", "treinamentos",
    ],
    rules: [
      "Carregue `doc-writer` (documentação técnica) ou `planejamento`/`materiais-didaticos` (conteúdo educacional) conforme o pedido.",
      "Escreva em português claro: frases curtas, voz ativa, termos técnicos explicados na primeira ocorrência.",
      "Toda imagem precisa de texto alternativo; títulos devem formar um sumário navegável.",
      "Não invente fatos, números, citações ou APIs: se faltar informação, marque como pendência e pergunte.",
      "Entregue no formato do destino (Markdown, roteiro de aula, slides) e termine com próximos passos objetivos.",
    ],
  },
];

const PRUNE_FOR_ALL = [
  "tool-schedule",
  "command-goal",
  "tool-goal",
  "workflow-ptc",
  "tool-workflow",
  "tool-plugin-manager",
  "tool-plugin-market",
];

function indentOf(line) {
  return line.length - line.trimStart().length;
}

/** Remove um item `- id: <id>` da lista de plugins, incluindo o bloco aninhado. */
function removeRow(text, id) {
  const lines = text.split("\n");
  const start = lines.findIndex((line) => new RegExp(`^\\s*- id: ${id}$`).test(line));
  if (start === -1) throw new Error(`row "${id}" não existe no preset de origem`);
  const indent = indentOf(lines[start]);
  let end = start + 1;
  while (end < lines.length) {
    const line = lines[end];
    if (/^\s*- id:/.test(line) && indentOf(line) <= indent) break;
    if (/^\s*- id:/.test(line) && indentOf(line) < indent) break;
    if (line.trim() !== "" && indentOf(line) < indent && !line.trimStart().startsWith("- ")) break;
    end += 1;
  }
  return [...lines.slice(0, start), ...lines.slice(end)].join("\n");
}

/** Emite YAML double-quoted para um scalar de uma linha. */
function quoted(value) {
  return JSON.stringify(value);
}

/** Troca a identidade do preset e injeta a persona do especialista. */
function specialize(template, agent, order) {
  let text = template;
  const identity = [
    `    - id: preset-${agent.slug}`,
    "      name: '@deepseek-ai/dsh-agent-preset'",
    "      config:",
    `        id: ${agent.slug}`,
    `        name: ${quoted(agent.name)}`,
    `        description: ${quoted(agent.description)}`,
    `        order: ${order}`,
  ].join("\n");
  const headerPattern = /^    - id: preset-standard\n      name: '@deepseek-ai\/dsh-agent-preset'\n      config:\n        id: standard\n        order: 1$/m;
  if (!headerPattern.test(text)) throw new Error("cabeçalho do preset standard mudou; ajuste build-presets.mjs");
  text = text.replace(headerPattern, identity);

  const prefix = "              prefix: You are a coding agent powered by the {{model}} model.";
  if (!text.includes(prefix)) throw new Error("linha de persona do preset standard mudou; ajuste build-presets.mjs");
  const suffixLines = [
    "              suffix: |",
    ...agent.rules.map((rule) => `                ${rule}`),
    "",
    `                Skills prioritárias deste perfil: ${agent.skills.map((skill) => `\`${skill}\``).join(", ")}.`,
    "                Carregue-as com a ferramenta skill antes de executar a tarefa correspondente.",
  ];
  text = text.replace(prefix, `${"              prefix: " + quoted(agent.prefix)}\n${suffixLines.join("\n")}`);

  for (const id of PRUNE_FOR_ALL) text = removeRow(text, id);

  if (agent.readOnlyFs === true) {
    const fsRow = "          - id: tool-fs\n            name: '@deepseek-ai/dsh-tool-fs'";
    if (!text.includes(fsRow)) throw new Error("linha tool-fs do preset standard mudou; ajuste build-presets.mjs");
    text = text.replace(fsRow, `${fsRow}\n            config:\n              write: false\n              edit: false`);
  }
  return text;
}

async function main() {
  const templatePath = findTemplate();
  const rawTemplate = await readFile(templatePath, "utf8");
  const body = rawTemplate.replace(/^#[^\n]*\n/gm, "").trimEnd();
  if (!body.startsWith("- insert:")) throw new Error("template sem entrada `- insert:`");

  const header = [
    "# GERADO por dsh/agents/build-presets.mjs — não edite à mão.",
    "# Cinco agent presets do DeepSeek Harness baseados no preset `standard`",
    `# (origem: ${templatePath}).`,
    "# Aplicação no harness: node dsh/agents/install.mjs --profile web",
    "",
  ].join("\n");

  const blocks = [];
  const manifest = [];
  AGENTS.forEach((agent, index) => {
    blocks.push(specialize(body, agent, agent.order ?? 10 + index));
    manifest.push({
      id: agent.slug,
      name: agent.name,
      description: agent.description,
      order: agent.order ?? 10 + index,
      readOnlyFs: agent.readOnlyFs === true,
      skills: agent.skills,
    });
  });

  await mkdir(OUT_DIR, { recursive: true });
  await writeFile(OUTPUT, `${header}${blocks.join("\n")}\n`);
  await writeFile(
    MANIFEST,
    `${JSON.stringify({ generatedBy: "dsh/agents/build-presets.mjs", template: templatePath, presets: manifest }, null, 2)}\n`,
  );
  console.log(`template: ${templatePath}`);
  console.log(`${blocks.length} presets -> ${OUTPUT}`);
  for (const row of manifest) console.log(`  ${row.id.padEnd(14)} ${row.name}${row.readOnlyFs ? " (somente leitura)" : ""}`);
}

await main();
