# Plantilla: Optimizador de Prompts (Prompt Optimizer)

> Usa esta plantilla cuando quieras que el agente analice prompts anteriores (tuyos o de otros agentes) y proponga versiones significativamente más eficientes, precisas y robustas.

---

## Por qué usar un optimizador de prompts

Los prompts buenos se pueden volver excelentes con iteración. Esta plantilla convierte al agente en un "coach de prompts" que:

- Identifica ambigüedades, suposiciones y puntos débiles en tus prompts actuales.
- Propone versiones más estructuradas, cortas y efectivas.
- Sugiere incorporación de las técnicas avanzadas (razonamiento estructurado, auto-crítica, suposiciones, formatos, etc.).
- Reduce la cantidad de iteraciones que necesitas para obtener buenos resultados.

---

## Prompt listo para copiar y pegar

```
Actúa como experto senior en prompt engineering y optimización de interacciones con agentes de IA (nivel 2026).

Tu tarea es analizar y optimizar prompts.

## Instrucciones obligatorias:

1. Analiza el/los prompt(s) que te entrego.
2. Identifica problemas comunes:
   - Ambigüedades o instrucciones vagas
   - Falta de activación explícita del Principio de No Generación
   - Ausencia de técnicas avanzadas (razonamiento estructurado, auto-crítica, surfacing de suposiciones, formatos de salida)
   - Demasiado largo o con ruido innecesario
   - Falta de estructura clara (secciones, pasos, restricciones)
   - No incluye verificación o auto-crítica

3. Propone una versión optimizada usando el siguiente formato estructurado:

**Problemas detectados en el prompt original:**
- [lista clara]

**Versión optimizada (lista para copiar):**
```
[prompt mejorado completo aquí]
```

**Mejoras clave realizadas:**
- [explicación breve de cada cambio importante]
- Por qué cada cambio aumenta eficiencia o reduce errores

**Técnicas avanzadas recomendadas para agregar en el futuro:**
- [lista de plantillas que se deberían combinar con este prompt]

## Prompt(s) a optimizar:

[PEGAR AQUÍ EL O LOS PROMPTS QUE QUIERES MEJORAR]

**Contexto adicional (opcional):**
- Para qué tipo de tarea se usa este prompt normalmente
- Qué problemas has observado al usarlo
- Stack o dominio del proyecto (si aplica)
```

---

## Variante corta (para optimización rápida)

```
Actúa como experto en prompt engineering.

Optimiza este prompt siguiendo el formato de la plantilla-prompt-optimizer.md:

[pegar prompt]

Entrega solo:
- Problemas detectados (bullet points)
- Versión optimizada completa
- 3-4 mejoras clave con explicación
```

---

## Notas de uso

- **Úsala** cuando:
  - Tienes un prompt que usas frecuentemente pero los resultados son inconsistentes.
  - Quieres incorporar las nuevas técnicas avanzadas (2026) a tu flujo actual.
  - Estás entrenando a otras personas o equipos en el uso de agentes.
  - El agente está fallando repetidamente en un tipo de tarea específica.
- Puedes usarla tanto con prompts que tú escribes como con prompts que otros agentes generan.
- Recomendado: después de optimizar un prompt, guárdalo en tu "biblioteca personal de prompts" para reutilizar.

### Buenas prácticas
- Optimiza un prompt a la vez para obtener mejor calidad.
- Después de usar la versión optimizada varias veces, puedes volver a optimizarla (iteración continua).
- Combínala con la `guia-recuperacion-agente.md` cuando un prompt específico esté causando muchos problemas.

---

## Integración con el resto de la metodología

- **Todas las plantillas nuevas**: Esta plantilla es la herramienta meta que te ayuda a mejorar continuamente el uso de `plantilla-razonamiento-estructurado.md`, `plantilla-autocritica-integrada.md`, `plantilla-suposiciones-explicitas.md`, etc.
- **Orchestrator**: El Orchestrator puede usar esta plantilla para mejorar los prompts que envía a los agentes especializados.
- **Principio de No Generación**: El optimizador debe respetar el principio: solo propone mejoras al prompt, no ejecuta las tareas descritas en él.
- **Verification Agent**: Puedes pedirle al Verification Agent que evalúe si un prompt optimizado realmente produce mejores resultados de fidelidad.

Esta es una de las plantillas más poderosas para mejorar tu propio proceso de trabajo con agentes a largo plazo.
