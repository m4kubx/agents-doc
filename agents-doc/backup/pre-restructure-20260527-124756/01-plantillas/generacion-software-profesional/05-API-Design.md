---
title: Sub-Plantilla - API Design y Especificación
type: plantilla
tags:
  - metodologia
  - plantilla
  - generacion-documentacion
  - api
  - backend
fase: 5
---

# Sub-Plantilla: API Design y Especificación Técnica

---

## 1. Estilo de API

- REST / GraphQL / gRPC / tRPC / Event-Driven
- Versionado (URL, Header, etc.)
- Base URL y convenciones de naming

## 2. Autenticación y Autorización

- Método principal (JWT, Session, OAuth2, API Keys, etc.)
- Refresh tokens strategy
- Roles y permisos (RBAC / ABAC)
- Rate limiting por endpoint o por usuario

## 3. Principios de Diseño

- Convenciones de nombres de endpoints
- Formato de respuestas de error (estándar)
- Paginación, filtrado, ordenamiento
- Idempotencia
- HATEOAS (si aplica)

## 4. Especificación Formal

Se recomienda generar un archivo `openapi.yaml` (OpenAPI 3.1) o `asyncapi.yaml`.

### Endpoints Principales (resumen)

| Método | Endpoint | Descripción | Autenticación | Rate Limit |
|--------|----------|-------------|---------------|------------|
| POST   | /auth/login | | | |
| GET    | /users/me | | | |

(Completar con los 15-25 endpoints más importantes)

## 5. Modelos de Datos de la API (DTOs)

- Request bodies importantes
- Response bodies
- Errores comunes

## 6. Seguridad de la API

- Input validation
- Protección contra inyección
- CORS policy
- Sensitive data handling

**Entregables recomendados**:
- `05-API-Specification.md`
- `openapi.yaml` (en la raíz del proyecto o en `/docs`)
