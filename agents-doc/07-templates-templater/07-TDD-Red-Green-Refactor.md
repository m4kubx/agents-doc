<%*
const fecha = tp.date.now("YYYY-MM-DD");
const modulo = await tp.system.prompt("¿Qué módulo o funcionalidad vas a implementar con TDD?");
-%>
# TDD con Agentes (Red → Green → Refactor)

**Fecha:** <% fecha %>  
**Módulo:** <% modulo %>

---

## Fase Red (Solo Tests)

```
Sigue estrictamente el PRINCIPIO DE NO GENERACIÓN y TDD.

Vamos a implementar <% modulo %> usando TDD.

## Restricciones obligatorias:
- PRIMERO solo escribe tests (fase Red). No generes código de implementación.
- Los tests deben fallar cuando se ejecuten por primera vez.
- No asumas nada sobre la implementación.

## Lo que necesito ahora:
1. Lista de escenarios de prueba que propones cubrir.
2. Escribe los archivos de test completos (solo tests).
3. Detente. No generes código hasta que apruebe los tests.
```

## Fase Green (Implementación Mínima)

```
Ahora pasamos a la fase Green.

## Instrucciones:
- Implementa SOLO el código estrictamente necesario para hacer pasar todos los tests.
- No agregues funcionalidades extras.
- Sigue el Principio de No Generación: nada que no esté justificado por un test.

Ejecuta los tests al final y muestra los resultados.
```

## Fase Refactor (Opcional y Controlada)

```
Ahora pasamos a Refactor (solo si lo apruebo).

## Restricciones:
- Todos los tests deben seguir pasando.
- No puedes cambiar comportamiento observable.
- Lista primero las mejoras que propones.
- Espera mi aprobación antes de tocar código.
```
