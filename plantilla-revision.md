# Plantilla: Solicitar Revision de Codigo

> Usala despues de que el agente haya generado codigo, para obtener una **revision critica y autocrítica**.

---

## Prompt listo para copiar y pegar

```
Actua como code reviewer senior. Revisa el codigo que acabas de generar.

## Contexto
- Sistema: [nombre]
- Modulo: [modulo a revisar]
- Stack: [tecnologias]

## Lo que necesito
Analiza criticamente el codigo generado y responde:

### 1. Riesgos y problemas
- Hay riesgos de seguridad? (inyeccion, exposicion de datos, etc.)
- Hay problemas de rendimiento evidentes?
- Hay bugs o edge cases no manejados?
- Hay deuda tecnica que valga la pena senalar?

### 2. Calidad del codigo
- Sigue buenas practicas del stack?
- Es mantenible y legible?
- Las funciones tienen una sola responsabilidad?
- Los nombres de variables/funciones son claros?

### 3. Testing
- Los tests cubren los casos criticos?
- Hay logica sin testear que deberia estarlo?
- Los tests son confiables o fragiles?

### 4. Mejoras prioritarias
- Que cambiarias si tuvieras 30 minutos?
- Que cambiarias si tuvieras 2 horas?
- Que dejarias para una iteracion futura?

### 5. Notas adicionales
- Hay supuestos incorrectos?
- Hay decisiones que deberiamos documentar?
- Algo que no se haya considerado?
```

---

## Notas de uso

- **Se especifico**: si ya sabes que area revisar (seguridad, performance, etc.), mencionalo.
- **No solo senales problemas**: tambien pide soluciones o mejoras concretas.
- **Itera**: despues de la revision, pide al agente que corrija los problemas identificados.
- **Documenta las decisiones**: si algo se deja para despues, agregalo al backlog.

### Ejemplo de pregunta de seguimiento

> Basandote en tu revision, corrige los problemas prioritarios que identificaste. Explica cada cambio.