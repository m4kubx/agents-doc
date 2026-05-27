# Guia: Iteracion, Refactorizacion y Gestion de Chats

> Como evolucionar el codigo generado por agentes sin perder calidad ni control. Complementa el ciclo Plan > Revisar > Implementar.

---

## 1. Cuando refactorizar vs. reescribir

| Situacion | Accion recomendada | Razon |
|-----------|--------------------|-------|
| Codigo funciona pero es dificil de leer o mantener | Refactorizar | Preservas comportamiento probado |
| Hay deuda tecnica acumulada en un modulo pequeno | Refactorizar | Bajo riesgo, alto beneficio |
| La arquitectura del modulo ya no encaja con el resto del sistema | Reescribir (o extraer) | Cambios estructurales grandes |
| Tests fallan frecuentemente o son fragiles | Refactorizar tests primero | Los tests deben ser confiables |
| El modulo tiene muchos bugs en produccion | Investigar causa raiz antes de tocar | No refactorices codigo roto |
| El agente genero codigo que viola la arquitectura aprobada | Revertir + reimplementar con correcciones | Mejor prevenir que corregir despues |

**Regla de oro**: Nunca refactorices y cambies comportamiento al mismo tiempo. Un refactor es un cambio que no altera el comportamiento observable.

---

## 2. Patrones de refactorizacion segura con agentes

1. **Pide al agente que proponga el refactor primero** (sin codigo):
   - Lista de cambios propuestos
   - Riesgos identificados
   - Como se validara que nada se rompio (tests)

2. **Aisla el cambio**:
   - Trabaja en un solo modulo o archivo a la vez
   - Usa feature flags o ramas si el cambio es grande

3. **Valida en pasos pequenos**:
   - Ejecuta tests despues de cada paso logico
   - Pide al agente que explique cada transformacion

4. **Usa "strangler fig" para cambios grandes**:
   - Crea la nueva implementacion al lado
   - Migra consumidores de a poco
   - Elimina la version antigua solo cuando todo esta cubierto por tests

---

## 3. Cuando crear un nuevo chat vs. continuar en el mismo

| Escenario | Recomendacion | Por que |
|-----------|---------------|---------|
| Estas en medio de implementar un modulo y la conversacion tiene < 30 mensajes | Continuar en el mismo chat | Contexto fresco, menos riesgo de olvido |
| Terminaste un modulo y vas a empezar otro | Nuevo chat + plantilla-gestion-contexto.md | Evitas deriva y perdida de foco |
| El chat ya tiene mas de 50-60 mensajes | Nuevo chat | Los modelos pierden precision con contextos muy largos |
| Cambias de rol (de "implementar" a "revisar seguridad") | Nuevo chat | Cada rol necesita foco distinto |
| El agente empieza a contradecirse o olvidar decisiones previas | Nuevo chat con contexto completo | Senal clara de degradacion de contexto |
| Estas debuggeando un bug especifico | Continuar en el chat donde se origino el codigo | El historial de decisiones ayuda |

**Consejo practico**: Cuando el agente empiece a decir "como mencione antes..." pero se equivoca en los detalles, es hora de nuevo chat.

---

## 4. Prompt para solicitar refactorizacion controlada

```
Actua como desarrollador senior que debe mejorar codigo existente sin romperlo.

## Contexto
- Modulo: [nombre]
- Stack: [tecnologias]
- Tests actuales: [cobertura / estado]

## Codigo actual (o archivos relevantes)
[Pega el codigo o describe los archivos]

## Problema a resolver
[Describe el dolor: "el codigo es dificil de testear", "hay duplicacion", "viola SRP", etc.]

## Restricciones
- NO cambiar el comportamiento observable para los casos existentes
- Mantener o mejorar la cobertura de tests
- Seguir la arquitectura aprobada del proyecto
- Documentar cada decision de refactor

## Lo que necesito
1. Lista de refactorizaciones propuestas (una por una, priorizadas)
2. Para cada una: riesgo, beneficio y como se validara
3. Orden de ejecucion recomendado
4. Despues de mi aprobacion: ejecuta el primer paso y muestra los tests que validan que nada se rompio
```

---

## 5. Checklist rapida antes de refactorizar

- [ ] Entiendo exactamente que comportamiento debe preservarse
- [ ] Tengo tests que cubren ese comportamiento (o los voy a agregar primero)
- [ ] El cambio esta aislado a un modulo/archivo pequeno
- [ ] Puedo revertir en menos de 5 minutos si algo sale mal
- [ ] El agente propuso el plan antes de tocar codigo

---

## Notas finales

- La mejor refactorizacion es la que no hace falta: pide buena arquitectura y codigo limpio desde el principio.
- Documenta siempre las decisiones de refactor en el "Estado actual del proyecto" (usa plantilla-gestion-contexto.md).
- Si un refactor se alarga mas de 2-3 iteraciones, detente y preguntate si no seria mejor reescribir esa pieza con lecciones aprendidas.
