---
title: Índice - Plantillas de Generación de Software Profesional
type: indice
tags:
  - metodologia
  - plantilla
  - generacion-documentacion
---

# Índice de Plantillas Especializadas

Este folder contiene las sub-plantillas que complementan la **[[plantilla-generacion-especificacion-software-profesional]]**.

## Plantillas Disponibles

| Archivo | Fase | Propósito |
|---------|------|-----------|
| `00-Project-Brief-Consolidado.md` | 6 (Final) | Entregable final resumido y accionable |
| `01-Business-Model-Canvas.md` | 1 | Business Model + Requerimientos de Producto |
| `02-ADR-Template.md` | 2 | Decisiones de Stack y Arquitectura (ADRs) |
| `03-Database-Schema.md` | 3 | Esquema de Base de Datos y Modelo de Datos |
| `04-UI-Vistas-y-Wireframes.md` | 4 | Diseño de interfaz, flujos y wireframes |
| `05-API-Design.md` | 5 | Especificación de API (REST/GraphQL/etc.) |
| `06-Seguridad-y-NFR.md` | 5 | Seguridad, Compliance y Requisitos No Funcionales |
| `07-Roadmap-y-Riesgos.md` | 6 | Fases de implementación y gestión de riesgos |

## Cómo Usar

1. Comienza siempre con la plantilla principal.
2. En cada fase, usa la sub-plantilla correspondiente como guía detallada.
3. Genera los entregables en la estructura recomendada dentro de `05-proyectos/<nombre-proyecto>/`.

## Estructura Recomendada de Entregables por Proyecto

```
05-proyectos/mi-proyecto/
├── 00-Project-Brief-Consolidado.md
├── 01-Business-Model-y-Requerimientos/
├── 02-Stack-y-Arquitectura/
│   └── ADRs/
├── 03-Esquema-Base-de-Datos/
├── 04-UI-Vistas-y-Flujos/
├── 05-Especificacion-Tecnica/
│   ├── openapi.yaml
│   └── ...
├── 06-Seguridad-y-NFR/
└── 07-Roadmap-y-Riesgos/
```
