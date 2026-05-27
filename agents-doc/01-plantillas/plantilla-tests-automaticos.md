# Plantilla: Solicitar Tests Automaticos de Calidad

> Usala junto con la implementacion de cada modulo. Soluciona el error #4 (no pedir tests) y evita tests genericos o incompletos.

---

## Prompt listo para copiar y pegar

```
Actua como QA engineer senior especializado en testing automatizado.

## Contexto del proyecto
- Sistema: [nombre del sistema]
- Stack: [tecnologias, ej: Node.js + Express + PostgreSQL + Jest]
- Modulo a testear: [nombre del modulo]
- Arquitectura: [breve descripcion]

## Lo que ya se implemento
[Describe o pega el codigo del modulo que se acaba de implementar]

## Lo que necesito (antes de escribir cualquier test)

1. **Estrategia de testing propuesta**
   - Que tipo de tests son criticos para este modulo? (unitarios, integracion, e2e, contrato, etc.)
   - Que porcentaje de cobertura minima es razonable aqui y por que?
   - Que casos edge y de error son los mas importantes?

2. **Estructura de archivos de test**
   - Lista los archivos de test que vas a crear
   - Explica la organizacion (por funcionalidad, por capa, etc.)

3. **Patrones de testing que vas a usar**
   - Framework y librerias especificas
   - Patrones (AAA, Given-When-Then, mocks, fixtures, etc.)
   - Como manejar datos de prueba y dependencias externas

## Luego de que apruebe la estrategia

4. Implementa los tests completos siguiendo la estrategia aprobada.
5. Asegurate de que los tests sean:
   - Deterministicos (no flaky)
   - Rapidos de ejecutar
   - Faciles de mantener
   - Con nombres descriptivos que expliquen el escenario
6. Incluye comandos exactos para:
   - Ejecutar solo los tests de este modulo
   - Ver el reporte de cobertura
   - Validar que todo pase en CI

Si el modulo tiene logica de negocio critica, prioriza tests de esa logica aunque la cobertura total sea menor.
```

---

## Notas de uso

- **Pide la estrategia primero**, no aceptes tests sin que el agente explique que esta cubriendo y por que.
- **Se explicito con el stack**: el agente necesita saber si usas Jest, Vitest, pytest, Go testing, etc.
- **Exige tests deterministicos**: pide que evite mocks de tiempo, APIs externas no controladas, y orden de ejecucion.
- **Pide comandos concretos**: al final siempre debes poder copiar y pegar `npm test` o equivalente.
- **Cobertura minima por defecto**: 70-80% para logica de negocio, puede ser menor para UI o glue code. El agente debe justificar la decision.

### Ejemplos de comandos por stack comun

| Stack | Comando para tests del modulo | Comando de cobertura |
|-------|-------------------------------|----------------------|
| Node.js + Jest | `npm test -- auth.test.js` | `npm test -- --coverage --collectCoverageFrom='src/auth/**'` |
| Python + pytest | `pytest tests/test_auth.py -v` | `pytest --cov=app/auth --cov-report=term-missing` |
| Go | `go test ./auth/... -v` | `go test ./auth/... -cover` |
| Java + JUnit | `./gradlew test --tests "*Auth*"` | `./gradlew jacocoTestReport` |

### Ejemplo de pregunta de seguimiento

> Revisa los tests que generaste. Hay algun caso edge importante que no este cubierto? Algun test es fragil o depende de orden de ejecucion? Corrige lo que encuentres.
