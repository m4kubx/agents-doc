# Guia: Como pedir sistemas complejos a un agente de IA

> **Un manual practico para disenar, planificar y construir software con asistentes de IA**

---

## Filosofia central

La mejor forma de pedir un sistema complejo a un agente **no es pedir codigo**, sino **dirigir un proceso de diseno e implementacion**.

Trata al agente como un arquitecto/desarrollador junior muy rapido, al que hay que darle:
- Contexto claro del negocio
- Restricciones explicitas
- Una estructura de trabajo por fases
- Revision constante

---

## Principio Fundamental (obligatorio)

**El agente NUNCA genera cÛdigo, decisiones, funcionalidades ni nada que no le hayas ordenado explÌcitamente.**

- Si tiene dudas ? debe preguntar.
- Si quiere proponer algo ? debe pedir permiso primero.
- Si falta informaciÛn ? debe pedirla antes de actuar.

Este principio est· documentado en detalle en [principio-no-generacion-sin-orden.md](principio-no-generacion-sin-orden.md).

**RecomendaciÛn**: Copia el "Prompt de activaciÛn del principio" al inicio de **todos** tus chats con agentes.

---

## Plantillas disponibles

Usa estas plantillas listas para copiar y pegar en cada fase:

| Plantilla | Cuando usarla |
|-----------|---------------|
| [plantilla-arquitectura.md](plantilla-arquitectura.md) | Fase 1: antes de escribir cualquier codigo |
| [plantilla-implementacion.md](plantilla-implementacion.md) | Fase 3: para implementar un modulo especifico |
| [plantilla-revision.md](plantilla-revision.md) | Despues de cada implementacion |
| [plantilla-tests-automaticos.md](plantilla-tests-automaticos.md) | Junto con la implementacion (alta prioridad) |
| [plantilla-gestion-contexto.md](plantilla-gestion-contexto.md) | Al iniciar cada nuevo chat del mismo proyecto (usa v2 para proyectos grandes) |
| [guia-iteracion-refactorizacion.md](guia-iteracion-refactorizacion.md) | Cuando necesites mejorar codigo existente sin romperlo |
| [principio-no-generacion-sin-orden.md](principio-no-generacion-sin-orden.md) | **Siempre** (principio fundamental) |
| [guia-tdd-con-agentes.md](guia-tdd-con-agentes.md) | Cuando quieras aplicar TDD con agentes (recomendado) |
| [plantilla-sdd.md](plantilla-sdd.md) | Antes de implementar lÛgica compleja (recomendado) |
| [patron-orchestrator.md](patron-orchestrator.md) | Proyectos medianos/grandes con m˙ltiples agentes |
| [matriz-roles-agentes.md](matriz-roles-agentes.md) | Cuando necesites elegir el rol correcto del agente |
| [workflow-git-con-agentes.md](workflow-git-con-agentes.md) | Siempre (control de versiones profesional) |
| [ejemplos-por-stack.md](ejemplos-por-stack.md) | Para ver la metodologÌa aplicada en stacks reales |

**Nuevas plantillas de alta eficiencia (recomendadas para uso frecuente):**
| Plantilla | Cuando usarla |
|-----------|---------------|
| [plantilla-razonamiento-estructurado.md](plantilla-razonamiento-estructurado.md) | Antes de cualquier decisiÛn compleja (arquitectura, debugging, SDD, tradeoffs) |
| [plantilla-autocritica-integrada.md](plantilla-autocritica-integrada.md) | Antes de aceptar cualquier respuesta importante del agente |
| [plantilla-gestion-contexto-v2.md](plantilla-gestion-contexto-v2.md) | Proyectos medianos/grandes o de larga duraciÛn (reemplaza a la v1) |
| [plantilla-suposiciones-explicitas.md](plantilla-suposiciones-explicitas.md) | Antes de proponer o implementar cualquier funcionalidad con lÛgica de negocio |
| [plantilla-formato-salida-estructurado.md](plantilla-formato-salida-estructurado.md) | Cuando necesites salidas consistentes, parseables o para handoff entre agentes |

**GuÌas y plantillas de soporte avanzado:**
| Recurso | Cuando usarla |
|---------|---------------|
| [guia-recuperacion-agente.md](guia-recuperacion-agente.md) | Cuando el agente se desviÛ, alucinÛ o violÛ el principio |
| [plantilla-prompt-optimizer.md](plantilla-prompt-optimizer.md) | Para mejorar continuamente tus prompts y los de tus agentes |
| [guia-eficiencia-avanzada.md](guia-eficiencia-avanzada.md) | Para entender el "por quÈ" de las tÈcnicas avanzadas (usuarios experimentados) |

TambiÈn actualiza regularmente tus prompts usando el optimizador y ten a mano la guÌa de recuperaciÛn para cuando algo se salga de control.

---

## TÈcnicas Avanzadas de Eficiencia (nuevo en 2026)

Estas tÈcnicas de prompt engineering de alto impacto elevan significativamente la precisiÛn y reducen iteraciones:

- **Razonamiento Estructurado Forzado** (`plantilla-razonamiento-estructurado.md`): Obliga al agente a pensar paso a paso + verificar cada paso antes de concluir. Reduce soluciones superficiales.
- **Auto-CrÌtica Integrada** (`plantilla-autocritica-integrada.md`): El agente genera borrador interno, se critica contra la instrucciÛn original y corrige **antes** de mostrarte la respuesta.
- **Surfacing de Suposiciones** (`plantilla-suposiciones-explicitas.md`): Obliga al agente a listar **todas** las suposiciones (dominio, datos, tÈcnicas) con riesgo antes de proponer. Evita sorpresas tardÌas.
- **Formatos de Salida Estructurados** (`plantilla-formato-salida-estructurado.md`): Fuerza schemas consistentes (JSON, tablas, secciones fijas) para que las salidas sean f·ciles de consumir por humanos o por otros agentes.
- **GestiÛn de Contexto Avanzada** (`plantilla-gestion-contexto-v2.md`): Memory Bank vivo + context filtering + capas (Executive Summary + Detailed + Recent). Ideal para proyectos grandes.

**RecomendaciÛn**: Combina estas 5 tÈcnicas + el Principio de No GeneraciÛn para obtener el m·ximo nivel de control y calidad actualmente posible con agentes.

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
| Permitir que el agente genere o proponga sin orden explÌcita | El agente inventa funcionalidades, decide tecnologÌas y deriva el proyecto |

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
5. Pides autocrÌtica: Que riesgos tiene esta solucion?
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

## IntegraciÛn Recomendada: Obsidian

Esta metodologÌa funciona excelentemente dentro de **Obsidian** como vault de conocimiento.

Se recomienda fuertemente usar la configuraciÛn "Vault dedicado + Git" descrita en:

? **[obsidian-setup.md](obsidian-setup.md)**

### Beneficios principales de usar Obsidian con agents-doc:

- Acceso r·pido a todas las plantillas mediante **Templater**
- B˙squedas y dashboards potentes con **Dataview**
- Versionado autom·tico de tus notas y ejemplos personales con **Obsidian Git**
- VisualizaciÛn de flujos de Orchestrator y roles usando **Canvas**
- Todo el ecosistema (metodologÌa oficial + tus proyectos) en un solo lugar versionado

El repositorio ya tiene git inicializado y un `.gitignore` optimizado para Obsidian.

Sigue la guÌa en `obsidian-setup.md` para configurar tu vault en menos de 10 minutos.



---

## ‚òï Apoya el Proyecto

Si este proyecto te ha sido √∫til o te interesa, considera apoyarlo. ¬°Cualquier granito de arena ayuda a mantenerlo vivo!

| M√©todo | Info |
|--------|------|
| **Binance ID** | `237970558` |
| **PIX (Brasil)** | `inversionesjemabyte@gmail.com` |
| **QR Binance** | [![QR](https://api.qrserver.com/v1/create-qr-code/?size=80x80&data=https%3A%2F%2Fapp.binance.com%2Funi-qr%2FPvNsuEiD)](https://app.binance.com/uni-qr/PvNsuEiD) |
| **WhatsApp** | [wa.me/5541996625172](https://wa.me/5541996625172) |

¬°Gracias por tu apoyo! ‚ù§Ô∏è

