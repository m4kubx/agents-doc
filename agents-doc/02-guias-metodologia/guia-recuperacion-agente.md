# Guía: Recuperación de Errores y Alucinaciones del Agente

> Playbook estandarizado para cuando el agente se sale del carril, alucina, viola el Principio de No Generación o genera trabajo de baja calidad. Incluye protocolos de recuperación rápidos y efectivos.

---

## Cuándo usar esta guía

Usa estos protocolos cuando ocurra cualquiera de estos síntomas:

- El agente genera código o funcionalidades que nunca pediste.
- El agente ignora el contexto o suposiciones que ya habías aclarado.
- El agente viola repetidamente el Principio de No Generación.
- La calidad de la salida es muy baja a pesar de buenos prompts.
- El agente entra en un loop de errores o justificaciones.
- El agente "se emociona" y propone cambios grandes no solicitados.

---

## Protocolo General de Recuperación (4 pasos)

### Paso 1: Detener inmediatamente
No sigas la conversación en el mismo hilo si el daño ya está hecho.

Frase estándar:
> "Detente. Estás violando el Principio de No Generación. No generes ni propongas nada más hasta nuevo aviso."

### Paso 2: Diagnosticar el problema
Responde estas preguntas (puedes pedirle al agente que te ayude a listarlas, pero no le permitas corregir todavía):

- ¿Qué instrucción exacta le di?
- ¿Qué hizo el agente que no estaba en la instrucción?
- ¿En qué momento empezó a desviarse?
- ¿Hay contexto faltante o suposiciones que el agente hizo?

### Paso 3: Elegir estrategia de recuperación

| Tipo de problema                  | Estrategia recomendada                          | Cuándo usarla |
|-----------------------------------|--------------------------------------------------|-------------|
| Generó código sin orden           | Reiniciar chat + contexto limpio                | Siempre que sea posible |
| Ignoró suposiciones o decisiones  | Nuevo chat + Memory Bank actualizado + Suposiciones explícitas | Cuando hay mucho contexto acumulado |
| Calidad muy baja repetida         | Cambiar de modelo o rol + Auto-crítica forzada  | Cuando el modelo actual está fallando |
| Loop de errores / justificaciones | Nuevo chat + prompt mucho más estricto          | Cuando el agente se defiende en vez de corregir |
| Violación grave del principio     | Nuevo chat + rol más restrictivo (Verification Agent primero) | Siempre en violaciones graves |

### Paso 4: Ejecutar recuperación y documentar

- Crea un nuevo chat (recomendado en la mayoría de casos).
- Pega el contexto actualizado usando `plantilla-gestion-contexto-v2.md`.
- Activa explícitamente el Principio de No Generación + Auto-Crítica.
- Si es necesario, asigna primero un **Verification Agent** para auditar lo que se hizo mal antes de continuar.

---

## Prompts de Recuperación Listos para Usar

### Recuperación básica (nuevo chat)

```
Actúa como developer senior.

Principio de No Generación activado al 100%.

Vamos a recuperar un chat anterior que se desvió.

## Estado actual del proyecto (copia completa del Memory Bank):

[pegar estado de plantilla-gestion-contexto-v2.md]

## Qué salió mal en el chat anterior:
- El agente [describir exactamente la violación o error].

## Instrucción estricta para este chat:
- Solo harás exactamente lo que te pida en este mensaje.
- Antes de cualquier acción, listarás suposiciones usando plantilla-suposiciones-explicitas.md.
- Aplicarás auto-crítica integrada antes de mostrar cualquier resultado.
- Si tienes cualquier duda, preguntas. No asumes.

Tarea actual: [describe con máxima precisión qué quieres que haga AHORA]
```

### Recuperación con Verification Agent primero

```
Primero actúa como Verification Agent (Auditor de Fidelidad).

Tu tarea es auditar el trabajo del chat anterior contra la instrucción original que le di.

Instrucción original que le di:
[pegar instrucción exacta del chat anterior]

Lo que el agente entregó:
[resumir o pegar lo más relevante]

Lista todas las desviaciones, cosas no pedidas, y violaciones al Principio de No Generación.

Después de tu auditoría, te diré cómo continuar.
```

### Recuperación de loop de justificaciones

```
Detente.

Estás en un patrón de justificaciones en vez de corregir.

Nuevo protocolo estricto para este chat:

1. No puedes explicar por qué hiciste algo mal.
2. Solo puedes decir "Entendido. ¿Qué quieres que haga ahora?" después de cada corrección.
3. Antes de generar cualquier cosa nueva, debes aplicar Auto-Crítica + Suposiciones explícitas.
4. Si violas estas reglas, el chat se reinicia nuevamente.

Estado actual: [pegar contexto limpio]

Tarea concreta: [solo lo que quieres ahora]
```

---

## Prevención (mejor que la recuperación)

Las mejores formas de evitar tener que usar esta guía:

- Siempre usa **plantilla-autocritica-integrada.md** en tareas importantes.
- Usa **plantilla-suposiciones-explicitas.md** antes de cualquier trabajo complejo.
- Mantén chats cortos y enfocados (un módulo o una decisión por chat).
- Usa **Verification Agent** regularmente como control de calidad.
- Cuando el agente empiece a proponer "buenas ideas", corta inmediatamente con la frase estándar.

---

## Integración con el resto de la metodología

- **Orchestrator**: El Orchestrator es el responsable principal de detectar desviaciones temprano y activar protocolos de recuperación.
- **Verification Agent**: Es la herramienta más poderosa de recuperación. Úsalo antes de permitir que un agente "corrija" su propio trabajo.
- **Principio de No Generación**: Toda recuperación debe empezar recordando y reforzando este principio.
- **Gestión de Contexto v2**: Siempre reinicia con el Memory Bank actualizado para que el nuevo chat no herede errores antiguos.

Esta guía convierte los momentos de frustración en procesos controlados y predecibles.
