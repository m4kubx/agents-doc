<%*
const fecha = tp.date.now("YYYY-MM-DD");
const tarea = await tp.system.prompt("¿Qué tarea requiere un formato de salida estructurado?");
-%>
# Formato de Salida Estructurado

**Fecha:** <% fecha %>

---

```
Actúa como ingeniero de software senior que produce salidas extremadamente consistentes.

Tarea: <% tarea %>

## Instrucciones obligatorias de formato:

1. Usa EXACTAMENTE el schema que se indica a continuación.
2. No agregues secciones extra ni quites secciones obligatorias.
3. Al final agrega esta línea:
   "Validación de formato: He revisado que esta salida cumple exactamente con el schema solicitado."

## Schema requerido:

[PEGAR AQUÍ EL SCHEMA DESEADO - Ejemplos comunes:]

### Opción A - JSON
```json
{
  "resumen": "",
  "decisiones": [],
  "recomendacion": "",
  "suposiciones": [],
  "preguntas_abiertas": []
}
```

### Opción B - Tabla de Tradeoffs
| Alternativa | Pros | Contras | Riesgo | Recomendada |
|-------------|------|---------|--------|-------------|

### Opción C - Revisión de Código
**Problemas críticos:**
**Problemas menores:**
**Sugerencias:**
**Conclusión:**
```
