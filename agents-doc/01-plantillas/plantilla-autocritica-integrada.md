# Plantilla: Auto-Crítica Integrada

> Usa esta plantilla cuando quieras que el agente se critique a sí mismo **antes** de mostrarte la respuesta final. Reduce drásticamente la cantidad de correcciones que tienes que hacer manualmente.

---

## Por qué la auto-crítica integrada es poderosa

La mayoría de los agentes generan una respuesta y la muestran directamente. Esto genera:

- Errores que se detectan tarde
- Suposiciones que solo se revelan después de revisar
- Falta de alineación con la instrucción original

Con auto-crítica integrada el agente:

1. Genera un borrador interno (no lo muestra).
2. Aplica una checklist rigurosa contra la instrucción original.
3. Corrige los problemas detectados.
4. Solo entonces presenta la respuesta final.

**Combinada con el Principio de No Generación Sin Orden**, se convierte en una de las técnicas más efectivas para obtener respuestas de alta calidad en el primer intento.

---

## Prompt listo para copiar y pegar

```
Actúa como ingeniero de software senior con alto estándar de calidad.

Voy a darte una tarea. Debes aplicar AUTO-CRÍTICA INTEGRADA antes de mostrar cualquier respuesta final.

## Proceso obligatorio de auto-crítica (NO lo saltes):

1. **Genera primero un borrador completo internamente** (no lo muestres al usuario todavía).
2. **Aplica esta checklist de calidad** al borrador (responde mentalmente cada punto):

   - ¿Cumple EXACTAMENTE con lo que el usuario pidió? (no agregué ni quité nada)
   - ¿Hay suposiciones que no fueron validadas?
   - ¿El razonamiento es completo y sin saltos lógicos?
   - ¿Hay errores técnicos, inconsistencias o casos edge que no consideré?
   - ¿La respuesta es clara, accionable y bien estructurada?
   - ¿Respeto el Principio de No Generación Sin Orden? (solo hice lo que se pidió explícitamente)
   - ¿Hay algo que deba preguntar antes de dar la respuesta final?

3. **Corrige todos los problemas** detectados en el borrador.
4. **Solo después de completar la auto-crítica**, muestra la respuesta final al usuario.
5. En la respuesta final, puedes mencionar brevemente: "Realicé auto-crítica interna y corregí X puntos antes de presentarte esto."

## Tarea concreta:

[PEGAR AQUÍ EXACTAMENTE LO QUE QUIERES QUE HAGA]

## Contexto adicional (si aplica):

- [contexto relevante del proyecto]
- [instrucciones previas importantes]

**Regla de oro**: 
- Nunca muestres el borrador.
- Nunca entregues una respuesta que no haya pasado por auto-crítica completa.
- Si después de la auto-crítica detectas que falta información crítica, pregúntame antes de responder.
```

---

## Variante corta (para pegar después de otros prompts)

```
Aplica AUTO-CRÍTICA INTEGRADA antes de responder:
1. Genera borrador interno completo.
2. Revisa contra la instrucción original usando la checklist de calidad.
3. Corrige todo lo que encuentres.
4. Solo entonces muestra la respuesta final.
5. Menciona brevemente qué corregiste.
```

---

## Notas de uso

- **Úsala en casi todas las respuestas importantes**, especialmente cuando el agente va a:
  - Proponer arquitectura o decisiones técnicas
  - Escribir especificaciones (SDD)
  - Generar código de implementación
  - Hacer revisiones o análisis
- Es una de las técnicas de mayor retorno por costo de tokens.
- Combínala siempre con el **Principio de No Generación Sin Orden**.
- El agente puede tardar un poco más (es normal y deseable).

### Checklist extendida (opcional, para tareas críticas)

Puedes pegar esta versión más larga cuando la tarea sea muy importante:

```
Checklist de auto-crítica extendida:
- Fidelidad a la instrucción original (¿hice exactamente lo pedido?)
- Cobertura de casos edge y errores
- Consistencia con arquitectura y decisiones previas
- Claridad y accionabilidad
- Ausencia de funcionalidades extras no solicitadas
- Calidad del razonamiento y justificación
- Respeto al Principio de No Generación
```

---

## Integración con el resto de la metodología

- **Principio de No Generación Sin Orden**: La auto-crítica es el último filtro de calidad antes de que el agente entregue algo. Refuerza fuertemente el principio.
- **Plantilla de Razonamiento Estructurado**: Úsalas juntas. Primero razona estructuradamente, luego aplica auto-crítica al resultado (`plantilla-razonamiento-estructurado.md`).
- **Plantilla SDD**: Excelente para que el agente revise su propia especificación antes de entregártela.
- **Guía TDD con Agentes**: Puede integrarse en cada fase (Red / Green / Refactor) para que el agente se autocritique antes de mostrar los tests o la implementación.
- **Orchestrator**: El Orchestrator puede pedir a un agente que haga auto-crítica antes de entregar el resultado al siguiente agente o al usuario.
- **Verification Agent**: El Verification Agent puede usar una versión similar de esta checklist para auditar el trabajo de otros agentes.

Esta plantilla es una de las que más impacto tiene en la reducción de iteraciones de corrección.
