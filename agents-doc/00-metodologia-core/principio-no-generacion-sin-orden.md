---
title: Principio Fundamental - No Generación Sin Orden Explícita
type: principio
tags:
  - metodologia
  - core
  - no-generacion
aliases:
  - Principio de No Generación
  - No Generación Sin Orden
---

# Principio Fundamental: No Generación Sin Orden Explícita

> **Regla de oro**: El agente **nunca** genera código, decisiones técnicas, funcionalidades, arquitectura ni nada que no haya sido explícitamente ordenado por el usuario. Ante la más mínima duda o ambigüedad, el agente debe preguntar antes de actuar.

Este principio es la base para obtener resultados predecibles, controlados y de alta calidad al trabajar con agentes de IA.

---

## Por qué este principio es crítico

| Sin el principio | Con el principio |
|------------------|------------------|
| El agente "completa" lo que cree que quieres | El agente solo hace exactamente lo que pediste |
| Aparecen funcionalidades no solicitadas | El alcance se mantiene controlado |
| Decisiones técnicas se toman sin tu aprobación | Tú controlas cada decisión importante |
| El proyecto deriva y crece sin control | El proyecto avanza solo en la dirección que tú defines |
| Pierdes tiempo revisando cosas que no pediste | Cada respuesta es accionable y relevante |

---

## Prompt de activación del principio (copia y pega al inicio de cada chat)

```
Actúa siguiendo estrictamente el PRINCIPIO DE NO GENERACIÓN SIN ORDEN.

## Reglas obligatorias que debes seguir SIEMPRE:

1. **Nunca generes código, ni una sola línea**, a menos que te lo ordene explícitamente.
2. **Nunca propongas funcionalidades, mejoras o cambios** que no te haya pedido.
3. **Nunca tomes decisiones técnicas** (arquitectura, librerías, patrones, etc.) sin mi aprobación previa.
4. **Si falta información, tienes dudas, o hay ambigüedad**: PREGUNTA antes de hacer cualquier cosa.
5. **Si algo no está en el alcance explícito**: No lo hagas. Pregunta si quieres que lo incluya.
6. **Si crees que algo sería "buena idea"**: No lo implementes. Mencióname la idea y espera mi orden.
7. **Responde solo a lo que se te pidió**. Si terminas la tarea solicitada, detente y pregunta "¿Qué quieres que haga ahora?"

## Mi instrucción actual es:

[PEGAR AQUÍ LO QUE QUIERES QUE HAGA EN ESTE CHAT]

Si necesitas cualquier aclaración antes de proceder, pregúntame ahora.
```

---

## Variante corta (para pegar después de otros prompts)

```
RECUERDA Y APLICA SIEMPRE: Principio de No Generación Sin Orden.
- Solo haz exactamente lo que te ordené.
- Si tienes cualquier duda o falta contexto, pregunta antes de generar cualquier cosa.
- No propongas ni implementes nada que no te haya pedido explícitamente.
```

---

## Cómo aplicarlo en la práctica

### Durante la fase de descubrimiento / arquitectura
- Pide al agente que **haga preguntas** hasta que todo esté claro.
- No aceptes un diseño hasta que hayas respondido todas sus dudas.
- Ejemplo de instrucción: "Antes de proponer la arquitectura, hazme todas las preguntas que necesites para entender el dominio y las restricciones."

### Durante la implementación
- Ordena explícitamente: "Ahora implementa el módulo de autenticación".
- Nunca digas "haz lo que creas mejor".
- Si el agente pregunta "¿Puedo usar JWT o prefieres sesiones?", responde antes de que genere código.

### Durante revisiones
- El agente solo puede sugerir cambios si le pides "revisa y propón mejoras".
- Aún así, debe listar las propuestas y esperar tu aprobación antes de modificar código.

### Cuando el agente se "emociona" y propone extras
Respuesta estándar del usuario:
> "Agradezco la idea, pero por ahora **no la implementes**. Anótala en el backlog de futuras mejoras y continúa solo con lo que te pedí."

---

## Surfacing de Suposiciones (Práctica Recomendada)

El Principio de No Generación es poderoso, pero se vuelve aún más efectivo cuando se combina con **Surfacing de Suposiciones Explícitas**.

Muchos errores graves no vienen de generar sin orden, sino de **suposiciones ocultas** que el agente hace sin decírtelo (sobre el dominio, datos, comportamiento, stack, concurrencia, etc.).

### Cómo aplicarlo

1. Antes de que el agente proponga o implemente algo complejo, pídele que liste **todas** las suposiciones que está haciendo.
2. Usa la plantilla dedicada: `[[01-plantillas/plantilla-suposiciones-explicitas.md]]`
3. Revisa la lista y corrige/aprueba explícitamente las suposiciones antes de permitir que avance.

### Frases recomendadas para el usuario

- "Antes de proponer nada, lista todas las suposiciones que estás haciendo (dominio, técnico, datos, alcance)."
- "Aplica surfacing de suposiciones explícitas usando la plantilla correspondiente." [[01-plantillas/plantilla-suposiciones-explicitas.md]]
- "No asumas nada. Saca a la luz todas tus suposiciones antes de seguir."

Esta práctica reduce drásticamente las "sorpresas" tardías y es especialmente valiosa en arquitectura, SDD y módulos con lógica de negocio compleja.

---

## Frases que el usuario puede usar para reforzar el principio

- "Pregúntame todo lo que necesites antes de proponer nada."
- "No asumas nada. Si no está explícito, pregunta."
- "Solo responde a lo que te pedí. No agregues nada más."
- "Detente. No generes código todavía. Primero aclaremos X."
- "Confirma antes de implementar."

---

## Notas de uso

- **Úsalo al principio de TODOS los chats**. Es el mejor seguro contra deriva.
- **Combínalo** con la plantilla de gestión de contexto cuando retomes un proyecto.
- **No es negociable**. Si el agente viola este principio repetidamente, empieza un nuevo chat con el prompt de activación más explícito.
- Este principio es compatible con TDD, SDD y Orchestrator (se pueden combinar más adelante).

### Ejemplo de buen comportamiento del agente

Usuario: "Quiero agregar autenticación."

Agente (correcto):
> Para implementar autenticación necesito aclarar varios puntos antes de proponer o generar cualquier cosa:
> 1. ¿Qué método de autenticación prefieres? (email/password, OAuth, magic links, etc.)
> 2. ¿Qué framework de backend estás usando?
> 3. ¿Necesitas roles y permisos en esta fase o solo login básico?
> ...

Agente (incorrecto):
> "Voy a implementar autenticación con JWT usando bcrypt y una tabla users en PostgreSQL. Aquí está el código..."

---

## Integración recomendada con el resto de la metodología

- Fase 0 (Descubrimiento): Activa siempre el principio + haz que el agente pregunte hasta tener toda la información.
- Fase 1 (Arquitectura): El agente propone, **tú apruebas**, solo entonces se avanza. Combínalo con `[[01-plantillas/plantilla-razonamiento-estructurado.md]]` y `[[01-plantillas/plantilla-suposiciones-explicitas.md]]`.
- Fase 3 (Implementación por módulo): Orden explícita + principio activado = "Ahora implementa solo el módulo X siguiendo la arquitectura aprobada". Usa `[[01-plantillas/plantilla-autocritica-integrada.md]]` antes de aceptar entregas.
- Después de cada módulo: Usa la checklist, pero **nunca** permitas que el agente agregue "cosas extras que quedaron pendientes".
- Mejores resultados: Activa siempre **Principio de No Generación + Razonamiento Estructurado + Auto-Crítica + Surfacing de Suposiciones** en tareas importantes.
