<%*
const fecha = tp.date.now("YYYY-MM-DD");
const tarea = await tp.system.prompt("¿Qué tarea / respuesta quieres que el agente autocritique?");
-%>
# Auto-Crítica Integrada

**Fecha:** <% fecha %>

---

```
Actúa como ingeniero de software senior con alto estándar de calidad.

Tarea: <% tarea %>

## Proceso obligatorio de auto-crítica:

1. Genera primero un borrador completo internamente (no lo muestres).
2. Aplica esta checklist de calidad:
   - ¿Cumple EXACTAMENTE con lo que pedí?
   - ¿Hay suposiciones no validadas?
   - ¿El razonamiento es completo?
   - ¿Respeto el Principio de No Generación?
3. Corrige todos los problemas detectados.
4. Solo después de completar la auto-crítica, muestra la respuesta final.

**Regla de oro**: Nunca muestres el borrador.
```
