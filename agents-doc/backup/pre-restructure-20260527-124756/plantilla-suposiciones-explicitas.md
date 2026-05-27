# Plantilla: Surfacing de Suposiciones Explícitas

> Usa esta plantilla cuando el agente deba tomar decisiones, proponer soluciones o implementar algo que dependa de información no explícita. Obliga al agente a sacar a la luz **todas** las suposiciones antes de avanzar.

---

## Por qué el surfacing de suposiciones es crítico

La mayoría de los errores graves con agentes no vienen de "mal código", sino de **suposiciones ocultas** que el agente hace sin decírtelo:

- "Asumí que usas PostgreSQL"
- "Asumí que el usuario siempre está autenticado"
- "Asumí que los IDs son numéricos"
- "Asumí que no hay concurrencia"
- "Asumí que el negocio funciona de esta forma..."

Esta plantilla convierte las suposiciones en un artefacto explícito que tú puedes revisar y aprobar (o rechazar) antes de que el agente proceda.

---

## Prompt listo para copiar y pegar

```
Actúa como ingeniero de software senior extremadamente riguroso con las suposiciones.

Antes de proponer, diseñar o implementar cualquier cosa, debes aplicar SURFACING DE SUPOSICIONES EXPLÍCITAS.

## Proceso obligatorio:

1. **Analiza la tarea y el contexto disponible**.
2. **Lista TODAS las suposiciones** que estás haciendo (incluso las que te parecen obvias). 
   Categorízalas:
   - Suposiciones de dominio / negocio
   - Suposiciones técnicas (stack, arquitectura, librerías)
   - Suposiciones sobre datos y comportamiento de usuarios
   - Suposiciones de entorno (despliegue, concurrencia, seguridad)
   - Suposiciones de alcance (qué está dentro y fuera del pedido)

3. Para cada suposición, indica:
   - Qué supones exactamente
   - Por qué lo supones (basado en qué evidencia o contexto)
   - Qué pasaría si la suposición fuera falsa
   - Nivel de riesgo (alto / medio / bajo)

4. **NO propongas soluciones ni generes código** hasta que yo haya revisado y aprobado (o corregido) las suposiciones.
5. Si detectas que una suposición es muy riesgosa o no tienes suficiente información, marca la tarea como bloqueada hasta que se resuelva.

## Tarea concreta:

[PEGAR AQUÍ LO QUE QUIERES QUE ANALICE O IMPLEMENTE]

## Contexto disponible:

[pegar contexto relevante o decir "usar el contexto de chats anteriores"]

**Regla estricta**: 
- Nunca saltes este paso.
- Nunca asumas que "ya lo sabe el usuario".
- Si la lista de suposiciones es muy larga, agrúpalas pero no omitas ninguna importante.
```

---

## Variante corta (para usar después de otros prompts)

```
Antes de responder o proponer nada, aplica SURFACING DE SUPOSICIONES EXPLÍCITAS:
1. Lista todas las suposiciones que estás haciendo (dominio, técnico, datos, alcance).
2. Para cada una: qué supones + evidencia + riesgo si es falso.
3. No propongas ni implementes hasta que apruebe las suposiciones.
```

---

## Notas de uso

- **Úsala siempre** antes de:
  - Pedir arquitectura o decisiones técnicas grandes
  - Pedir SDD de funcionalidades complejas
  - Iniciar implementación de módulos nuevos
  - Hacer refactoring que afecte comportamiento
- Es especialmente útil cuando el agente viene de chats anteriores y puede estar cargando suposiciones antiguas.
- Combínala con la plantilla de **Razonamiento Estructurado** para máxima efectividad.
- El usuario debe revisar la lista y responder con correcciones o aprobaciones explícitas.

### Ejemplo de buena lista de suposiciones

**Tarea**: Implementar sistema de descuentos por volumen.

Suposiciones detectadas:
- Suposición de negocio: "El descuento se calcula sobre el total del carrito" (basado en conversaciones previas) - Riesgo medio - Si es por ítem el cálculo cambia completamente.
- Suposición técnica: "Usamos la misma base de datos que el resto del sistema (PostgreSQL)" - Riesgo bajo.
- Suposición de datos: "Los precios siempre vienen en la moneda base del sistema" - Riesgo alto si hay multi-moneda.
- Suposición de alcance: "No se requiere historial de descuentos aplicados para auditoría" - Riesgo medio.

---

## Integración con el resto de la metodología

- **Principio de No Generación Sin Orden**: Esta plantilla es una extensión natural del principio. El agente no solo pregunta, sino que expone proactivamente todo lo que está asumiendo.
- **Plantilla SDD**: Debe usarse como paso previo o integrado en la fase de especificación. La especificación final debe declarar las suposiciones que quedaron como "invariantes aceptadas".
- **Plantilla de Razonamiento Estructurado**: Combínalas. El razonamiento saca suposiciones; esta plantilla las obliga a ser explícitas.
- **Memory Bank (Contexto v2)**: Las suposiciones aprobadas deben registrarse en el Memory Bank como "Supuestos actuales del proyecto".
- **Verification Agent** (futuro): Este rol puede auditar que un agente haya hecho surfacing de suposiciones antes de entregar trabajo.

Esta es una de las plantillas más importantes para evitar "sorpresas" tardías en el proyecto.
