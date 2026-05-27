---
title: Patrón - Orchestrator con Agentes de IA
type: patron
tags:
  - metodologia
  - patron
  - orchestrator
  - roles
aliases:
  - Orchestrator
  - Patrón Orchestrator
---

# Patrón: Orchestrator con Agentes de IA

> Cómo coordinar múltiples agentes especializados para proyectos grandes, manteniendo control, coherencia y el Principio de No Generación Sin Orden.

---

## ¿Qué es el Patrón Orchestrator?

El Orchestrator es un rol (puede ser un humano o un agente dedicado) que:

- Descompone un proyecto grande en tareas específicas
- Asigna cada tarea al agente especializado correcto
- Coordina el handoff de información entre agentes
- Mantiene el estado global del proyecto
- Asegura que **ningún agente viole el Principio de No Generación Sin Orden**

Es especialmente útil cuando:
- El proyecto tiene más de 4-5 módulos concurrentes
- Necesitas diferentes especialidades (arquitecto, developer, reviewer, QA, devops)
- Quieres paralelizar trabajo sin perder coherencia
- Un solo chat se vuelve demasiado largo y desordenado

---

## Roles típicos en un setup con Orchestrator

| Rol | Responsabilidad principal | Cuándo usarlo |
|-----|---------------------------|---------------|
| **Orchestrator** | Descomponer, asignar, coordinar, mantener estado global | Siempre en proyectos medianos/grandes |
| **Arquitecto** | Diseñar arquitectura, definir interfaces, identificar riesgos | Fase inicial + cuando hay cambios estructurales |
| **Developer Senior** | Implementar módulos siguiendo arquitectura aprobada | Durante implementación por módulo |
| **Code Reviewer** | Revisión crítica de código generado | Después de cada implementación |
| **QA Engineer** | Diseñar estrategia de tests, generar tests de calidad | Junto con implementación o después |
| **Technical Writer** | Documentación, READMEs, guías de uso | Al final de cada módulo o release |
| **DevOps / Infra** | Pipelines, despliegue, monitoreo | Cuando se acerca a producción |
| **Verification Agent** | Auditar que el trabajo de otros agentes cumple **exactamente** la instrucción original (fidelidad, no calidad) | Después de cada entrega importante de otro agente |

---

## Estructura recomendada de trabajo con Orchestrator

```
Proyecto
├── Chat Orchestrator (único, de larga duración)
│   ├── Mantiene el estado global actualizado
│   ├── Asigna tareas a agentes especializados
│   └── Recibe resultados y actualiza backlog
│
├── Chat Arquitecto (temporal)
│   └── Solo para fases de diseño
│
├── Chat Developer-Modulo-X (temporal)
│   └── Implementación de un módulo específico + TDD
│
├── Chat Reviewer-Modulo-X (temporal)
│   └── Revisión crítica
│
└── Chat QA-Modulo-X (temporal)
    └── Tests y estrategia de validación
```

**Regla clave**: Cada chat especializado **debe empezar** con el Principio de No Generación activado + el contexto relevante del Orchestrator.

---

## Formato de Handoff (entre Orchestrator y agentes especializados)

Cuando el Orchestrator le pasa una tarea a otro agente, debe usar este formato:

```
## Tarea asignada por el Orchestrator

**Rol que debes asumir**: Developer Senior (o QA, Reviewer, etc.)

**Módulo / Tarea**: Autenticación con JWT

**Contexto del proyecto**:
- [Pega aquí el estado actual del proyecto desde el Orchestrator]
- Arquitectura aprobada: ...
- Decisiones relevantes: ...

**Resultado esperado**:
- [Lista concreta de entregables]

**Restricciones obligatorias**:
- Sigue el Principio de No Generación Sin Orden (ver principio-no-generacion-sin-orden.md)
- No generes nada que no esté explícitamente pedido en esta tarea
- Al terminar, devuelve un resumen actualizado del estado para que el Orchestrator lo integre

**Próximo paso después de que termines**:
Devuélveme el resultado + estado actualizado para que yo (Orchestrator) lo integre y asigne la siguiente tarea.
```

---

## Cómo mantener el estado global (responsabilidad del Orchestrator)

El Orchestrator debe mantener un documento vivo (puede ser un archivo markdown o notas en el chat) con:

- Estado actual del proyecto (qué módulos están en qué fase)
- Arquitectura aprobada (versión actual)
- Decisiones técnicas tomadas
- Backlog priorizado
- Riesgos abiertos
- Agentes que están trabajando actualmente y en qué

Cada vez que un agente especializado termina una tarea, el Orchestrator actualiza este estado antes de asignar la siguiente.

---

## Prompt para activar un Orchestrator

```
Actúa como Orchestrator senior de desarrollo con agentes de IA.

Tu único trabajo es coordinar. **Nunca implementes código tú mismo** a menos que te lo ordene explícitamente.

## Reglas estrictas del rol de Orchestrator
1. Descomponer el trabajo en tareas pequeñas y asignables.
2. Asignar cada tarea al rol especializado correcto.
3. **Siempre** pasar contexto completo + activar el Principio de No Generación en cada handoff.
4. Recibir resultados, integrarlos al estado global y actualizar el backlog.
5. Nunca dejar que un agente especializado haga algo fuera de su tarea asignada.
6. Si un agente viola el Principio de No Generación, corregirlo inmediatamente y reiniciar esa tarea.

## Estado actual del proyecto
[Pegar estado completo]

## Objetivo actual
[Qué se quiere lograr en esta sesión]

Empieza por proponerme un plan de descomposición de tareas y a qué roles las asignarías.
```

---

## Cuándo NO usar Orchestrator

- Proyectos pequeños (1-3 módulos) → un solo desarrollador + chats temporales es suficiente.
- Cuando el usuario aún está definiendo el alcance (mejor un solo chat exploratorio).
- Si no hay tiempo para mantener el estado global actualizado (el Orchestrator requiere disciplina).

---

## Combinación recomendada con otras prácticas

- **Principio de No Generación Sin Orden**: Obligatorio en todos los handoffs.
- **TDD**: El Orchestrator puede asignar "Escribir tests (Red)" a un agente y luego "Implementar (Green)" a otro (o al mismo).
- **Gestión de Contexto v2**: Usa `plantilla-gestion-contexto-v2.md` para mantener el estado global del Orchestrator de forma eficiente.
- **Razonamiento Estructurado + Suposiciones**: El Orchestrator debe exigir que los agentes usen `plantilla-razonamiento-estructurado.md` y `plantilla-suposiciones-explicitas.md` en tareas complejas antes de entregar.
- **Formatos de Salida Estructurados**: Recomienda fuertemente `plantilla-formato-salida-estructurado.md` para que los handoffs entre agentes sean fáciles de consumir.
- **Verification Agent**: Después de entregas importantes, el Orchestrator debe asignar un Verification Agent para auditar fidelidad antes de considerar la tarea completada.
- **Auto-Crítica**: Pide a los agentes que usen `plantilla-autocritica-integrada.md` antes de entregar resultados al Orchestrator.
- **Checklist de Validación**: El Orchestrator es responsable de que cada módulo pase la checklist antes de considerarse terminado.

---

## Notas de uso

- El Orchestrator puede ser un humano o un agente dedicado. En proyectos muy grandes, un humano como Orchestrator + agentes especializados suele dar mejores resultados.
- Documenta las decisiones de coordinación. El estado global es el activo más valioso del Orchestrator.
- Si un agente especializado empieza a "salirse del carril", el Orchestrator debe intervenir rápido: "Detente. Estás violando tu asignación. Solo haz X."

Este patrón escala muy bien cuando se combina con el Principio de No Generación y una buena disciplina de handoff.
