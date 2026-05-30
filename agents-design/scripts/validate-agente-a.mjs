#!/usr/bin/env node
import { readFileSync, readdirSync, existsSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import jsyaml from 'js-yaml';
import Ajv from 'ajv';

const __dirname = dirname(fileURLToPath(import.meta.url));

const G = '\x1b[32m', R = '\x1b[31m', Y = '\x1b[33m';
const C = '\x1b[36m', B = '\x1b[1m', RE = '\x1b[0m';

const SCHEMA_PATH = join(__dirname, '..', '_config', 'agente-a-input.schema.json');

const REQUIRED = [
  '00-Project-Brief-Consolidado.md',
  '01-Business-Model-y-Requerimientos.md',
  '03-Esquema-Base-de-Datos.md',
  '04-UI-Vistas-y-Flujos-de-Usuario.md',
  '05-API-Design.md',
  '06-Seguridad-y-NFR.md'
];

const OPTIONAL = [
  '02-ADR-Arquitectura.md',
  '07-Roadmap-y-Riesgos.md',
  '_handoff-to-b.md'
];

function log(msg, type) {
  const pre = type === 'ok' ? G + '  OK' : type === 'fail' ? R + ' FAIL' : Y + ' WARN';
  console.log(pre + RE + '  ' + msg);
}

function parseFM(text) {
  const idx = text.indexOf('---');
  if (idx !== 0) return null;
  const end = text.indexOf('---', 3);
  if (end === -1) return null;
  const yaml = text.substring(3, end).trim();
  try { return jsyaml.load(yaml); }
  catch(e) { return { error: e.message }; }
}

const projectPath = process.argv[2];
if (!projectPath) {
  console.log(R + 'Uso: node validate-agente-a.mjs <ruta-proyecto>' + RE);
  process.exit(1);
}
if (!existsSync(projectPath)) {
  console.log(R + 'Ruta no existe: ' + projectPath + RE);
  process.exit(1);
}

const parts = projectPath.split(/[\/]/).filter(Boolean); const projName = parts[parts.length - 1];
let pass = 0, fail = 0, warn = 0;

console.log('');
console.log('='.repeat(40));
console.log(B + ' Validation: Agente A Project' + RE);
console.log(' Project: ' + C + projName + RE);
console.log(' Path: ' + projectPath);
console.log('='.repeat(40));
console.log('');

// Step 1
console.log(B + '[1/4] Required Files' + RE);
const files = readdirSync(projectPath);
for (const f of REQUIRED) {
  if (files.includes(f)) { log(f, 'ok'); pass++; }
  else { log(f, 'fail'); fail++; }
}

// Step 2
console.log('');
console.log(B + '[2/4] Optional Files' + RE);
for (const f of OPTIONAL) {
  if (files.includes(f)) { log(f, 'ok'); pass++; }
  else { log(f + ' (missing)', 'warn'); warn++; }
}

// Step 3
console.log('');
console.log(B + '[3/4] Frontmatter' + RE);
for (const f of REQUIRED) {
  const fp = join(projectPath, f);
  if (!existsSync(fp)) continue;
  const fm = parseFM(readFileSync(fp, 'utf-8'));
  if (!fm) { log(f + ' (no frontmatter)', 'warn'); warn++; }
  else if (fm.error) { log(f + ' (yaml error: ' + fm.error + ')', 'fail'); fail++; }
  else { log(f + ' (valid)', 'ok'); pass++; }
}

// Step 4
console.log('');
console.log(B + '[4/4] JSON Schema' + RE);
try {
  const schema = JSON.parse(readFileSync(SCHEMA_PATH, 'utf-8'));
  const validateFn = new Ajv().compile(schema);
  const brief = join(projectPath, '00-Project-Brief-Consolidado.md');
  if (existsSync(brief)) {
    const fm = parseFM(readFileSync(brief, 'utf-8'));
    if (fm && !fm.error) {
      const data = { project_name: projName, files: {} };
      for (const f of REQUIRED) data.files[f] = files.includes(f);
      if (validateFn(data)) { log('Schema OK', 'ok'); pass++; }
      else { log('Schema fail: ' + JSON.stringify(validateFn.errors), 'fail'); fail++; }
    } else { log('No frontmatter in brief', 'warn'); warn++; }
  }
} catch(e) { log('Schema error: ' + e.message, 'fail'); fail++; }

console.log('');
console.log('='.repeat(40));
console.log(B + ' Results' + RE);
console.log(' ' + G + pass + ' passed' + RE);
console.log(' ' + R + fail + ' failed' + RE);
console.log(' ' + Y + warn + ' warnings' + RE);
console.log('='.repeat(40));
process.exit(fail > 0 ? 1 : 0);
