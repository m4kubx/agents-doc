# Errores Comunes al Pedir Sistemas Complejos a un Agente

> Una lista de los errores mas frecuentes y como evitarlos.

---

## 1. No definir criterios de exito

**Error**: No dices como se ve una solucion exitosa.
**Consecuencia**: El agente llena los huecos con suposiciones.
**Solucion**: Define como sabre que esta bien al inicio.

## 2. Pedir implementacion sin diseno

**Error**: Saltas directo a pedir codigo.
**Consecuencia**: Arquitectura improvisada, retrabajo.
**Solucion**: Siempre pide arquitectura primero.

## 3. No aclarar el alcance

**Error**: No defines lo que queda fuera del proyecto.
**Consecuencia**: El proyecto se infla con funcionalidades no solicitadas.
**Solucion**: Define explicitamente el fuera de alcance.

## 4. No pedir tests

**Error**: Aceptas codigo sin pruebas.
**Consecuencia**: Bugs que se descubren tarde.
**Solucion**: Siempre pide tests junto con la implementacion.

## 5. No pedir revision critica

**Error**: Aceptas la primera respuesta sin cuestionarla.
**Consecuencia**: El agente puede sonar convincente y estar equivocado.
**Solucion**: Siempre pide autocrítica.

## 6. Sobrecargar un solo chat

**Error**: Usas una misma conversacion para todo el proyecto.
**Consecuencia**: Deriva, perdida de contexto, errores.
**Solucion**: Separa conversaciones por tema o fase.

## 7. Suponer que el agente entiende el negocio

**Error**: Asumes que el agente conoce tu dominio.
**Consecuencia**: Decisiones incorrectas por falta de contexto.
**Solucion**: Explica el contexto de negocio como si fueras un cliente.

## 8. No resolver ambiguedades

**Error**: Usas terminos vagos como escalable, seguro, moderno.
**Consecuencia**: El agente interpreta a su manera.
**Solucion**: Traduce terminos abstractos a requisitos concretos.

## 9. Cambiar requisitos sin actualizar contexto

**Error**: En medio de la implementacion cambias lo que quieres.
**Consecuencia**: El agente genera codigo inconsistente.
**Solucion**: Antes de cambiar, resume el estado actual y explica el cambio.

## 10. Ser vago en los prompts

**Error**: Quiero algo moderno, escalable y profesional.
**Consecuencia**: Resultados genericos que no resuelven tu problema.
**Solucion**: Se especifico sobre tecnologias, funcionalidades y restricciones.

## 11. Permitir que el agente genere o proponga sin orden explícita

**Error**: El agente agrega funcionalidades, decide tecnologías o propone cambios que nunca le pediste ("creo que sería buena idea...").

**Consecuencia**: El proyecto deriva, pierdes control y gastas tiempo revisando trabajo no solicitado.

**Solucion**: Activa siempre el [Principio de No Generación Sin Orden](principio-no-generacion-sin-orden.md). Exige que pregunte antes de actuar. Nunca digas "haz lo que creas mejor".

## 12. No forzar razonamiento estructurado en tareas complejas

**Error**: El agente "salta" a una solución o conclusión sin haber razonado paso a paso (Chain of Thought).

**Consecuencia**: Decisiones superficiales, tradeoffs no considerados, suposiciones ocultas, soluciones subóptimas.

**Solucion**: Usa siempre `plantilla-razonamiento-estructurado.md` antes de pedir decisiones de arquitectura, debugging complejo, SDD o refactoring importante.

## 13. No hacer surfacing explícito de suposiciones

**Error**: El agente toma decisiones basadas en suposiciones que nunca te muestra (sobre el negocio, datos, concurrencia, usuarios, etc.).

**Consecuencia**: Errores que aparecen tarde, cuando ya hay mucho código escrito.

**Solucion**: Obliga al agente a listar **todas** las suposiciones usando `plantilla-suposiciones-explicitas.md` antes de proponer o implementar cualquier cosa importante. Revisa y aprueba las suposiciones explícitamente.

## 14. Aceptar la primera respuesta sin auto-crítica del agente

**Error**: El agente entrega su primer borrador sin haberse revisado a sí mismo contra la instrucción original.

**Consecuencia**: Más iteraciones de corrección manual, respuestas con omisiones o desviaciones.

**Solucion**: Exige siempre que el agente aplique `plantilla-autocritica-integrada.md` antes de mostrarte cualquier respuesta importante (especialmente specs, código, revisiones).

---

## Recursos adicionales para evitar estos errores

- Para el error #4 (no pedir tests): usa [plantilla-tests-automaticos.md](plantilla-tests-automaticos.md)
- Para el error #6 (sobrecargar un solo chat): usa [plantilla-gestion-contexto-v2.md](plantilla-gestion-contexto-v2.md) (recomendada) o la v1
- Para mejorar codigo existente: consulta [guia-iteracion-refactorizacion.md](guia-iteracion-refactorizacion.md)
- Para el ciclo completo de trabajo: sigue la metodología en [README.md](README.md)
- Para evitar que el agente genere sin tu permiso: usa [principio-no-generacion-sin-orden.md](principio-no-generacion-sin-orden.md) (principio fundamental)
- Para proyectos grandes con múltiples agentes: consulta [patron-orchestrator.md](patron-orchestrator.md) y [matriz-roles-agentes.md](matriz-roles-agentes.md)
- Para razonamiento profundo y reducción de suposiciones ocultas: usa [plantilla-razonamiento-estructurado.md](plantilla-razonamiento-estructurado.md) y [plantilla-suposiciones-explicitas.md](plantilla-suposiciones-explicitas.md)
- Para que el agente se revise antes de entregar: usa [plantilla-autocritica-integrada.md](plantilla-autocritica-integrada.md)
- Para salidas consistentes y fáciles de consumir: usa [plantilla-formato-salida-estructurado.md](plantilla-formato-salida-estructurado.md)
- Para control profesional de versiones: sigue [workflow-git-con-agentes.md](workflow-git-con-agentes.md)
