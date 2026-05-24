# Guía: Test-Driven Development (TDD) con Agentes de IA

> Cómo usar TDD (Red → Green → Refactor) cuando trabajas con agentes, manteniendo control total y aprovechando la velocidad del agente sin perder calidad.

---

## Por qué TDD + Agentes es una combinación poderosa

El TDD tradicional ya es excelente porque:
- Los tests definen el comportamiento **antes** de que exista el código.
- Obliga a pensar en casos edge desde el principio.
- Produce código más simple y testeable.

Con agentes se vuelve aún mejor **si** sigues estas reglas:
- El agente escribe los tests **primero**.
- Tú apruebas los tests antes de que genere implementación.
- El agente solo implementa lo suficiente para hacer pasar los tests (nada más).

Sin disciplina, el agente tiende a saltarse la fase Red y generar todo junto.

---

## El ciclo TDD con agentes (adaptado)

```
1. Red     → Tú defines el comportamiento deseado
             Agente escribe tests que FALLAN (y solo tests)
             Tú revisas y apruebas los tests

2. Green   → Agente implementa el código MÍNIMO para hacer pasar los tests
             Tú revisas que no haya código extra

3. Refactor → Agente (o tú) mejora el código manteniendo todos los tests verdes
             Solo con tu autorización explícita
```

**Regla de oro**: Nunca pases a Green sin haber aprobado los tests en Red.

---

## Prompt para iniciar TDD en un módulo (combina con el Principio de No Generación)

```
Sigue estrictamente el PRINCIPIO DE NO GENERACIÓN SIN ORDEN y TDD.

Vamos a implementar [nombre del módulo / funcionalidad] usando TDD (Red-Green-Refactor).

## Restricciones obligatorias
- PRIMERO solo escribe tests (fase Red). No generes ni una línea de código de implementación.
- Los tests deben fallar cuando se ejecuten por primera vez.
- No asumas nada sobre la implementación. Escribe tests basados en el comportamiento esperado.
- Si necesitas aclarar requisitos o casos de uso, pregúntame antes de escribir cualquier test.

## Lo que necesito ahora
1. Lista de escenarios de prueba que propones cubrir (happy path + edge cases + errores).
2. Luego: Escribe los archivos de test completos (solo tests).
3. Detente. No generes código de implementación hasta que yo apruebe explícitamente los tests.

Una vez que apruebe los tests, te diré "pasa a Green" y solo entonces podrás implementar.
```

---

## Prompt para la fase Green (después de que apruebes los tests)

```
Ahora pasamos a la fase Green.

## Instrucciones
- Implementa **solo** el código estrictamente necesario para hacer pasar todos los tests que acabamos de aprobar.
- No agregues funcionalidades extras, validaciones adicionales, ni "mejoras".
- Si detectas que falta algo en los tests para cubrir lo que estás escribiendo, detente y avísame.
- Sigue el Principio de No Generación: nada que no esté justificado por un test.

## Entregable
- Código de implementación que hace pasar todos los tests.
- Ejecuta los tests y muestra los resultados.
- Si algún test sigue fallando, corrígelo sin agregar comportamiento no testeado.
```

---

## Prompt para la fase Refactor (opcional y controlada)

```
Ahora pasamos a Refactor (solo si lo apruebo).

## Restricciones
- Todos los tests deben seguir pasando después del refactor.
- No puedes cambiar comportamiento observable.
- Lista primero las mejoras que propones (nombres, extracción de funciones, simplificaciones, etc.).
- Espera mi aprobación antes de tocar código.
- Combina esto con la guia-iteracion-refactorizacion.md si el refactor es significativo.
```

---

## Variante recomendada: TDD + Auto-Crítica Integrada

Para obtener aún mejor calidad, agrega esta instrucción a **todos** los prompts de las fases Red, Green y Refactor:

```
Aplica AUTO-CRÍTICA INTEGRADA (usa plantilla-autocritica-integrada.md) antes de mostrarme los tests / la implementación / el resultado del refactor.
- Genera borrador interno.
- Revisa contra la instrucción exacta de esta fase.
- Corrige antes de mostrar.
```

Esto reduce significativamente la cantidad de correcciones que tienes que hacer manualmente en cada fase del ciclo TDD.

---

## Ejemplo de flujo completo con un agente

**Usuario**: (pega el prompt de TDD + principio)

**Agente**: Propone escenarios → Escribe tests (Red)

**Usuario**: "Los tests se ven bien. Apruebo. Pasa a Green."

**Agente**: Genera implementación mínima

**Usuario**: "Ejecuta los tests." → Todos pasan.

**Usuario** (opcional): "Ahora haz refactor de la función X."

---

## Errores comunes al hacer TDD con agentes (y cómo evitarlos)

| Error | Solución |
|-------|----------|
| El agente escribe tests + implementación en la misma respuesta | Activa el Principio de No Generación + sé explícito: "Solo tests en esta respuesta" |
| Los tests que genera el agente ya pasan desde el principio | Pide que los tests fallen primero. Si no fallan, no son buenos tests |
| El agente implementa más de lo necesario en Green | En el prompt de Green di claramente: "solo lo mínimo para pasar los tests" |
| Saltas directamente a implementar porque "ya sabes cómo va a ser" | Esto rompe TDD. Usa el agente para descubrir casos edge que no habías pensado |
| El agente propone "mejoras" durante Green | Recuérdale el principio: "No propongas nada. Solo haz pasar los tests." |

---

## Cómo combinar TDD con el resto de la metodología

- **Fase 1 (Arquitectura)**: Usa la arquitectura aprobada como guía para saber qué módulos tendrán TDD.
- **Fase 3 (Implementación por módulo)**: Dentro de cada módulo, aplica el ciclo TDD completo.
- **Principio de No Generación**: Es la capa base. TDD funciona mucho mejor cuando el agente no puede "colarse" con código extra.
- **Auto-Crítica Integrada** (Nuevo): Agrega `plantilla-autocritica-integrada.md` en cada fase para que el agente se revise antes de entregarte los tests o el código.
- **Razonamiento Estructurado y Suposiciones**: Combínalos cuando el módulo tenga lógica compleja o muchas decisiones de negocio.
- **Checklist de Validación**: Antes de marcar un módulo como terminado, verifica que pasó por Red → Green → (Refactor opcional) y que todos los tests están verdes.

---

## Notas avanzadas

- **Cobertura**: Con TDD bien hecho, la cobertura tiende a ser naturalmente alta en la lógica que importa. Aun así, puedes usar la plantilla de tests automáticos para pedir métricas explícitas.
- **Tests de integración / e2e**: Puedes aplicar el mismo ciclo, pero los tests suelen escribirse después de tener unidades funcionando.
- **Librerías de testing**: Deja que el agente use las que ya están definidas en tu stack (no dejes que invente nuevas sin permiso).

### Prompt útil cuando el agente se pasa de la raya

> "Detente. Estás violando el Principio de No Generación. Solo haz lo que te pedí en la fase actual (Red / Green / Refactor). Nada más."

---

## Resumen del flujo recomendado

1. Activa el Principio de No Generación al inicio del chat.
2. Pide al agente que proponga escenarios de prueba.
3. Aprueba los escenarios.
4. Pide que escriba solo los tests (Red).
5. Aprueba los tests (deben fallar).
6. Ordena explícitamente: "Pasa a Green".
7. Revisa que la implementación sea mínima.
8. Ejecuta tests.
9. (Opcional) Pide refactor controlado.
10. Marca el módulo como completado usando la checklist.

Este flujo, combinado con el Principio de No Generación, es una de las formas más efectivas y seguras de construir software con agentes.
