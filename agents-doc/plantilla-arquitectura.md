# Plantilla: Solicitar Arquitectura de Sistema

> Usala cuando quieras que el agente disene la arquitectura **antes de escribir codigo**.

---

## Prompt listo para copiar y pegar

```
Actua como arquitecto de software senior y lider tecnico.

Quiero construir un sistema de [tipo de sistema] para [tipo de usuario].

## Objetivo del negocio
El sistema debe resolver [problema principal en una o dos lineas].

## Usuarios
- Admin: [que hace]
- Operador: [que hace]
- Cliente: [que hace]

## Funcionalidades obligatorias
1. [funcionalidad 1]
2. [funcionalidad 2]
3. [funcionalidad 3]

## Fuera de alcance (MVP)
- [lo que no entra]
- [lo que no entra]

## Stack preferido
- Frontend: [framework/libreria]
- Backend: [lenguaje/framework]
- Base de datos: [motor]
- Infraestructura: [opcional]

## Restricciones tecnicas
- Arquitectura modular
- Priorizar mantenibilidad sobre velocidad
- Incluir seguridad basica desde el inicio
- Preparado para escalar a futuro
- Codigo en TypeScript / Python / [lenguaje]

## Lo que necesito ahora (NO escribas codigo aun)
Quiero que:
1. Propongas la arquitectura general del sistema
2. Dividas el sistema en modulos con sus responsabilidades
3. Definas las entidades de dominio y sus relaciones
4. Propongas las APIs o interfaces principales
5. Armes un plan de implementacion por fases
6. Identifiques riesgos tecnicos, supuestos y preguntas abiertas

Si falta informacion para tomar decisiones, preguntame antes de continuar.
```

---

## Notas de uso

- **Se especifico con el stack**: cuanto mas preciso, mejor sera el diseno.
- **Define el fuera de alcance**: evita que el agente proponga funcionalidades extras.
- **Revisa criticamente**: no aceptes el primer diseno. Pregunta que alternativas consideraste.
- **Pide diagramas**: puedes pedir diagramas en Mermaid para visualizar la arquitectura.
- **Itera**: si algo no te convence, pide ajustes antes de pasar a implementacion.

### Ejemplo de pregunta de seguimiento

> Este diseno parece razonable, pero me preocupa la escalabilidad del modulo X. Que alternativas tenemos para manejar [caso de uso]?