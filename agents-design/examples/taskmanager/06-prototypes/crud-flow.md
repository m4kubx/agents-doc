# Flujo CRUD de Tareas - TaskManager

## CREATE: Crear Tarea

```mermaid
sequenceDiagram
    actor User as Usuario
    participant List as TaskList
    participant Create as TaskCreate
    participant API as API
    participant DB as DB

    User->>List: Click "+ Crear Tarea"
    List->>Create: Navegar a /tasks/create
    Create->>User: Muestra formulario vacio
    User->>Create: Llena campos (titulo, descripcion, prioridad, asignado)
    Create->>Create: Validacion cliente
    alt Campos invalidos
        Create-->>User: Errores inline
    else Campos validos
        User->>Create: Click "Guardar"
        Create->>Create: Boton loading
        Create->>API: POST /api/tasks {body}
        API->>DB: INSERT task
        DB-->>API: task created
        API-->>Create: 201 {task}
        Create-->>User: Toast success "Tarea creada exitosamente"
        Create->>Create: Redirect a /tasks (o /tasks/{id} para ver detalle)
    end
```

## READ: Ver Listado y Detalle

```mermaid
sequenceDiagram
    actor User as Usuario
    participant Nav as Navegacion
    participant List as TaskList
    participant Detail as TaskDetail
    participant API as API

    User->>Nav: Click "Tareas" en sidebar
    Nav->>List: Navegar a /tasks
    List->>API: GET /api/tasks?page=1&limit=10
    API-->>List: 200 {tasks, total, page, limit}
    List-->>User: Renderiza tabla con datos
    User->>List: Click fila (o icono ojo)
    List->>Detail: Navegar a /tasks/{id}
    Detail->>API: GET /api/tasks/{id}
    API-->>Detail: 200 {task, comments[]}
    Detail-->>User: Renderiza detalle + comentarios
```

## UPDATE: Editar Tarea

```mermaid
sequenceDiagram
    actor User as Usuario
    participant Detail as TaskDetail
    participant Edit as TaskEdit
    participant API as API

    User->>Detail: Click "Editar"
    Detail->>Edit: Navegar a /tasks/{id}/edit
    Edit->>API: GET /api/tasks/{id} (para precargar datos)
    API-->>Edit: 200 {task}
    Edit->>User: Formulario precargado
    User->>Edit: Modifica campos
    User->>Edit: Click "Guardar Cambios"
    Edit->>API: PUT /api/tasks/{id} {body}
    API->>DB: UPDATE task
    DB-->>API: task updated
    API-->>Edit: 200 {task}
    Edit-->>User: Toast success "Cambios guardados"
    Edit->>Edit: Redirect a /tasks/{id} (detalle actualizado)
```

## DELETE: Eliminar Tarea

```mermaid
sequenceDiagram
    actor User as Usuario
    participant List as TaskList
    participant Modal as ConfirmModal
    participant API as API

    User->>List: Click icono eliminar (solo admin)
    List->>Modal: Abrir modal de confirmacion
    Modal->>User: "Esta seguro de eliminar la tarea X?"
    alt Cancela
        User->>Modal: Click "Cancelar"
        Modal->>List: Cerrar modal
    else Confirma
        User->>Modal: Click "Eliminar"
        Modal->>Modal: Boton loading
        Modal->>API: DELETE /api/tasks/{id}
        API->>DB: DELETE task
        DB-->>API: task deleted
        API-->>Modal: 204 No Content
        Modal->>List: Cerrar modal
        List->>API: GET /api/tasks (refrescar listado)
        API-->>List: 200 {tasks}
        List-->>User: Tabla actualizada + toast "Tarea eliminada"
    end
```

## Flujo de Autorizacion por Operacion

| Operacion | Admin | Manager | User |
|-----------|-------|---------|------|
| Crear | Si | Si (solo su equipo) | No |
| Ver listado | Si | Si | Si (solo propias) |
| Ver detalle | Si | Si | Si (solo propias) |
| Editar | Si | Si (solo su equipo) | No |
| Eliminar | Si | No | No |
