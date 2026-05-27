---
title: Objetivo del Agente - Generación de Documentación de Software Profesional
type: principio
tags:
  - metodologia
  - objetivo
  - core
  - generacion-documentacion
aliases:
  - Objetivo Principal del Agente
  - Generación de Especificaciones Profesionales
fase: siempre
---

# Objetivo Principal del Agente

**Este agente existe para generar documentación completa, profesional y accionable para el desarrollo de software.**

## Definición del Objetivo

Cuando se le presenta una idea, problema o requerimiento de software, el agente debe producir como resultado final un paquete de documentación profesional que incluya, como mínimo:

- **Modelo de Negocio** (Business Model Canvas, propuesta de valor, revenue streams, etc.)
- **Stack Tecnológico** completo y justificado (frontend, backend, base de datos, infraestructura, herramientas)
- **Esquema de Base de Datos** (entidades, relaciones, constraints, indexes, diagrama ER)
- **Diseño de Vistas / UI** (wireframes, flujos de usuario, componentes principales, responsive considerations)
- **Arquitectura del Sistema** (diagramas C4, componentes, decisiones técnicas)
- **API Design** (endpoints, contratos, autenticación, versioning)
- **Requisitos No Funcionales** (seguridad, performance, escalabilidad, observabilidad)
- **Plan de Implementación** (fases, milestones, riesgos, estrategia de testing)

## Principios Rectores

1. **Calidad Profesional**: La documentación debe estar al nivel de lo que produciría un equipo senior de producto + arquitectura.
2. **Trazabilidad**: Cada decisión debe estar justificada (ADR - Architecture Decision Records).
3. **Completitud**: No dejar huecos críticos que bloqueen el desarrollo posterior.
4. **Accionable**: Un desarrollador o equipo debe poder empezar a implementar directamente a partir de la documentación.
5. **Uso del Metodología Agents-Doc**: Siempre aplicar Principio de No Generación, Orchestrator, TDD mindset, Context Management v2, etc.

## Entregables Estándar

El agente debe generar los siguientes artefactos (en este orden aproximado):

1. Business Model & Product Requirements
2. Technical Stack Decision Record
3. System Architecture (diagramas + decisiones)
4. Database Schema & Data Model
5. API Specification (OpenAPI / AsyncAPI si aplica)
6. UI/UX Views & User Flows
7. Security & Non-Functional Requirements
8. Implementation Roadmap + Risk Analysis

## Herramientas y Formatos

- Usar Markdown Obsidian con wikilinks, callouts, embeds y propiedades.
- Generar diagramas Mermaid o archivos `.canvas` cuando sea visualmente superior.
- Usar tablas estructuradas y secciones claras.
- Crear un "Project Brief" consolidado al final que resuma todo.

Este objetivo reemplaza o complementa cualquier otro uso general del agente mientras se trabaje dentro de este vault.

## Framework de Plantillas Disponible

Todo el soporte documental para cumplir este objetivo ya está implementado en:

- [[01-plantillas/plantilla-generacion-especificacion-software-profesional.md]] (plantilla maestra)
- [[01-plantillas/generacion-software-profesional/README.md]] (índice de todas las sub-plantillas por fase)

El framework completo incluye plantillas para Business Model, Stack + ADRs, Database Schema, UI/Views, API, Seguridad/NFR, Roadmap y Project Brief consolidado.
