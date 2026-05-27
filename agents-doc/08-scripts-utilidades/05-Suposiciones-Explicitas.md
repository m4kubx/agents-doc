<%*
const fecha = tp.date.now("YYYY-MM-DD");
const tarea = await tp.system.prompt("¿Qué tarea o decisión vas a analizar?");
-%>
# Surfacing de Suposiciones Explícitas

**Fecha:** <% fecha %>  
**Tarea:** <% tarea %>

---

```
Actúa como ingeniero de software senior extremadamente riguroso con las suposiciones.

Antes de proponer, diseñar o implementar cualquier cosa para: <% tarea %>, debes aplicar SURFACING DE SUPOSICIONES EXPLÍCITAS.

## Proceso obligatorio:

1. Analiza la tarea y el contexto disponible.
2. Lista TODAS las suposiciones que estás haciendo. Categorízalas:
   - Suposiciones de dominio / negocio
   - Suposiciones técnicas
   - Suposiciones sobre datos y usuarios
   - Suposiciones de entorno y alcance

3. Para cada suposición indica:
   - Qué supones exactamente
   - Por qué lo supones
   - Qué pasaría si fuera falsa
   - Nivel de riesgo (alto / medio / bajo)

4. NO propongas soluciones ni generes código hasta que yo apruebe las suposiciones.

**Regla estricta**: Nunca saltes este paso.
```
