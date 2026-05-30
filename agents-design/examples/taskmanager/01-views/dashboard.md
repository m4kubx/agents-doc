---
id: dashboard
title: "Dashboard"
route: /dashboard
layout: sidebar-layout
auth:
  required: true
  roles: [admin, manager, user]
  redirect_on_unauthorized: /login
actions:
  - label: "Ir a Tareas"
    type: button
    variant: primary
    icon: arrow-right
    action: navigate_to /tasks
    roles: [admin, manager, user]
  - label: "Crear Tarea Rapida"
    type: button
    variant: secondary
    icon: plus
    action: navigate_to /tasks/create
    roles: [admin, manager]
states:
  loading: "Skeleton grid con 4 widgets"
  empty: "Bienvenida + 'Comienza creando tu primera tarea' + boton"
  error: "Alert: 'Error al cargar dashboard' + boton reintentar"
  success: "-"
---

# Vista: Dashboard

## Descripcion
Panel principal con resumen de metricas y acceso rapido a las funciones principales.

## Widgets por Rol

### Admin
| Widget | Tipo | Descripcion |
|--------|------|-------------|
| Total Tareas | Card numerico | Conteo total + variacion % |
| Tareas por Estado | Grafico donut | pending / in_progress / done |
| Usuarios Activos | Card numerico | Total usuarios activos |
| Tareas Recientes | Lista | Ultimas 5 tareas creadas |

### Manager
| Widget | Tipo | Descripcion |
|--------|------|-------------|
| Tareas del Equipo | Card numerico | Tareas totales del equipo |
| Tareas Pendientes | Lista | Tareas sin comenzar |
| Performance | Mini grafico | Completitud del equipo ultimos 7 dias |

### User
| Widget | Tipo | Descripcion |
|--------|------|-------------|
| Mis Tareas | Card numerico | Total de mis tareas |
| Vencidas | Card (alerta) | Tareas vencidas |
| Proximos Vencimientos | Lista | Top 5 tareas por vencer |

## Layout
```
+---------------------------------------------------+
|  Dashboard                    [Avatar ▼]           |
+--+------------------------------------------------+
|  |                                                    |
| M|  +--------+  +--------+  +--------+  +--------+   |
| e|  | Widget |  | Widget |  | Widget |  | Widget |   |
| n|  |   12   |  |   8    |  |   5    |  |  92%   |   |
| u|  +--------+  +--------+  +--------+  +--------+   |
|  |                                                    |
|  |  +---------------------------------------------+  |
|  |  | Grafico / Lista Reciente                    |  |
|  |  |                                             |  |
|  |  +---------------------------------------------+  |
+--+------------------------------------------------+
```
