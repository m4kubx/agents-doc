---
id: user-journey-map
title: "Mapa de Viaje del Usuario"
type: user-journey
related_stories: ["US-001", "US-002", "US-003", "US-004"]
roles: [admin, manager, user]
---

# Mapa de Viaje del Usuario — TaskManager

## Journey: Admin

```mermaid
journey
  title Viaje del Administrador
  section Autenticación
    Login: 3: Admin
    Ver Dashboard: 5: Admin
  section Gestión de Tareas
    Ver todas las tareas: 5: Admin
    Crear tarea: 4: Admin
    Asignar a cualquier usuario: 4: Admin
    Editar cualquier tarea: 5: Admin
    Eliminar tarea: 3: Admin
  section Gestión de Usuarios
    Ver listado de usuarios: 5: Admin
    Crear usuario: 3: Admin
    Editar usuario: 4: Admin
    Desactivar usuario: 3: Admin
  section Reportes
    Ver analytics del sistema: 5: Admin
    Exportar reportes: 4: Admin
  section Configuración
    Cambiar settings del sistema: 5: Admin
```

### Reglas de Negocio para Admin
- Puede ver, crear, editar y eliminar **cualquier** tarea
- CRUD completo de usuarios
- Acceso a reportes globales
- Configuración del sistema

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
    Crear tarea para el equipo: 4: Manager
    Asignar a miembros del equipo: 3: Manager
    Editar tareas del equipo: 4: Manager
  section Equipo
    Ver miembros del equipo: 4: Manager
    Ver performance del equipo: 4: Manager
```

### Reglas de Negocio para Manager
- Solo ve tareas de los miembros de **su equipo**
- No puede eliminar tareas
- No puede gestionar usuarios (solo ver miembros)
- No puede acceder a config del sistema

---

## Journey: User

```mermaid
journey
  title Viaje del Usuario Regular
  section Autenticación
    Login: 3: User
    Ver Dashboard personal: 5: User
  section Mis Tareas
    Ver solo mis tareas: 5: User
    Crear tarea personal: 3: User
    Editar mi tarea: 4: User
    Cambiar estado de mi tarea: 4: User
```

### Reglas de Negocio para User
- Solo ve tareas **asignadas a él** o **creadas por él**
- No puede asignar tareas a otros
- No puede eliminar tareas
- No puede ver usuarios ni reportes

---

## Matriz de Features por Rol

| Feature | Admin | Manager | User |
|---------|-------|---------|------|
| Login | ✅ | ✅ | ✅ |
| Dashboard con widgets | ✅ | ✅ | ✅ |
| Ver todas las tareas | ✅ | ❌ | ❌ |
| Ver tareas del equipo | ✅ | ✅ | ❌ |
| Ver mis tareas | ✅ | ✅ | ✅ |
| Crear tarea | ✅ | ✅ | ✅ |
| Asignar tarea a otros | ✅ | ✅ (solo equipo) | ❌ |
| Editar cualquier tarea | ✅ | ❌ | ❌ |
| Editar tareas del equipo | ✅ | ✅ | ❌ |
| Editar tarea propia | ✅ | ✅ | ✅ |
| Eliminar tarea | ✅ | ❌ | ❌ |
| CRUD Usuarios | ✅ | ❌ | ❌ |
| Ver listado de usuarios | ✅ | ✅ (solo equipo) | ❌ |
| Reportes globales | ✅ | ❌ | ❌ |
| Reportes del equipo | ✅ | ✅ | ❌ |
| Configuración del sistema | ✅ | ❌ | ❌ |

---

## Flujo Transversal del Sistema

```mermaid
flowchart LR
  subgraph Auth
    A[Login] -->|Autenticado| B{Rol}
    A -->|Error| A
  end

  subgraph Dashboard
    B -->|admin| C[Dashboard Admin]
    B -->|manager| D[Dashboard Manager]
    B -->|user| E[Dashboard User]
  end

  subgraph Tareas
    C --> F[Todas las Tareas]
    D --> G[Tareas del Equipo]
    E --> H[Mis Tareas]
    F --> I[CRUD Completo]
    G --> J[CRUD del Equipo]
    H --> K[CRUD Personal]
  end

  subgraph Admin
    C --> L[Usuarios]
    C --> M[Reportes]
    C --> N[Configuración]
  end

  subgraph Manager
    D --> O[Miembros del Equipo]
    D --> P[Performance]
  end
```

---

## Vistas Asociadas por Rol

| Vista | Archivo Mockup | Admin | Manager | User |
|-------|---------------|-------|---------|------|
| Login | `07-mockups/login.html` | ✅ | ✅ | ✅ |
| Dashboard | `07-mockups/dashboard.html` | ✅ | ✅ | ✅ |
| Listado de Tareas | `07-mockups/tasks-list.html` | ✅ (todas) | ✅ (equipo) | ✅ (propias) |
| Formulario de Tarea | `07-mockups/task-form.html` | ✅ | ✅ | ❌ |
| 403 Acceso Denegado | `07-mockups/403.html` | ❌ | ❌ | ❌ |
| 404 No Encontrado | `07-mockups/404.html` | ✅ | ✅ | ✅ |
| 500 Error Interno | `07-mockups/500.html` | ✅ | ✅ | ✅ |
