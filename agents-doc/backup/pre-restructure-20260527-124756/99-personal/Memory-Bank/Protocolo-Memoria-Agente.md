---
title: Protocolo de Memoria para Agentes - Cómo usar este Vault como Memoria
type: memory
tags:
  - memory
  - protocolo
  - agente
last-updated: 2026-05-25
aliases:
  - Agent Memory Protocol
  - Cómo el Agente Debe Usar el Memory Bank
---

# Protocolo de Memoria para Agentes (Obligatorio)

Este documento define exactamente cómo cualquier agente (Kilo, Claude, etc.) debe usar este vault como memoria persistente y de alta calidad.

## Reglas de Oro

1. **Al inicio de cada sesión nueva en este vault**, el agente **DEBE** leer primero (usando herramientas de lectura):
   - `99-personal/Memory-Bank/Executive-Summary.md`
   - `99-personal/Memory-Bank/Decisiones-Tecnicas.md`
   - `99-personal/Memory-Bank/Supuestos-Actuales.md`
   - Cualquier Session-Log reciente relevante

2. **Antes de responder cualquier tarea**, el agente debe aplicar **filtrado de contexto** explícito (como describe la plantilla-gestion-contexto-v2).

3. **Al final de cada sesión o cambio importante**, el agente debe **actualizar** los archivos de Memory Bank (especialmente Executive Summary y Decisiones).

4. **Nunca** inventar información del proyecto. Si algo no está en el Memory Bank o en las notas enlazadas, **preguntar** antes de asumir.

5. Usar siempre **wikilinks** (`[[Nombre del Archivo]]`) cuando se refiera a otras notas del vault.

6. Cuando se cree nueva información importante, guardarla en el Memory Bank con el frontmatter correcto (`type: memory`).

## Estructura Recomendada de Memoria

- `Executive-Summary.md` → Siempre visible, máximo 20-25 líneas.
- `Decisiones-Tecnicas.md`
- `Supuestos-Actuales.md`
- `Reglas-Arquitectura.md` (cuando exista)
- `Glosario.md`
- `Session-Logs/` (carpeta con un archivo por sesión importante)

## Cómo Escribir en el Memory Bank

- Usa la misma calidad que cualquier otro documento de metodología.
- Añade fecha en `last-updated`.
- Mantén las secciones vivas (elimina lo obsoleto o márcalo como invalidado).
- Prefiere viñetas claras y tablas cuando sea útil.

Este protocolo es parte de la metodología agents-doc y debe respetarse.
