# Plantilla: Specification-Driven Development (SDD)

> Usa esta plantilla cuando quieras definir el comportamiento exacto de una funcionalidad **antes** de escribir tests o código. Es especialmente poderosa combinada con TDD y el Principio de No Generación Sin Orden.

---

## ¿Qué es SDD y por qué usarlo con agentes?

Specification-Driven Development significa:

- Describir con precisión qué debe hacer una pieza de software (inputs, outputs, comportamientos, edge cases, invariantes).
- Hacerlo **antes** de implementar.
- Usar esa especificación como contrato único de verdad.

**Ventajas cuando trabajas con agentes**:
- Reduce drásticamente las alucinaciones y suposiciones del agente.
- Hace que los tests sean mucho más fáciles de generar (y correctos).
- Sirve como documentación viva.
- Es el paso intermedio ideal entre "arquitectura" y "implementación".

---

## Prompt listo para copiar y pegar (SDD)

```
Actúa como ingeniero de software senior experto en especificaciones precisas.

Vamos a aplicar Specification-Driven Development (SDD) para: [nombre de la funcionalidad o módulo].

## Contexto del proyecto
- Sistema: [nombre]
- Stack: [tecnologías]
- Arquitectura aprobada: [resumen breve]

## Lo que necesito ahora (solo especificación)

1. **Especificación formal** de la funcionalidad usando el siguiente formato:

   ### Descripción general
   [Qué hace esta pieza en una o dos oraciones]

   ### Inputs
   - [Nombre del input]: tipo, restricciones, si es obligatorio
   - ...

   ### Outputs / Resultados
   - En caso de éxito: qué devuelve y en qué formato
   - En caso de error: qué errores puede lanzar y en qué condiciones

   ### Comportamiento principal (happy path)
   - Paso a paso de lo que debe ocurrir

   ### Casos edge y de error (obligatorio)
   - Lista completa de situaciones límite que deben manejarse
   - Para cada una: input, comportamiento esperado, output/error

   ### Invariantes / Reglas de negocio que siempre deben cumplirse
   - [Regla 1]
   - [Regla 2]

   ### Restricciones no funcionales (si aplica)
   - Rendimiento, seguridad, concurrencia, etc.

  2. **Preguntas abiertas**: Lista cualquier ambigüedad o decisión que aún necesite mi aprobación.

  3. **Suposiciones explícitas** (obligatorio):
     Antes de redactar la especificación completa, aplica surfacing de suposiciones usando la plantilla `plantilla-suposiciones-explicitas.md`.
     Lista todas las suposiciones de dominio, datos, comportamiento y alcance que estás haciendo.
     Incluye el nivel de riesgo de cada una.

**Importante**:
- NO generes tests todavía.
- NO generes código de implementación.
- Solo produce la especificación clara y completa.
- Si falta información o hay suposiciones de alto riesgo, pregúntame antes de asumir.

Una vez que apruebe la especificación **y las suposiciones**, te diré si pasamos a TDD (generar tests a partir de la spec) o directamente a implementación.
```

---

## Flujo recomendado SDD + TDD + Agentes

1. **SDD** → Agente produce la especificación detallada.
2. **Aprobación humana** de la especificación.
3. **TDD Red** → Agente genera tests basados 100% en la especificación aprobada.
4. **Aprobación de los tests** (deben fallar).
5. **TDD Green** → Agente implementa lo mínimo para pasar los tests.
6. **Refactor** (opcional y controlado).

Este flujo es una de las formas más seguras de construir con agentes.

---

## Ejemplo de buena especificación (resumido)

**Funcionalidad**: Calcular descuento por volumen en un carrito de compras.

### Inputs
- `items`: array de objetos con `productId`, `quantity`, `unitPrice`
- `customerType`: "regular" | "premium" | "enterprise"

### Outputs
- Objeto con `originalTotal`, `discountAmount`, `finalTotal`, `appliedRules`

### Casos edge obligatorios
- Carrito vacío → discountAmount = 0
- Cantidad negativa → error "Invalid quantity"
- Precio unitario 0 o negativo → error
- Más de 1000 items → aplicar regla de descuento máximo del 25%
- Combinación de reglas que excedería el 30% → capear en 30%

### Invariantes
- finalTotal nunca puede ser negativo
- discountAmount nunca puede ser mayor que originalTotal

---

## Notas de uso

- SDD es especialmente útil para lógica de negocio compleja, algoritmos, reglas de pricing, workflows con muchos estados, etc.
- Para funcionalidades simples (CRUD básico), una especificación corta suele bastar.
- La especificación se convierte en el contrato. Si más adelante cambias de idea, actualiza primero la especificación y luego deriva los cambios en tests/código.
- Combina excelente con el rol de **Arquitecto** (para specs de alto nivel) y con **QA Engineer** (para specs de testing).

### Cuándo saltarte SDD
- Cuando la tarea es puramente de infraestructura o configuración (a menos que tenga reglas complejas).
- Cuando estás haciendo un spike exploratorio rápido (pero entonces no uses agentes para generar código final).

---

## Integración con el resto de la metodología

- **Principio de No Generación**: La especificación es el primer artefacto que se genera. Todo lo demás debe derivarse de ella.
- **Surfacing de Suposiciones**: (Nuevo) Siempre combina SDD con `plantilla-suposiciones-explicitas.md` antes de redactar la especificación formal. Las suposiciones aprobadas se convierten en parte del contrato.
- **Razonamiento Estructurado**: Usa `plantilla-razonamiento-estructurado.md` antes de pedir la SDD en funcionalidades complejas.
- **TDD**: SDD hace que la fase Red sea mucho más fácil y precisa.
- **Orchestrator**: Puede asignar "Escribir especificación SDD para módulo X" como tarea separada antes de asignar implementación.
- **Checklist de Validación**: Antes de marcar un módulo como terminado, verifica que la especificación original siga siendo precisa respecto a lo implementado.

SDD + Principio de No Generación + Surfacing de Suposiciones + TDD es una de las combinaciones más seguras y eficientes para construir con agentes.
