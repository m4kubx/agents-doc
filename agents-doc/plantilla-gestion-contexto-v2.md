# Plantilla: Gestion Avanzada de Contexto (v2)

> Evolución de la gestión de contexto. Usa esta versión cuando el proyecto sea grande, lleve varios chats o necesites mantener un "Memory Bank" vivo y eficiente. Reduce ruido, desperdicio de tokens y distracciones del agente.

---

## Por qué necesitamos una versión avanzada

La plantilla básica de gestión de contexto es buena para proyectos medianos. Sin embargo, en proyectos grandes o de larga duración aparecen problemas:

- El contexto se vuelve un "dump" gigante y plano
- El agente se distrae con información antigua o irrelevante
- Se desperdician miles de tokens en cada nuevo chat
- No hay mecanismo para que el agente filtre solo lo relevante para la tarea actual
- No existe un "conocimiento vivo del proyecto" que evolucione

Esta v2 introduce técnicas de **Context Engineering** avanzado.

---

## Conceptos clave de la v2

| Concepto              | Descripción |
|-----------------------|-----------|
| **Memory Bank**       | Base de conocimiento estructurada del proyecto que vive y se actualiza (no es solo un dump de chat) |
| **Context Filtering** | El agente propone activamente qué contexto es relevante para la tarea actual y qué puede ignorarse |
| **Capas de Contexto** | Executive Summary (siempre presente) + Detailed Context (por módulo) + Recent Changes (últimas sesiones) + Archived (referencia solo cuando se necesita) |
| **Token Budget**      | Instrucciones explícitas para que el agente mantenga el contexto dentro de límites razonables |

---

## Prompt listo para copiar y pegar (versión completa v2)

```
Actúa como desarrollador senior experto en gestión eficiente de contexto y memoria de proyectos.

Vamos a retomar / continuar un proyecto usando GESTIÓN AVANZADA DE CONTEXTO v2.

## Estructura del contexto que debes usar SIEMPRE

### 1. Executive Summary (siempre visible - máximo 15-20 líneas)
- Nombre del sistema y propósito principal
- Stack y arquitectura actual aprobada (1-2 líneas)
- Estado general del proyecto (qué porcentaje está completo, en qué fase estamos)
- Módulos principales completados vs en progreso
- 3-5 decisiones técnicas más importantes tomadas hasta ahora
- Riesgos abiertos críticos (si los hay)

### 2. Memory Bank / Base de Conocimiento del Proyecto (vivo)
Mantén y actualiza estas secciones como "memoria viva" del proyecto:

**Decisiones Técnicas Aprobadas** (solo las definitivas, con fecha aproximada y razón)
- [Decisión] - [por qué se tomó] - [fecha aproximada]

**Supuestos Actuales del Proyecto** (lista viva - se actualiza cuando cambian)
- [Supuesto] - [estado: vigente / cuestionado / invalidado]

**Reglas de Arquitectura y Convenciones** (las que no deben violarse)
- [Regla 1]
- [Regla 2]

**Glosario de Términos del Dominio** (solo los importantes)
- [Término]: definición breve

**Backlog Estratégico** (solo lo importante, no cada tarea menor)
- Alta prioridad: ...
- Media prioridad: ...

### 3. Contexto de la Sesión Actual / Módulo Actual
- Qué se está trabajando ahora (módulo o funcionalidad)
- Qué se completó en los últimos 1-3 chats
- Cambios recientes importantes (código, decisiones, specs)
- Preguntas abiertas específicas de esta sesión

### 4. Instrucciones de Filtrado de Contexto (obligatorias)
Antes de responder a cualquier tarea, haz lo siguiente:

1. Identifica qué partes del contexto anterior son **realmente relevantes** para la tarea actual.
2. Ignora explícitamente (menciona brevemente) qué partes del contexto puedes ignorar porque no aplican.
3. Si necesitas información que no está aquí, pregúntame antes de asumir.
4. Mantén tu respuesta dentro de un presupuesto razonable de tokens (no repitas todo el contexto en cada respuesta).

## Estado actual del proyecto (copia y completa esto al inicio de cada chat)

**Executive Summary:**
[Sistema] - [stack] - [estado general]

**Módulos completados:**
- ...

**Módulo en progreso:**
- ...

**Decisiones técnicas clave:**
- ...

**Supuestos actuales:**
- ...

**Riesgos abiertos:**
- ...

## Tarea actual de esta sesión

[Describe exactamente qué quieres que haga en ESTE chat]

**Recuerda aplicar siempre**:
- Principio de No Generación Sin Orden
- Razonamiento Estructurado cuando la tarea sea compleja
- Auto-crítica antes de entregar la respuesta final
```

---

## Variante corta (para chats de seguimiento rápido)

```
Usando Gestión de Contexto v2.

Executive Summary actual:
[Sistema] - [stack] - [módulo en progreso]

Memory Bank relevante para esta tarea:
[pegar solo las secciones que importan]

Tarea de hoy:
[exacta]

Filtra el contexto: solo usa lo relevante para esta tarea. Ignora el resto.
```

---

## Notas de uso

- **Copia el prompt completo** al inicio de cada nuevo chat importante.
- **Actualiza el Memory Bank** al final de cada sesión significativa (decisiones, supuestos que cambian, nuevas convenciones).
- **Usa Context Filtering activamente**: el agente debe decirte qué contexto está usando y qué está ignorando.
- **Mantén el Executive Summary actualizado** - es lo más valioso para retomar después de semanas.
- Recomendado: guarda el último "Estado actual completo" en un archivo separado del proyecto (ej: `.context/project-state.md`) para no depender solo del chat.

### Cuándo seguir usando la versión básica
- Proyectos pequeños o de corta duración (< 2 semanas, pocos módulos).
- Cuando apenas estás empezando y aún no tienes muchas decisiones acumuladas.

---

## Integración con el resto de la metodología

- **Principio de No Generación**: Esta plantilla refuerza fuertemente "no asumas nada que no esté explícito en el contexto".
- **Plantilla de Razonamiento Estructurado**: Combínalas cuando la tarea actual sea compleja.
- **Plantilla de Suposiciones Explícitas**: El Memory Bank debe incluir una sección viva de supuestos que el agente debe revisar y actualizar.
- **Orchestrator**: El Orchestrator puede pedir a un agente que primero haga "Context Filtering" antes de asignarle una tarea grande.
- **Verification Agent** (futuro): Puede verificar que el agente esté respetando el contexto filtrado y no esté ignorando información crítica.

Esta versión representa un salto importante en la capacidad de mantener proyectos grandes con múltiples agentes y muchos chats sin perder calidad ni control.
