---
id: error-[code]
title: "[Título Error]"
route: /[code]
auth:
  required: false
  note: "[Nota sobre cuándo se muestra este error]"
layout: minimal
components:
  - type: error-illustration
    variant: [forbidden | not-found | server-error]
  - type: error-message
    text: "[Mensaje principal]"
    description: "[Descripción adicional]"
  - type: action-buttons
    items:
      - label: "[Acción 1]"
        action: [navigate_to <ruta>]
        variant: primary
      - label: "[Acción 2]"
        action: [open_modal <id>]
        variant: secondary
---

# Vista de Error [code]: [Título]

## Cuándo se muestra
- [Situación 1]
- [Situación 2]

## Comportamiento
1. [Paso 1 del flujo de error]
2. [Paso 2 del flujo de error]
3. [Paso 3 - redirección/acción]

## Layout
```
┌─────────────────────────────────────┐
│                                     │
│         [Ilustración]               │
│                                     │
│    [Código Error: XXX]              │
│                                     │
│    [Mensaje Principal]              │
│    [Descripción secundaria]         │
│                                     │
│    [Botón Primario]                 │
│    [Botón Secundario]               │
│                                     │
└─────────────────────────────────────┘
```

## HTTP Status
[Código HTTP]

## Notas Técnicas
- No requiere autenticación
- Layout minimal: sin sidebar, sin header de navegación
- Debe ser responsive (centrado vertical y horizontalmente)
- El código de error debe ser prominente
