---
id: user-journey-map
title: "Mapa de Viaje del Usuario"
type: user-journey
related_stories: ["US-001", "US-002", "US-003", "US-004"]
roles: [admin, manager, user]
---

# Mapa de Viaje del Usuario

> Visión general de cómo cada rol interactúa con el sistema de principio a fin.

---

## Journey: Admin

```mermaid
journey
  title Viaje del Admin
  section Autenticación
    Login: 3: Admin
    Ver Dashboard: 5: Admin
  section Gestión de Tareas
    Ver tareas globales: 5: Admin
    Crear tarea: 4: Admin
    Asignar a usuario: 4: Admin
    Editar cualquier tarea: 5: Admin
    Eliminar tarea: 3: Admin
  section Gestión de Usuarios
    Ver listado de usuarios: 5: Admin
    Crear usuario: 3: Admin
    Editar usuario: 4: Admin
    Desactivar usuario: 3: Admin
  section Reportes
    Ver dashboard analytics: 5: Admin
    Exportar reportes: 4: Admin
  section Configuración
    Cambiar settings del sistema: 5: Admin
```

### Puntos de Dolor Potenciales
- [Posible dolor 1]
- [Posible dolor 2]

### Oportunidades de Mejora
- [Oportunidad 1]

---

## Journey: Manager

```mermaid
journey
  title Viaje del Manager
  section Autenticación
    Login: 3: Manager
    Ver Dashboard: 5: Manager
  section Gestión de Tareas
    Ver tareas del equipo: 5: Manager
    Crear tarea: 4: Manager
    Asignar a miembro: 3: Manager
    Editar tareas del equipo: 4: Manager
  section Equipo
    Ver miembros del equipo: 4: Manager
    Ver performance: 4: Manager
```

### Puntos de Dolor Potenciales
- [Posible dolor 1]

---

## Journey: User

```mermaid
journey
  title Viaje del Usuario Regular
  section Autenticación
    Login: 3: User
    Ver Dashboard: 5: User
  section Mis Tareas
    Ver mis tareas: 5: User
    Crear tarea personal: 3: User
    Editar mi tarea: 4: User
    Cambiar estado: 4: User
```

### Puntos de Dolor Potenciales
- No puede asignar tareas a otros
- No puede ver tareas del equipo

---

## Matriz de Features por Rol

| Feature | Admin | Manager | User |
|---------|-------|---------|------|
| Login | ✅ | ✅ | ✅ |
| Dashboard | ✅ | ✅ | ✅ |
| Ver todas las tareas | ✅ | ❌ | ❌ |
| Ver tareas del equipo | ✅ | ✅ | ❌ |
| Ver mis tareas | ✅ | ✅ | ✅ |
| Crear tarea | ✅ | ✅ | ✅ |
| Asignar tarea | ✅ | ✅ (equipo) | ❌ |
| Editar cualquier tarea | ✅ | ❌ | ❌ |
| Editar tareas del equipo | ✅ | ✅ | ❌ |
| Editar tarea propia | ✅ | ✅ | ✅ |
| Eliminar tarea | ✅ | ❌ | ❌ |
| CRUD Usuarios | ✅ | ❌ | ❌ |
| Reportes | ✅ | ✅ (equipo) | ❌ |
| Configuración | ✅ | ❌ | ❌ |

---

## Flujo Transversal del Sistema

```mermaid
flowchart LR
  A[Landing / Login] -->|Autenticado| B{Dashboard por Rol}
  B -->|Admin| C[Dashboard Admin]
  B -->|Manager| D[Dashboard Manager]
  B -->|User| E[Dashboard User]

  C --> F[Tareas Globales]
  C --> G[Usuarios]
  C --> H[Reportes]
  C --> I[Config]

  D --> J[Tareas del Equipo]
  D --> K[Performance]

  E --> L[Mis Tareas]

  F --> M[Crear / Editar / Eliminar]
  G --> N[CRUD Usuarios]
  J --> O[Crear / Asignar / Editar]
  L --> P[Crear / Editar / Estado]

  M --> Q[Volver a lista]
  N --> Q
  O --> Q
  P --> Q
```

---

## Vistas Asociadas

| Vista | Rol(es) | Flujo relacionado |
|-------|---------|-------------------|
| [vista] | [rol] | [flujo] |
| [vista] | [rol] | [flujo] |
