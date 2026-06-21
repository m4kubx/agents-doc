---
id: auth-flow
title: "Flujo de Autenticación"
type: auth-flow
related_stories: ["US-001"]
related_views: ["view-login", "view-register", "view-dashboard"]
roles: [admin, manager, user]
---

# Flujo: Autenticación

## Descripción
Flujo completo de autenticación: login, verificación de sesión, redirección por rol, y cierre de sesión. Cubre todos los estados (loading, error, expired session) y edge cases.

## User Stories Relacionadas
| ID | Historia |
|----|----------|
| US-001 | Como usuario quiero iniciar sesión con email y contraseña para acceder al sistema |
| US-002 | Como usuario quiero cerrar sesión para asegurar mi cuenta |

---

## Diagrama de Flujo

```mermaid
flowchart TD
  START([Usuario visita /login]) --> FORM{Formulario completado?}
  FORM -->|No| RENDER[Renderizar login form]
  FORM -->|Sí| VALIDATE_CLIENT[Validar campos]

  VALIDATE_CLIENT -->|Campos inválidos| SHOW_ERROR[Mostrar errores inline]
  SHOW_ERROR --> FORM

  VALIDATE_CLIENT -->|Válido| LOADING[Botón loading + spinner]
  LOADING --> API[POST /api/auth/login]

  API -->|200 OK + JWT| STORE[Guardar token en localStorage/httpOnly cookie]
  STORE --> DECODE[Decodificar JWT -> extraer rol]
  DECODE --> REDIRECT{Redirigir según rol}

  REDIRECT -->|admin| DASH_ADMIN[/dashboard -> widgets admin]
  REDIRECT -->|manager| DASH_MGR[/dashboard -> widgets manager]
  REDIRECT -->|user| DASH_USER[/dashboard -> widgets user]

  API -->|401| ERR_CRED[Mostrar: Credenciales inválidas]
  ERR_CRED --> FORM

  API -->|429| ERR_RATE[Mostrar: Demasiados intentos. Espere N segundos]
  ERR_RATE --> FORM

  API -->|500| ERR_SERVER[Mostrar: Error del servidor. Intente más tarde]
  ERR_SERVER --> FORM

  %% Sesión existente
  START -->|Ya autenticado| CHECK_TOKEN{Token válido?}
  CHECK_TOKEN -->|Sí| REDIRECT
  CHECK_TOKEN -->|No, expirado| REFRESH{Refresh token válido?}
  REFRESH -->|Sí| STORE
  REFRESH -->|No| CLEAR[Limpiar storage -> redirect /login?expired=true]

  %% Logout
  DASHBOARD([Cualquier vista protegida]) --> LOGOUT[Click Cerrar Sesión]
  LOGOUT --> POST_LOGOUT[POST /api/auth/logout]
  POST_LOGOUT --> CLEAR_SESSION[Limpiar token + storage]
  CLEAR_SESSION --> REDIRECT_LOGIN[Redirect /login]
```

---

## Vista General

### Actores
| Actor | Descripción |
|-------|-------------|
| Usuario no autenticado | Cualquier persona que intenta acceder al sistema |
| Usuario autenticado | Usuario con JWT válido |

### Precondiciones
- El usuario no tiene una sesión activa (para login)
- El sistema está operativo

### Postcondiciones
- El usuario obtiene un JWT y es redirigido según su rol
- O recibe un mensaje de error claro

---

## Pasos del Flujo Detallados

### Paso 1: Renderizar formulario de login
| Campo | Valor |
|-------|-------|
| **Vista** | `login.html` (`07-mockups/login.html`) |
| **Acción** | Usuario completa email + password |
| **Validaciones** | Email formato válido, password no vacío |
| **Estado inicial** | Formulario vacío, botón "Iniciar Sesión" habilitado |

### Paso 2: Envío del formulario
| Campo | Valor |
|-------|-------|
| **Estado** | loading: botón deshabilitado + spinner ("Iniciando sesión...") |
| **API** | `POST /api/auth/login` `{ email, password }` |
| **Rate limit** | 5 intentos/minuto por IP |

### Paso 3a: Login exitoso
| Campo | Valor |
|-------|-------|
| **Respuesta** | `{ token, user: { name, email, role } }` |
| **Acción** | Guardar token, redirigir según rol |
| **Admin** | `/dashboard` con todos los widgets |
| **Manager** | `/dashboard` con widgets de equipo |
| **User** | `/dashboard` con widgets personales |

### Paso 3b: Login fallido
| Errores | | |
|---------|---|---|
| **401** | Credenciales inválidas | Alert rojo: "Email o contraseña incorrectos" |
| **429** | Rate limit | "Demasiados intentos. Intenta de nuevo en 30 segundos" |
| **500** | Error servidor | "Error del servidor. Intenta más tarde" |

### Paso 4: Sesión expirada
| Escenario | Comportamiento |
|-----------|---------------|
| Token expirado + refresh válido | Renew automático (sin intervención del usuario) |
| Token expirado + sin refresh | Redirect a `/login?expired=true` con mensaje "Tu sesión ha expirado" |

### Paso 5: Cierre de sesión
| Campo | Valor |
|-------|-------|
| **Acción** | Click en "Cerrar Sesión" (sidebar) |
| **API** | `POST /api/auth/logout` |
| **UI** | Botón loading -> toast "Sesión cerrada" -> redirect `/login` |

---

## Estados de Interfaz

| Paso | Vista | Estado | Descripción |
|------|-------|--------|-------------|
| 1 | login | normal | Formulario con inputs vacíos, botón primario |
| 2 | login | loading | Botón deshabilitado + spinner, inputs deshabilitados |
| 3b | login | error | Alert rojo sobre el formulario, datos del usuario preservados |
| 4 | dashboard | success | Widgets cargados con datos según rol |
| - | cualquier | session-expired | Redirect a `/login?expired=true` con toast |

## Mockups Relacionados
- [`07-mockups/login.html`](../07-mockups/login.html) — Formulario de login con estados normal, loading, error

## Reglas de Negocio

| ID | Regla | Aplica a |
|----|-------|----------|
| R1 | Máximo 5 intentos de login por minuto por IP | Todos |
| R2 | Sesión expira después de 24 horas de inactividad | Todos |
| R3 | Refresh token dura 7 días | Todos |
| R4 | Al cerrar sesión, invalidar token en servidor | Todos |
