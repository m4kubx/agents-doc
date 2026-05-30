---
id: [view-id]
title: "[Título de la Vista]"
route: /[ruta]
layout: [sidebar-layout | minimal | blank]
auth:
  required: [true/false]
  roles: [admin, manager, user]
  redirect_on_unauthorized: /login
  note: "[Nota sobre comportamiento de auth si aplica]"
actions:
  - label: "[Texto del Botón]"
    type: [button | icon-button | link]
    variant: [primary | secondary | danger | ghost]
    icon: [icon-name]
    action: [navigate_to <ruta> | open_modal <modal-id> | api_call <endpoint>]
    roles: [lista de roles que ven esta acción]
    confirm_required: [true/false]
    condition: "[Condición adicional, ej: manager solo cuando assigned_to es de su equipo]"
states:
  loading: "[Descripción del esqueleto/loader: Skeleton loader con N filas]"
  empty: |
    [Descripción o ilustración del estado vacío]
    Texto: "[Mensaje para cuando no hay datos]"
    Acción: [Botón/texto de acción para salir del estado vacío]
  error: |
    [Alert color: rojo/amarillo]
    Mensaje: "[Mensaje de error]"
    Acción: [Botón reintentar / contacto soporte]
  success: |
    [Toast/Notificación]
    Mensaje: "[Mensaje de éxito]"
    Duración: [N segundos]
---

# Vista: [Título de la Vista]

## Descripción
[Descripción general de la vista: propósito, usuarios, contexto]

## Layout
```
[Diagrama ASCII del layout]
```

## Comportamiento por Rol

| Rol | Puede ver | Puede crear | Puede editar | Puede eliminar | Notas |
|-----|-----------|-------------|--------------|----------------|-------|
| admin | Sí | Sí | Sí | Sí | |
| manager | Sí (restringido) | Sí | Sí | No | [nota] |
| user | Sí (restringido) | No | No | No | [nota] |

## Componentes de la Vista

| Componente | Tipo | Props | Estados |
|------------|------|-------|---------|
| [nombre] | [tipo] | [propiedades] | [default, loading, error, disabled] |

## Responsive

- **Desktop (>1024px)**: [Comportamiento en desktop]
- **Tablet (768-1024px)**: [Comportamiento en tablet]
- **Mobile (<768px)**: [Comportamiento en mobile]

## Mockup Textual

```
[Representación ASCII de la pantalla]
┌─────────────────────────────────────┐
│  Título                  [Botón]     │
├─────────────────────────────────────┤
│  [Contenido principal]              │
│                                     │
└─────────────────────────────────────┘
```

## Validaciones

| Campo | Regla | Tipo Error | Mensaje |
|-------|-------|------------|---------|
| [campo] | [regla] | [inline/toast] | [mensaje] |

## Notas Técnicas

- [Nota técnica 1]
- [Nota técnica 2]
