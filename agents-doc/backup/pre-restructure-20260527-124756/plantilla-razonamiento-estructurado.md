---
title: Plantilla - Razonamiento Estructurado Forzado
type: plantilla
tags:
  - metodologia
  - plantilla
  - razonamiento
fase: analisis
aliases:
  - Razonamiento Estructurado
---

# Plantilla: Razonamiento Estructurado Forzado

> Usa esta plantilla cuando la tarea requiera pensamiento profundo: decisiones de arquitectura, tradeoffs, debugging complejo, análisis de especificaciones o refactoring importante. **Fuerza** al agente a razonar paso a paso antes de proponer cualquier solución.

---

## Por qué usar razonamiento estructurado forzado

La mayoría de los errores y alucinaciones de los agentes ocurren porque "saltan" a una conclusión sin haber recorrido un proceso de razonamiento riguroso.

Esta plantilla obliga al agente a:

- Exponer su pensamiento completo (Chain of Thought).
- Verificar cada paso antes de avanzar (Verify Each Step).
- Considerar alternativas y tradeoffs de forma explícita.
- Reducir drásticamente las suposiciones ocultas.

**Impacto medible**: Mayor precisión en tareas complejas, menos iteraciones de corrección y mejor calidad de las decisiones técnicas.

---

## Prompt listo para copiar y pegar

```
Actúa como ingeniero de software senior experto en razonamiento riguroso.

Voy a darte una tarea compleja que requiere pensamiento profundo. Debes aplicar RAZONAMIENTO ESTRUCTURADO FORZADO antes de dar cualquier respuesta final.

## Reglas obligatorias de razonamiento (NO las omitas nunca):

1. **Piensa en voz alta paso a paso** (Chain of Thought). Cada paso debe ser explícito.
2. **Verifica cada paso** antes de pasar al siguiente (Verify Each Step). Si detectas un error o suposición débil, corrígelo inmediatamente.
3. Si la tarea involucra decisiones o alternativas, usa la técnica de Tree of Thoughts lite:
   - Genera al menos 2-3 caminos posibles.
   - Evalúa pros/contras de cada uno con una tabla.
   - Elige el mejor con justificación clara.
4. **Lista TODAS las suposiciones** que estás haciendo en cada paso importante (usa la plantilla de suposiciones si está disponible).
5. Nunca saltes a la "respuesta final" sin haber completado el proceso de razonamiento completo.
6. Al final, resume:
   - Las conclusiones principales
   - Las suposiciones más críticas
   - Los riesgos o tradeoffs que quedan abiertos

## Tipo de tarea (elige la variante más adecuada):

[ ] Decisión de arquitectura o tradeoff técnico
[ ] Debugging complejo o análisis de causa raíz
[ ] Análisis o refinamiento de especificación (SDD)
[ ] Refactoring de código existente
[ ] Evaluación de múltiples soluciones

## Tarea concreta:

[PEGAR AQUÍ LA TAREA EXACTA QUE QUIERES QUE ANALICE]

## Contexto del proyecto (si aplica):

- Sistema: [nombre]
- Stack: [tecnologías]
- Arquitectura actual: [breve]
- Decisiones previas relevantes: [lista]

**Importante**: 
- NO generes código todavía (a menos que te lo ordene explícitamente después).
- NO propongas soluciones finales hasta completar todo el razonamiento.
- Si necesitas más información o contexto, pregúntame durante el proceso de razonamiento.
```

---

## Variantes rápidas (para pegar después de otros prompts)

### Variante corta para arquitectura / tradeoffs
```
Aplica RAZONAMIENTO ESTRUCTURADO FORZADO:
1. Chain of Thought paso a paso.
2. Verifica cada paso.
3. Tabla de tradeoffs (al menos 3 alternativas).
4. Lista explícita de suposiciones.
5. Recomendación final con justificación.
```

### Variante para debugging
```
Aplica RAZONAMIENTO ESTRUCTURADO FORZADO para debugging:
1. Define el problema observado con precisión.
2. Lista hipótesis posibles ordenadas por probabilidad.
3. Para cada hipótesis: evidencia a favor / en contra.
4. Verifica cada paso.
5. Propón el siguiente experimento o acción más eficiente para confirmar.
```

---

## Notas de uso

- **Úsala siempre** antes de pedir decisiones de arquitectura, grandes refactorings o análisis de problemas difíciles.
- Combínala con el **Principio de No Generación Sin Orden**: el razonamiento puede ser extenso, pero la generación de código solo ocurre cuando se ordena explícitamente después.
- Es especialmente poderosa antes de usar la plantilla SDD o antes de pedir implementación.
- El agente puede tardar más en responder (es normal). La calidad del resultado compensa el tiempo extra.
- Puedes pedirle que use formato de tabla para tradeoffs o listas numeradas para pasos.

### Cuándo NO usarla
- Tareas simples y bien definidas (CRUD básico, correcciones menores).
- Cuando ya tienes una solución clara y solo quieres que la implemente.
- Spikes exploratorios rápidos (en esos casos es mejor no usar agentes para generar código final).

---

## Integración con el resto de la metodología

- **Principio de No Generación Sin Orden**: Esta plantilla es el "pensamiento" previo. La generación real solo viene después de la aprobación.
- **Auto-Crítica Integrada**: Combínalas siempre: primero razona estructuradamente, luego aplica auto-crítica al resultado antes de entregarlo (`plantilla-autocritica-integrada.md`).
- **Plantilla SDD**: Úsala antes de pedir la especificación formal para que el agente llegue con mejor calidad.
- **Plantilla de Suposiciones Explícitas**: Combínalas cuando el agente deba listar suposiciones como paso separado (`plantilla-suposiciones-explicitas.md`).
- **Guía TDD con Agentes**: Ideal antes de entrar en la fase Red de TDD para problemas complejos.
- **Orchestrator**: El Orchestrator puede asignar "Realizar razonamiento estructurado sobre X" como tarea separada antes de asignar implementación o SDD.
- **Verification Agent**: El Verification Agent puede usar esta misma plantilla para verificar el razonamiento de otros agentes.

Esta plantilla representa una de las mejoras de mayor impacto en la eficiencia cognitiva del agente.
