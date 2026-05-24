# Plantilla: Solicitar Implementacion por Modulo

> Usala despues de tener la arquitectura aprobada, para implementar **un modulo a la vez**.

---

## Prompt listo para copiar y pegar

```
Actua como desarrollador senior experto en [stack del proyecto].

## Contexto del proyecto
- Sistema: [nombre del sistema]
- Stack: [tecnologias]
- Arquitectura aprobada: [breve descripcion]

## Estado actual
Modulos ya implementados:
- [modulo 1] OK
- [modulo 2] OK

## Modulo a implementar ahora
[modulo X]

## Requisitos del modulo
1. [requisito funcional 1]
2. [requisito funcional 2]
3. [requisito funcional 3]

## Criterios de aceptacion
- [criterio 1: el usuario puede registrarse con email y contrasena]
- [criterio 2]
- [criterio 3]

## Restricciones
- Mantener coherencia con la arquitectura aprobada
- No anadir dependencias innecesarias
- Incluir validacion de datos
- Manejar errores correctamente

## Lo que necesito
Antes de escribir codigo:
1. Explica brevemente tu enfoque para este modulo
2. Lista los archivos que crearas o modificaras
3. Senala cualquier riesgo o decision importante

Luego:
4. Implementa el modulo completo
5. Incluye tests unitarios para la logica critica
6. Documenta brevemente lo implementado
```

---

## Notas de uso

- **Un modulo por prompt**: no combines varios modulos en una sola solicitud.
- **Manten el contexto**: referencia siempre la arquitectura y modulos anteriores.
- **Pide tests siempre**: Incluye tests unitarios debe estar en cada prompt.
- **Revisa antes de avanzar**: prueba o revisa el codigo antes de pedir el siguiente modulo.
- **Actualiza el backlog**: despues de cada modulo, marca el progreso.

### Ejemplo de pregunta de seguimiento

> Revisa el codigo que acabas de generar para el modulo de autenticacion. Hay algun riesgo de seguridad o deuda tecnica que debamos abordar antes de continuar?