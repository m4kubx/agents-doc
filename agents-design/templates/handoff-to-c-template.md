# 🚀 PROMPT DE ACTIVACIÓN — Agente C (Implementation)
# Generado por: Agente B (Design Documentation)
# Proyecto: [NOMBRE_PROYECTO]
# Versión: 1.0.0
# Mockups Aprobados: Sí ([FECHA_APROBACION])

---

## 📋 INSTRUCCIÓN PRINCIPAL

Actúa como un **Desarrollador Senior Full-Stack**. Debes crear un proyecto de software completo
y funcional llamado **[NOMBRE_PROYECTO]** basándote en la especificación técnica detallada a continuación.

**Este diseño ha sido revisado y aprobado.** Los mockups HTML están disponibles como referencia visual.
Consulta los archivos en `07-mockups/_index.html` para ver la galería completa.

No hagas preguntas. Implementa TODO lo especificado. Crea el proyecto en: `<ruta-destino>/`

---

## 📁 REFERENCIA DE MOCKUPS APROBADOS

Los siguientes mockups HTML fueron aprobados y deben usarse como referencia visual para la implementación:

| Vista | Archivo Mockup | Descripción |
|-------|---------------|-------------|
| [Vista] | `07-mockups/[archivo].html` | [descripción] |
| [Vista] | `07-mockups/[archivo].html` | [descripción] |

**Nota**: Los mockups incluyen toggles `<details>` para visualizar estados loading, empty y error. Cada mockup representa fielmente la estructura visual que debe implementarse.

---

## 🧪 ESTRATEGIA TDD (OBLIGATORIO)

> **Usa TDD en cada fase**: Escribe los tests ANTES del código.
> Ciclo: Red (test falla) → Green (implementar) → Refactor (mejorar).

### Pirámide de Testing
```
        ⬆  E2E (Playwright)           — Flujos críticos
      ⬆⬆⬆  Component (Testing Library)  — Vistas + estados + roles
    ⬆⬆⬆⬆⬆  Integration (Supertest)      — API + DB + RBAC
  ⬆⬆⬆⬆⬆⬆⬆⬆  Unit (Vitest)                — Servicios + middleware
```

### Lo que DEBES testear en cada vista:

| Categoría | Qué testear |
|-----------|-------------|
| **RBAC** | Cada endpoint × cada rol → 200/403/401. Cada botón existe/solo para roles autorizados |
| **Botones** | Render, texto, variant, disabled, loading, click handler, navegación |
| **Estados** | Loading skeleton, empty state (mensaje + CTA), error state (mensaje + reintentar) |
| **Formularios** | Validación inline, submit, loading, éxito (toast + redirect), error servidor |
| **Navegación** | Sidebar items por rol, links funcionan, redirects, breadcrumbs |
| **Errores HTTP** | 403, 404, 500 renderizan correctamente con acciones |

### Plantillas de tests de referencia
Usa estas plantillas en `templates/` para escribir los tests:
- `templates/tdd-strategy-template.md` — Estrategia TDD completa
- `templates/test-rbac-template.md` — Tests RBAC por endpoint + componente
- `templates/test-component-template.md` — Tests de componentes UI
- `templates/test-e2e-template.md` — Tests E2E con Playwright

---

## 🏗️ 1. ESPECIFICACIÓN TÉCNICA DEL PROYECTO

### 1.1 Stack Tecnológico
| Capa | Tecnología | Versión |
|------|-----------|---------|
| Frontend | [tecnología] | [versión] |
| Backend | [tecnología] | [versión] |
| Base de Datos | [tecnología] | [versión] |
| ORM | [tecnología] | [versión] |
| Auth | [tecnología] | [versión] |
| UI Library | [tecnología] | - |
| Testing | [tecnología] | - |
| CI/CD | [tecnología] | - |

### 1.2 Estructura de Directorios
```
[proyecto]/
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   ├── views/
│   │   ├── hooks/
│   │   ├── services/
│   │   ├── contexts/
│   │   ├── types/
│   │   └── utils/
│   ├── public/
│   ├── tests/
│   ├── package.json
│   └── tsconfig.json
├── backend/
│   ├── src/
│   │   ├── routes/
│   │   ├── controllers/
│   │   ├── services/
│   │   ├── middleware/
│   │   ├── models/
│   │   └── utils/
│   ├── prisma/ (o equivalente)
│   ├── tests/
│   ├── package.json
│   └── tsconfig.json
├── docker-compose.yml
├── Dockerfile
├── .env.example
├── .github/workflows/ci.yml
└── README.md
```

---

## 👥 2. MODELO DE USUARIOS Y ROLES (RBAC)

### 2.1 Roles del Sistema
| Rol | Descripción | Permisos |
|-----|-------------|----------|
| admin | [descripción] | [permisos] |
| manager | [descripción] | [permisos] |
| user | [descripción] | [permisos] |

### 2.2 Matriz de Permisos (Rol × Vista × Acción)
| Vista | admin | manager | user | público |
|-------|-------|---------|------|---------|
| [vista] | ✅ | ✅ | ✅ | ❌ |

### 2.3 Route Guards
| Ruta | Guard | Redirigir a |
|------|-------|-------------|
| [ruta] | `[guard]` | `[fallback]` |

---

## 🖥️ 3. VISTAS DEL SISTEMA

### 3.1 Vistas Públicas
[Descripción de cada vista pública con sus componentes]

### 3.2 Vistas Protegidas
[Descripción de cada vista protegida con sus componentes]

### 3.3 Sidebar por Rol
```yaml
admin:
  - label: [label], route: /[ruta], icon: [icon]
```

---

## 🎨 4. COMPONENTES UI REUTILIZABLES

### 4.1 Botones
| Variante | Uso | Estados |
|----------|-----|---------|
| primary | Acción principal | default, hover, active, disabled, loading |

### 4.2 Formularios
[Especificación de formularios]

### 4.3 Tablas
[Especificación de tablas]

### 4.4 Modales
[Especificación de modales]

---

## ⚠️ 5. VISTAS DE ERROR

### 5.1 403 — Acceso Denegado
- Layout: Minimal
- Acciones: Volver al inicio, Solicitar acceso

### 5.2 404 — No Encontrado
- Layout: Minimal
- Acciones: Ir al inicio, Contactar soporte

### 5.3 500 — Error Interno
- Layout: Minimal
- Acciones: Reintentar, Contactar soporte

---

## 🗄️ 6. MODELO DE BASE DE DATOS

```prisma
// Schema Prisma completo
```

---

## 🔌 7. API ENDPOINTS
| Método | Ruta | Auth | Rol | Descripción |
|--------|------|------|-----|-------------|
| GET | [ruta] | Sí/No | [rol] | [desc] |

---

## ✅ 8. REQUISITOS NO FUNCIONALES
- [NFR 1]
- [NFR 2]

---

## 📐 9. PLAN DE IMPLEMENTACIÓN (FASES CON TDD)

> ⚠️ **Cada fase sigue TDD**: Escribe los tests → luego implementa. Los tests deben fallar antes de implementar, y pasar después.

### Fase 1: [Nombre]
- [ ] **TEST**: Config de testing (vitest, playwright, setup)
- [ ] **TEST**: Server corre, BD conecta
- [ ] Implementar scaffolding (frontend + backend + Docker)
- [ ] Tests pasan

### Fase 2: [Nombre]
- [ ] **TEST**: Auth endpoints (login 200/401, register 201/400, logout 200)
- [ ] **TEST**: Auth UI (login form render, validación, loading, error, redirect)
- [ ] Implementar auth backend + frontend
- [ ] **TEST**: E2E auth (login flow, logout, sesión expirada)
- [ ] Tests pasan + refactor

### Fase 3: [Nombre]
- [ ] **TEST**: RBAC de [recurso] (cada endpoint × admin/manager/user/sin-token)
- [ ] **TEST**: CRUD [recurso] UI (botones según rol, tabla, formulario, estados)
- [ ] Implementar [recurso] backend + frontend
- [ ] **TEST**: E2E [recurso] (crear, editar, eliminar según rol)
- [ ] Tests pasan + refactor

### Fase 4: [Nombre]
- [ ] **TEST**: [tests de la fase]
- [ ] Implementar [feature]
- [ ] Tests pasan + refactor

### Fase 5: [Nombre]
- [ ] **TEST**: [tests de la fase]
- [ ] Implementar [feature]
- [ ] Tests pasan + refactor

### Fase 6: Pulido y Cobertura
- [ ] **TEST**: Vistas de error (403, 404, 500) render correcto
- [ ] **TEST**: Estados (loading, empty, error) en todas las vistas
- [ ] **TEST**: Responsive layout
- [ ] **TEST**: Cobertura mínima ≥ 80%
- [ ] Refactor general manteniendo tests verdes

---

## 🚫 10. RESTRICCIONES
1. [Restricción 1]
2. [Restricción 2]

---

## 🔄 11. OUTPUT ESPERADO
Al finalizar, el proyecto debe contener:
- Código fuente completo y funcional
- **Tests escritos ANTES que el código** (TDD) en cada fase
- **Cobertura mínima**: ≥ 80% en backend (lines), ≥ 70% en frontend (lines)
- **Tests unitarios**: Todos los servicios y middleware
- **Tests de integración**: Todos los endpoints × cada rol
- **Tests de componentes**: Cada vista con loading/empty/error/success + botones por rol
- **Tests E2E**: Flujos críticos (auth, RBAC, CRUD principal)
- **Test command**: `npm test` (unit + integration + component) y `npm run test:e2e`
- README con instrucciones de instalación, testing y uso
- docker-compose.yml funcional
- CI pipeline configurado con `npm test` en cada PR
- .env.example con todas las variables necesarias

---

*Prompt generado por Agente B (Design Documentation)*
*Basado en la documentación del Agente A (agents-doc)*
