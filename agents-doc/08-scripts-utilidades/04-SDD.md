<%*
const fecha = tp.date.now("YYYY-MM-DD");
const funcionalidad = await tp.system.prompt("¿Qué funcionalidad o módulo vas a especificar?");
-%>
# Specification-Driven Development (SDD)

**Fecha:** <% fecha %>  
**Funcionalidad:** <% funcionalidad %>

---

```
Actúa como ingeniero de software senior experto en especificaciones precisas.

Vamos a aplicar Specification-Driven Development (SDD) para: <% funcionalidad %>

## Contexto del proyecto
- Sistema: 
- Stack: 
- Arquitectura aprobada: 

## Lo que necesito ahora (solo especificación)

1. **Especificación formal** de la funcionalidad usando el siguiente formato:

   ### Descripción general
   
   ### Inputs
   
   ### Outputs / Resultados
   
   ### Comportamiento principal (happy path)
   
   ### Casos edge y de error (obligatorio)
   
   ### Invariantes / Reglas de negocio
   
   ### Restricciones no funcionales (si aplica)

2. **Suposiciones explícitas**: Lista todas las suposiciones que estás haciendo (usa la técnica de surfacing de suposiciones).

3. **Preguntas abiertas**

**Importante**:
- NO generes tests todavía.
- NO generes código de implementación.
- Solo produce la especificación clara y completa.
```
