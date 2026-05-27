# Guía: Técnicas Avanzadas de Eficiencia para Agentes (2026)

> Explicación del "por qué" detrás de las técnicas de prompt engineering más efectivas para maximizar precisión, reducir alucinaciones y mejorar el uso de tokens cuando trabajas con agentes de IA.

---

## 1. Razonamiento Estructurado Forzado (Chain-of-Thought + Verify Each Step)

**El problema que resuelve**: Los agentes (especialmente los modelos grandes) tienden a "saltar" a conclusiones plausibles sin haber recorrido un camino de razonamiento riguroso. Esto genera decisiones superficiales y suposiciones ocultas.

**Por qué funciona**:
- Obligar al modelo a "pensar en voz alta" paso a paso activa patrones de razonamiento más profundos en los pesos del modelo.
- La técnica "Verify Each Step" fuerza una verificación interna antes de avanzar, reduciendo errores en cadena.
- Tree of Thoughts lite explora múltiples caminos y evalúa tradeoffs de forma explícita.

**Cuándo usarla**:
- Decisiones de arquitectura o tradeoffs técnicos
- Debugging complejo o análisis de causa raíz
- Especificaciones SDD de lógica de negocio complicada
- Refactoring con impacto estructural

**Impacto medido**: Reduce significativamente la cantidad de iteraciones de corrección en tareas de alta complejidad cognitiva.

---

## 2. Auto-Crítica Integrada (Self-Critique Loop)

**El problema que resuelve**: El agente genera una respuesta y la entrega directamente. Muchas veces esa primera versión contiene omisiones, suposiciones o pequeñas desviaciones que el usuario tiene que corregir manualmente.

**Por qué funciona**:
- El modelo es sorprendentemente bueno criticando su propio trabajo cuando se le obliga a hacerlo antes de mostrar la respuesta.
- La checklist interna (contra la instrucción original) actúa como un "segundo par de ojos" que el modelo aplica a sí mismo.
- Combinado con el Principio de No Generación, es extremadamente efectivo para reducir entregas que requieren corrección humana.

**Cuándo usarla**:
- Casi siempre en respuestas importantes (especialmente specs, código, revisiones, propuestas).
- En cada fase de TDD (Red, Green, Refactor).
- Antes de que un agente entregue trabajo al Orchestrator o a otro agente.

**Impacto medido**: Una de las técnicas con mejor relación costo/beneficio en tokens vs. reducción de iteraciones.

---

## 3. Surfacing de Suposiciones Explícitas (Assumption Surfacing)

**El problema que resuelve**: La mayoría de los errores graves no vienen de "mal código", sino de suposiciones que el agente nunca te mostró (sobre el negocio, datos, usuarios, concurrencia, entorno, etc.).

**Por qué funciona**:
- Obliga al modelo a hacer explícito lo que normalmente dejaría implícito.
- Categorizar por riesgo (alto/medio/bajo) ayuda al usuario a priorizar qué suposiciones revisar.
- Convierte suposiciones en un artefacto revisable y aprobable antes de que se materialicen en código.

**Cuándo usarla**:
- Antes de SDD en cualquier funcionalidad con lógica de negocio.
- Antes de arquitectura o decisiones técnicas importantes.
- Al retomar proyectos después de varios días/semanas (el agente puede estar cargando suposiciones antiguas).

**Impacto medido**: Reduce drásticamente las "sorpresas" que aparecen en etapas avanzadas del proyecto.

---

## 4. Formatos de Salida Estructurados (Output Schemas)

**El problema que resuelve**: Respuestas inconsistentes, difíciles de parsear, con secciones que aparecen y desaparecen entre chats.

**Por qué funciona**:
- Los modelos responden muy bien cuando se les da un schema claro y se les obliga a cumplirlo.
- Estructura fija = menor variabilidad = más predictibilidad.
- Facilita enormemente el handoff entre agentes (el Orchestrator puede pasar salidas estructuradas directamente).

**Cuándo usarla**:
- Cuando otro agente o herramienta va a consumir la salida.
- Para estandarizar entregables (especificaciones, revisiones, tradeoffs, checklists).
- En flujos con Orchestrator.

**Impacto medido**: Aumenta la consistencia y reduce el trabajo manual de reformateo posterior.

---

## 5. Gestión de Contexto Avanzada (v2 - Memory Bank + Filtering)

**El problema que resuelve**: Los contextos se vuelven "dumps" gigantes, llenos de ruido. El agente se distrae, se desperdician tokens y se pierde información crítica entre chats.

**Por qué funciona**:
- Separar en capas (Executive Summary + Memory Bank + Contexto reciente + Archivado) permite al agente enfocarse.
- El "Context Filtering" explícito obliga al agente a decir qué está usando y qué está ignorando.
- El Memory Bank vivo evoluciona con el proyecto en vez de ser un snapshot estático.

**Cuándo usarla**:
- Proyectos medianos o grandes (> 3-4 módulos o > 2 semanas).
- Cuando hay múltiples chats paralelos o secuenciales sobre el mismo sistema.
- Cuando usas Orchestrator.

**Impacto medido**: Mejora la calidad de las respuestas y reduce el consumo de tokens en proyectos largos.

---

## Cómo combinarlas para máximo efecto

La combinación más poderosa actualmente (2026):

1. Principio de No Generación (base inquebrantable)
2. Gestión de Contexto v2 (para mantener el estado)
3. Razonamiento Estructurado + Suposiciones Explícitas (antes de decidir)
4. Auto-Crítica Integrada (antes de entregar)
5. Formato de Salida Estructurado (para handoffs y consistencia)
6. Verification Agent (auditoría de fidelidad)

Esta pila de técnicas, aplicada consistentemente, representa actualmente uno de los niveles más altos de control y eficiencia que se pueden lograr trabajando con agentes de IA en desarrollo de software.

---

## Recomendación final

No es necesario usar todas las técnicas en todas las tareas.

**Regla práctica**:
- Tareas simples → Principio de No Generación + Auto-Crítica básica
- Tareas medianas → + Razonamiento Estructurado + Suposiciones
- Tareas complejas o críticas → Pila completa + Verification Agent + Context v2

La disciplina en la aplicación de estas técnicas es lo que separa a los usuarios que obtienen resultados predecibles y de alta calidad de aquellos que siguen peleando con alucinaciones y deriva constante.
