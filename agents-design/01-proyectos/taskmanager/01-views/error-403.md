---
id: error-403
title: "Acceso Denegado"
route: /403
auth:
  required: false
  note: "Se muestra a usuarios autenticados sin permisos para la ruta solicitada"
layout: minimal
components:
  - type: error-illustration
    variant: forbidden
  - type: error-code
    code: "403"
  - type: error-message
    title: "Acceso Denegado"
    description: "No tienes permisos para acceder a esta seccion. Si crees que esto es un error, contacta a tu administrador."
  - type: action-buttons
    items:
      - label: "Volver al Dashboard"
        action: navigate_to /dashboard
        variant: primary
      - label: "Solicitar Acceso"
        action: open_modal request-access
        variant: secondary
---

# Vista de Error 403: Acceso Denegado

## Cuando se muestra
- Usuario autenticado navega a una ruta para la que no tiene rol
- Usuario intenta acceder a un recurso via API sin permisos
- Usuario intenta realizar una accion (ej: eliminar) sin el rol adecuado

## Comportamiento
1. Route guard detecta falta de permisos
2. Redirige a /403 manteniendo URL original (?from=/ruta-original)
3. Muestra pagina de error
4. Opcional: modal para solicitar acceso

## Layout
```
+--------------------------------------+
|                                      |
|           [Ilustracion]              |
|             (escudo con X)           |
|                                      |
|               403                    |
|                                      |
|       Acceso Denegado                |
|   No tienes permisos para acceder    |
|    a esta seccion                    |
|                                      |
|   +----------------------------+     |
|   | Volver al Dashboard       |     |
|   +----------------------------+     |
|                                      |
|   Solicitar Acceso                   |
|                                      |
+--------------------------------------+
```

## HTTP Status
403 Forbidden

## Notas Tecnicas
- Layout minimal: sin sidebar, sin header de navegacion
- Centrado vertical y horizontalmente
- El codigo 403 debe ser prominente (fuente grande)
- La URL original debe pasarse como query param para depuracion
