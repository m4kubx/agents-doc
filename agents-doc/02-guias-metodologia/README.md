---
title: Guía - Cómo Pedir Sistemas Complejos a un Agente de IA
type: guia
tags:
  - metodologia
  - guia
  - entrada
aliases:
  - Guía Principal
  - Cómo Pedir Sistemas a Agentes
---

# Guía: Cómo Pedir Sistemas Complejos a un Agente de IA

> **Un manual práctico para diseñar, planificar y construir software con asistentes de IA**

---

## Filosofía central

La mejor forma de pedir un sistema complejo a un agente **no es pedir codigo**, sino **dirigir un proceso de diseno e implementacion**.

Trata al agente como un arquitecto/desarrollador junior muy rapido, al que hay que darle:
- Contexto claro del negocio
- Restricciones explicitas
- Una estructura de trabajo por fases
- Revision constante

---

## Principio Fundamental (obligatorio)

> [!warning] Principio de No Generación Sin Orden
> **El agente NUNCA genera código, decisiones, funcionalidades ni nada que no le hayas ordenado explícitamente.**
>
> - Si tiene dudas ? debe preguntar.
> - Si quiere proponer algo ? debe pedir permiso primero.
> - Si falta información ? debe pedirla antes de actuar.
>
> Este principio está documentado en detalle en [[00-metodologia-core/principio-no-generacion-sin-orden.md]].
>
> **Recomendación fuerte**: Copia el "Prompt de activación del principio" al inicio de **todos** tus chats con agentes.

---

## Plantillas disponibles

Usa estas plantillas listas para copiar y pegar en cada fase (usa **wikilinks** para mejor integración en el vault):

| Plantilla | Cuando usarla |
|-----------|---------------|
| [[01-plantillas/plantilla-arquitectura.md]] | Fase 1: antes de escribir cualquier código |
| [[01-plantillas/plantilla-implementacion.md]] | Fase 3: para implementar un módulo específico |
| [[01-plantillas/plantilla-revision.md]] | Después de cada implementación |
| [[01-plantillas/plantilla-tests-automaticos.md]] | Junto con la implementación (alta prioridad) |
| [[01-plantillas/plantilla-gestion-contexto.md]] | Al iniciar cada nuevo chat del mismo proyecto (usa v2 para proyectos grandes) |
| [[02-guias-metodologia/guia-iteracion-refactorizacion.md]] | Cuando necesites mejorar código existente sin romperlo |
| [[principio-no-generacion-sin-orden]] | **Siempre** (principio fundamental) |
| [[guia-tdd-con-agentes]] | Cuando quieras aplicar TDD con agentes (recomendado) |
| [[plantilla-sdd]] | Antes de implementar lógica compleja (recomendado) |
| [[patron-orchestrator]] | Proyectos medianos/grandes con múltiples agentes |
| [[03-roles-agentes/matriz-roles-agentes.md]] | Cuando necesites elegir el rol correcto del agente |
| [[04-integraciones-herramientas/workflow-git-con-agentes.md]] | Siempre (control de versiones profesional) |
| [[04-integraciones-herramientas/ejemplos-por-stack.md]] | Para ver la metodología aplicada en stacks reales |

**Nuevas plantillas de alta eficiencia (recomendadas para uso frecuente):**
| Plantilla | Cuando usarla |
|-----------|---------------|
| [[01-plantillas/plantilla-razonamiento-estructurado.md]] | Antes de cualquier decisión compleja (arquitectura, debugging, SDD, tradeoffs) |
| [[01-plantillas/plantilla-autocritica-integrada.md]] | Antes de aceptar cualquier respuesta importante del agente |
| [[01-plantillas/plantilla-gestion-contexto-v2.md]] | Proyectos medianos/grandes o de larga duración (reemplaza a la v1) |
| [[01-plantillas/plantilla-suposiciones-explicitas.md]] | Antes de proponer o implementar cualquier funcionalidad con lógica de negocio |
| [[01-plantillas/plantilla-formato-salida-estructurado.md]] | Cuando necesites salidas consistentes, parseables o para handoff entre agentes |

**Guías y plantillas de soporte avanzado:**
| Recurso | Cuando usarla |
|---------|---------------|
| [02-guias-metodologia/guia-recuperacion-agente.md](02-guias-metodologia/guia-recuperacion-agente.md) | Cuando el agente se desvió, alucinó o violó el principio |
| [02-guias-metodologia/plantilla-prompt-optimizer.md](02-guias-metodologia/plantilla-prompt-optimizer.md) | Para mejorar continuamente tus prompts y los de tus agentes |
| [02-guias-metodologia/guia-eficiencia-avanzada.md](02-guias-metodologia/guia-eficiencia-avanzada.md) | Para entender el "por qué" de las técnicas avanzadas (usuarios experimentados) |

También actualiza regularmente tus prompts usando el optimizador y ten a mano la guía de recuperación para cuando algo se salga de control.

---

## Técnicas Avanzadas de Eficiencia (nuevo en 2026)

Estas técnicas de prompt engineering de alto impacto elevan significativamente la precisión y reducen iteraciones:

- **Razonamiento Estructurado Forzado** (`plantilla-razonamiento-estructurado.md`): Obliga al agente a pensar paso a paso + verificar cada paso antes de concluir. Reduce soluciones superficiales.
- **Auto-Crítica Integrada** (`plantilla-autocritica-integrada.md`): El agente genera borrador interno, se critica contra la instrucción original y corrige **antes** de mostrarte la respuesta.
- **Surfacing de Suposiciones** (`plantilla-suposiciones-explicitas.md`): Obliga al agente a listar **todas** las suposiciones (dominio, datos, técnicas) con riesgo antes de proponer. Evita sorpresas tardías.
- **Formatos de Salida Estructurados** (`plantilla-formato-salida-estructurado.md`): Fuerza schemas consistentes (JSON, tablas, secciones fijas) para que las salidas sean fáciles de consumir por humanos o por otros agentes.
- **Gestión de Contexto Avanzada** (`plantilla-gestion-contexto-v2.md`): Memory Bank vivo + context filtering + capas (Executive Summary + Detailed + Recent). Ideal para proyectos grandes.

**Recomendación**: Combina estas 5 técnicas + el Principio de No Generación para obtener el máximo nivel de control y calidad actualmente posible con agentes.

---

## Lo que NO funciona

| Error | Problema |
|---|---|
| Hazme un Uber / ERP / CRM completo | El agente improvisa y pierde coherencia |
| Quiero algo moderno, escalable y profesional | No es accionable - son terminos vagos |
| Mezclar decisiones (arquitectura + codigo + UI + DevOps) | Ruido y deriva en el agente |
| No poner limites ni restricciones | El agente inventa soluciones no deseadas |
| Cambiar requisitos sin actualizar el contexto | Rompe la coherencia del proyecto |
| Aceptar la primera respuesta sin revision | Bugs y deuda tecnica garantizados |
| Sobrecargar un solo chat infinito | Perdida de foco y calidad |
| No pedir tests | Errores obvios que se descubren tarde |
| Permitir que el agente genere o proponga sin orden explícita | El agente inventa funcionalidades, decide tecnologías y deriva el proyecto |

---

## Metodologia paso a paso

### Fase 0: Descubrimiento

Antes de escribir codigo, define:

| Elemento | Pregunta clave |
|---|---|
| Problema | Que problema resuelve el sistema? |
| Usuarios | Quien lo va a usar y que roles existen? |
| Funcionalidades obligatorias | Que es indispensable para el MVP? |
| Fuera de alcance | Que no entra en esta version? |
| Stack tecnologico | Que lenguajes, frameworks y herramientas? |
| Criterios de exito | Como sabras que esta bien hecho? |

### Fase 1: Arquitectura primero (el paso mas importante)

Pide al agente que disene antes de codificar:

1. Arquitectura general del sistema
2. Modulos y sus responsabilidades
3. Entidades de dominio y sus relaciones
4. APIs o interfaces principales
5. Flujos de datos criticos
6. Riesgos tecnicos identificados
7. Roadmap de implementacion por fases
8. Preguntas y supuestos

> **No dejes que el agente escriba codigo hasta que tu apruebes el diseno.**

### Fase 2: Divide el sistema en piezas pequenas

Un agente trabaja mucho mejor con piezas como:

- autenticacion
- modelo de datos
- API de usuarios
- dashboard principal
- sistema de permisos
- exportacion de reportes

Cada pieza debe incluir:
- Un objetivo claro
- Un modulo especifico
- Un resultado esperado
- Criterios de aceptacion

### Fase 3: Ciclo de trabajo por modulo

Para cada modulo, sigue este ciclo:

```
Plan > Revisar > Implementar > Probar > Ajustar
```

1. Pides plan del modulo
2. Revisas y corriges el enfoque
3. Pides implementacion del modulo
4. Pides tests que validen el modulo (usa plantilla-tests-automaticos.md)
5. Pides autocrítica: Que riesgos tiene esta solucion?
6. **Valida con la checklist antes de avanzar** (ver abajo)
7. Pasas al siguiente modulo (usa plantilla-gestion-contexto.md en el proximo chat)

### Checklist de Validacion por Modulo (obligatorio antes de avanzar)

Antes de marcar un modulo como terminado, verifica que se cumpla todo:

- [ ] Arquitectura del modulo aprobada y coherente con la arquitectura general
- [ ] Codigo implementado, documentado y siguiendo las convenciones del proyecto
- [ ] Tests automaticos implementados y pasando (cobertura minima acordada)
- [ ] Revision critica completada (usa plantilla-revision.md)
- [ ] Riesgos identificados, documentados y con plan de mitigacion
- [ ] Integracion verificada con modulos previos (no rompe nada existente)
- [ ] Estado actual del proyecto actualizado (para copiar a proximo chat)
- [ ] Backlog actualizado (tareas completadas y nuevas si surgieron)

Si algun item falla, no avances. Corrige primero.

---

## Objetivo Actual del Agente

**Misión principal**: Generar documentación profesional completa para desarrollo de software (modelo de negocio, stack tecnológico, esquema de base de datos, vistas UI, arquitectura, API, roadmap, etc.).

Ver:
- [[objetivo-agente-documentacion-software-profesional]]
- [[plantilla-generacion-especificacion-software-profesional]] (la plantilla principal a usar)

---

## Integración Recomendada: Obsidian

Esta metodología funciona excelentemente dentro de **Obsidian** como vault de conocimiento.

Se recomienda fuertemente usar la configuración "Vault dedicado + Git" descrita en:

? **[obsidian-setup.md](obsidian-setup.md)**

### Beneficios principales de usar Obsidian con agents-doc:

- Acceso rápido a todas las plantillas mediante **Templater**
- Búsquedas y dashboards potentes con **Dataview**
- Versionado automático de tus notas y ejemplos personales con **Obsidian Git**
- Visualización de flujos de Orchestrator y roles usando **Canvas**
- Todo el ecosistema (metodología oficial + tus proyectos) en un solo lugar versionado

El repositorio ya tiene git inicializado y un `.gitignore` optimizado para Obsidian.

Sigue la guía en `obsidian-setup.md` para configurar tu vault en menos de 10 minutos.

