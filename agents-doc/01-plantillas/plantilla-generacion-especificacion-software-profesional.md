---
title: Plantilla - Generación de Especificación Completa de Software Profesional
type: plantilla
tags:
  - metodologia
  - plantilla
  - generacion-documentacion
  - software-profesional
fase: 1
aliases:
  - Plantilla Especificación Software Profesional
  - Generar Documentación Técnica Completa
---

# Plantilla: Generación de Especificación de Software Profesional

> **Objetivo**: Transformar una idea o requerimiento en un paquete completo de documentación profesional listo para desarrollo.

Esta plantilla sigue el **Patrón Orchestrator** y el **Principio de No Generación Sin Orden**.

---

## Fase 0 — Activación y Clarificación (Obligatoria)

Antes de comenzar cualquier trabajo:

1. Activar explícitamente el **Principio de No Generación** (ver [[principio-no-generacion-sin-orden]]).
2. Usar [[plantilla-gestion-contexto-v2]] si es un proyecto de mediana/grande escala.
3. Pedir al usuario:
   - Nombre provisional del proyecto
   - Descripción de una línea
   - Dominio / industria
   - Usuarios objetivo
   - Restricciones conocidas (presupuesto, tiempo, equipo, tecnología obligatoria)
   - Objetivos de negocio principales

**Entregable de esta fase**: Un "Project Brief Inicial" de máximo 1 página.

---

## Fase 1 — Modelo de Negocio y Requerimientos de Producto

**Rol principal**: Orchestrator + Arquitecto de Producto (mental)

### Objetivos
- Entender el problema real y la propuesta de valor.
- Definir quién paga, cómo se monetiza, y qué métricas importan.

### Artefactos a generar

1. **Business Model Canvas** (versión completa)
2. **Propuesta de Valor** clara y diferenciada
3. **User Personas** principales (2-4)
4. **User Stories / Jobs to be Done** de alto nivel
5. **MVP Scope** (qué entra y qué queda fuera en la primera versión)
6. **Métricas de Éxito** (North Star + métricas de soporte)

### Preguntas clave que debe responder el agente

- ¿Cuál es el problema doloroso que resuelve?
- ¿Por qué las soluciones actuales fallan?
- ¿Cómo se genera revenue (o impacto)?
- ¿Cuáles son los riesgos de negocio más grandes?

**Entregable**: Documento `01-Business-Model-y-Requerimientos.md`

---

## Fase 2 — Stack Tecnológico y Decisiones de Arquitectura

**Rol principal**: Arquitecto

### Objetivos
- Elegir el stack más adecuado (no el más moderno, el más correcto).
- Documentar las decisiones con ADRs.

### Artefactos obligatorios

1. **Technical Stack Decision Record** (formato ADR)
   - Frontend
   - Backend / Runtime
   - Base de datos (principal + complementarias)
   - Infraestructura y Deployment
   - Observabilidad, Logging, Monitoring
   - Herramientas de desarrollo y testing
2. **Diagrama de Arquitectura** (C4 Context + Container, o Mermaid)
3. **Justificación de cada elección** (trade-offs, restricciones, experiencia del equipo)

### Criterios de decisión
- Madurez y estabilidad
- Velocidad de desarrollo vs mantenimiento a largo plazo
- Escalabilidad realista
- Costo total de ownership
- Experiencia del equipo / facilidad de contratación

**Entregable**: `02-Stack-y-Arquitectura.md` + ADRs individuales

---

## Fase 3 — Modelo de Datos y Esquema de Base de Datos

**Rol principal**: Arquitecto + Developer Senior

### Artefactos

1. **Diagrama Entidad-Relación** (ERD)
2. **Esquema de Base de Datos** completo:
   - Tablas / Colecciones
   - Columnas / Campos con tipos
   - Claves primarias, foráneas y restricciones
   - Índices recomendados
   - Soft deletes / auditoría (si aplica)
3. **Decisiones de modelado** (normalización vs performance, polyglot persistence, etc.)
4. **Data Access Patterns** importantes

### Formato recomendado
- SQL: Migraciones + diagrama Mermaid o DBML
- NoSQL: Documentos de ejemplo + reglas de validación

**Entregable**: `03-Esquema-Base-de-Datos.md` + diagrama visual

---

## Fase 4 — Diseño de Vistas, Flujos de Usuario y UI

**Rol principal**: Product Designer + Frontend Architect

### Artefactos

1. **User Flows** principales (al menos 5-7 flujos críticos)
2. **Wireframes** de las pantallas más importantes (pueden ser en Markdown + Mermaid o Figma links)
3. **Componentes UI** reutilizables identificados
4. **Estados de pantalla** (loading, error, empty, success)
5. **Responsive Strategy** y breakpoints
6. **Accesibilidad** (WCAG nivel objetivo)

### Niveles de detalle
- Nivel 1: User Flow + Wireframes de baja fidelidad
- Nivel 2 (recomendado): Diseño de las 8-12 pantallas más usadas

**Entregable**: `04-UI-Vistas-y-Flujos-de-Usuario.md` + carpeta `views/` con wireframes

---

## Fase 5 — Especificación Técnica Detallada

### Sub-secciones obligatorias

- **API Design**
  - Especificación OpenAPI 3.1 (o AsyncAPI si es event-driven)
  - Autenticación y Autorización
  - Rate limiting, versioning, error handling
- **Seguridad**
  - Threat model básico
  - OWASP Top 10 considerations
  - Data protection y compliance (GDPR, etc.)
- **Requisitos No Funcionales**
  - Performance (latencia, throughput)
  - Escalabilidad
  - Disponibilidad y Disaster Recovery
  - Observabilidad
- **Testing Strategy**
  - Pirámide de testing
  - Herramientas
  - Cobertura mínima por capa

**Entregable**: `05-Especificacion-Tecnica.md` + `openapi.yaml` (si aplica)

---

## Fase 6 — Roadmap, Riesgos y Plan de Implementación

### Contenido

1. **Fases de Implementación** (recomendado 3-5 fases)
2. **Milestones** con entregables concretos
3. **Risk Register** (riesgos técnicos, de negocio y de equipo)
4. **Estrategia de Mitigación**
5. **Criterios de "Done"** por fase
6. **Recomendaciones de Equipo** (roles necesarios)

**Entregable final**: `00-Project-Brief-Completo.md` que consolide todo lo anterior + índice de navegación.

---

## Reglas de Ejecución (Importantes)

- **Nunca** generar código en esta fase (salvo snippets de ejemplo muy pequeños).
- Cada decisión importante debe tener su **ADR** (Architecture Decision Record).
- Usar **callouts** (`> [!note]`, `> [!warning]`, `> [!important]`) para resaltar riesgos y decisiones clave.
- Mantener trazabilidad: cada sección debe poder enlazarse con wikilinks a otras.
- Al final de cada fase importante, proponer al usuario validar antes de continuar (siguiendo el Principio de No Generación).

---

## Estructura de Carpetas Recomendada para Cada Proyecto

```
05-proyectos/nombre-del-proyecto/
├── 00-Project-Brief-Completo.md
├── 01-Business-Model-y-Requerimientos/
├── 02-Stack-y-Arquitectura/
│   └── ADRs/
├── 03-Esquema-Base-de-Datos/
├── 04-UI-Vistas-y-Flujos/
├── 05-Especificacion-Tecnica/
├── 06-Roadmap-y-Riesgos/
└── diagrams/
```

---

**Esta plantilla es la herramienta principal para cumplir el Objetivo del Agente** definido en `objetivo-agente-documentacion-software-profesional.md`.

**Sub-plantillas especializadas disponibles**: Ver [[01-plantillas/generacion-software-profesional/README]] para el índice completo de todas las sub-plantillas por fase.
