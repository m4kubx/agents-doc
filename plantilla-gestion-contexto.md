# Plantilla: Gestion de Contexto entre Chats (v1 - Basica)

> **Versión legacy**. Para proyectos pequeños o de corta duración.
> 
> Para proyectos medianos/grandes o de larga duración, usa la versión avanzada:
> **plantilla-gestion-contexto-v2.md** (recomendada)
>
> Usala al iniciar un **nuevo chat** para continuar un proyecto sin perder contexto. Evita el error #6 (sobrecargar un solo chat).

---

## Prompt listo para copiar y pegar

```
Actua como desarrollador senior que retoma un proyecto existente.

## Estado actual del proyecto

**Sistema:** [nombre del sistema]
**Stack:** [tecnologias principales]
**Arquitectura aprobada:** [breve descripcion de 2-3 lineas]

**Modulos ya completados y aprobados:**
- [modulo 1] - [estado: OK / con deuda tecnica menor]
- [modulo 2] - [estado]

**Modulos en progreso:**
- [modulo actual] - [que falta]

**Decisiones tecnicas clave tomadas:**
- [decision 1: usamos X porque Y]
- [decision 2]

**Supuestos actuales:**
- [supuesto 1]
- [supuesto 2]

**Backlog de tareas pendientes (ordenadas por prioridad):**
1. [tarea de alta prioridad]
2. [tarea de media prioridad]
3. [tarea de baja prioridad]

**Riesgos abiertos:**
- [riesgo 1: descripcion y mitigacion propuesta]
- [riesgo 2]

**Preguntas abiertas / informacion faltante:**
- [pregunta 1]
- [pregunta 2]

## Instrucciones para este chat

1. **NO asumas nada** que no este en este contexto.
2. Si necesitas informacion que no esta aqui, preguntame antes de proponer soluciones.
3. Manten coherencia con la arquitectura y decisiones ya tomadas.
4. Al final de cada respuesta importante, actualiza el estado actual (modulos, decisiones, riesgos) para que pueda copiarlo al siguiente chat.

## Tarea actual

[Describe aqui exactamente que quieres que haga en ESTE chat, por ejemplo: "Implementar el modulo de autenticacion siguiendo la arquitectura aprobada"]
```

---

## Notas de uso

- **Copia este prompt al inicio de cada nuevo chat** relacionado con el mismo proyecto.
- **Manten actualizado el "Estado actual"** despues de cada modulo completado o decision importante.
- **Usa un solo chat por modulo o por tema** (ej: un chat para arquitectura, otro para autenticacion, otro para revision de seguridad).
- **Copia el estado actualizado** que el agente te de al final de la sesion para pegarlo en el siguiente chat.
- **No mezcles temas no relacionados** en el mismo chat aunque sea el mismo proyecto.

### Ejemplo de pregunta de seguimiento

> Antes de continuar, actualiza el "Estado actual del proyecto" completo con todo lo que hemos decidido e implementado hasta ahora, para que pueda copiarlo a un nuevo chat.
