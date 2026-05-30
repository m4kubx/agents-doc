---
id: tasks-list
title: "Listado de Tareas"
route: /tasks
layout: sidebar-layout
auth:
  required: true
  roles: [admin, manager, user]
  redirect_on_unauthorized: /login
actions:
  - label: "Crear Tarea"
    type: button
    variant: primary
    icon: plus
    action: navigate_to /tasks/create
    roles: [admin, manager]
  - label: "Ver Detalle"
    type: icon-button
    icon: eye
    action: navigate_to /tasks/{id}
    roles: [admin, manager, user]
  - label: "Editar"
    type: icon-button
    icon: pencil
    action: navigate_to /tasks/{id}/edit
    roles: [admin, manager]
    condition: "manager solo edita tareas de su equipo"
  - label: "Eliminar"
    type: icon-button
    icon: trash
    variant: danger
    action: open_modal confirm-delete
    roles: [admin]
    confirm_required: true
states:
  loading: "Skeleton table con 5 filas"
  empty: "Ilustracion + No hay tareas registradas + boton Crear primera tarea"
  error: "Alert rojo + Error al cargar tareas + boton Reintentar"
  success: "Toast verde Tarea creada exitosamente"
---

# Vista: Listado de Tareas

## Descripcion
Tabla paginada con todas las tareas del sistema. Contenido visible segun rol.

## Comportamiento por Rol
| Rol | Ve todas | Crea | Edita | Elimina |
|-----|----------|------|-------|---------|
| admin | Si | Si | Si | Si |
| manager | Su equipo | Si | Si | No |
| user | Solo suyas | No | No | No |

## Componentes
- Tabla con columnas: Titulo, Asignado, Estado, Prioridad, Fecha, Acciones
- Barra de busqueda con debounce (300ms)
- Filtros: Estado, Prioridad, Asignado a
- Paginacion (20 items/pagina)

## Responsive
- Desktop (1024px+): Tabla completa
- Tablet (768-1024px): Columnas colapsables
- Mobile (<768px): Cards en lugar de tabla
