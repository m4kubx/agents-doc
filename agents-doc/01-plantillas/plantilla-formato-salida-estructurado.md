# Plantilla: Formato de Salida Estructurado

> Usa esta plantilla cuando necesites que el agente produzca salidas consistentes, fáciles de consumir por humanos o por otros agentes, o que sigan un schema específico. Incluye validación posterior de cumplimiento.

---

## Por qué los formatos de salida estructurados importan

Sin estructura explícita, los agentes tienden a:

- Producir respuestas inconsistentes entre chats
- Mezclar prosa, listas y tablas de forma caótica
- Omitir secciones importantes
- Generar salidas difíciles de parsear o reutilizar

Con formatos estructurados obligatorios obtienes:

- Consistencia alta
- Mejor parseabilidad (JSON, tablas específicas, secciones fijas)
- Menos trabajo manual de reformateo
- Facilidad para que otros agentes consuman la salida

---

## Prompt listo para copiar y pegar

```
Actúa como ingeniero de software senior que produce salidas extremadamente consistentes y estructuradas.

Debes aplicar FORMATO DE SALIDA ESTRUCTURADO para esta tarea.

## Instrucciones obligatorias de formato:

1. **Usa EXACTAMENTE el schema / estructura** que se indica más abajo.
2. **No agregues secciones extra** ni quites secciones obligatorias.
3. **No mezcles prosa libre** fuera de los campos indicados.
4. Al final de tu respuesta, agrega esta línea de validación:
   "Validación de formato: He revisado que esta salida cumple exactamente con el schema solicitado."

## Schema / Estructura de salida requerida:

[PEGAR AQUÍ EL SCHEMA EXACTO QUE DEBE SEGUIR LA RESPUESTA]

Ejemplos de schemas comunes (elige o adapta uno):

### Schema JSON (recomendado para consumo por otros agentes o herramientas)
```json
{
  "resumen": "string",
  "decisiones": [
    {
      "opcion": "string",
      "justificacion": "string",
      "riesgos": ["string"]
    }
  ],
  "recomendacion": "string",
  "suposiciones": ["string"],
  "preguntas_abiertas": ["string"]
}
```

### Schema de Tabla de Tradeoffs (Markdown)
| Alternativa | Pros | Contras | Costo estimado | Riesgo | Recomendada |
|-------------|------|---------|----------------|--------|-------------|
| ...         | ...  | ...     | ...            | ...    | Sí / No     |

### Schema de Revisión de Código (Markdown fijo)
**Archivo**: [nombre]
**Problemas críticos**:
- [lista]

**Problemas menores**:
- [lista]

**Sugerencias de mejora**:
- [lista]

**Conclusión**: [aprobado / aprobado con cambios / rechazado]

### Schema de Checklist de Cumplimiento
- [ ] Punto 1 de la instrucción original → Estado + evidencia
- [ ] Punto 2 → Estado + evidencia
...

## Tarea concreta:

[PEGAR AQUÍ LO QUE QUIERES QUE HAGA]

**Regla estricta**:
- Si tu salida no encaja perfectamente en el schema, reestructura hasta que lo haga.
- No expliques "por qué no pude seguir el formato". Ajusta la respuesta hasta que cumpla.
- La validación final es obligatoria.
```

---

## Variantes rápidas de schemas listos para usar

### Schema mínimo para decisiones técnicas
```
**Contexto de la decisión**: [1 línea]
**Opciones consideradas**: [lista]
**Criterios de decisión**: [lista]
**Recomendación**: [opción + justificación de 2-3 líneas]
**Suposiciones clave**: [lista]
**Riesgos abiertos**: [lista]
**Próximo paso recomendado**: [acción concreta]
```

### Schema para especificaciones SDD (resumido)
```
**Nombre de la funcionalidad**: 
**Inputs**:
**Outputs / Errores**:
**Happy path** (pasos numerados):
**Casos edge obligatorios**:
**Invariantes**:
**Suposiciones**:
**Preguntas abiertas**:
```

---

## Notas de uso

- **Úsala** cuando:
  - Quieres que la salida sea consumida por otro agente o script
  - Necesitas consistencia alta entre múltiples revisiones o decisiones
  - Estás recopilando información estructurada (tradeoffs, checklists, specs)
  - Quieres reducir el trabajo de post-procesamiento manual
- Combínala con **Auto-Crítica Integrada**: el agente primero genera, luego verifica que cumpla el schema.
- Es especialmente útil con el **Orchestrator** (un agente produce salida estructurada que otro agente consume directamente).

### Cuándo no forzarlo
- Conversaciones exploratorias o de descubrimiento
- Cuando la creatividad o la prosa narrativa es parte del valor (ej: escribir documentación explicativa larga)

---

## Integración con el resto de la metodología

- **Principio de No Generación Sin Orden**: El formato estructurado ayuda a que el agente sea más preciso y no agregue información extra fuera del schema.
- **Plantilla de Razonamiento Estructurado**: El razonamiento puede ser libre, pero la salida final debe seguir el schema.
- **Plantilla SDD**: Usa el schema de especificación para forzar que todas las SDD sigan exactamente el mismo formato.
- **Orchestrator**: Uno de los usos más poderosos. El Orchestrator puede exigir que cada sub-agente entregue su trabajo en un schema específico para facilitar el handoff.
- **Verification Agent** (futuro): Este rol puede usar la validación de formato como parte de su auditoría ("¿la salida cumple el schema pedido?").

Los formatos estructurados son una de las formas más simples y efectivas de aumentar la predictibilidad y reutilización del trabajo de los agentes.
