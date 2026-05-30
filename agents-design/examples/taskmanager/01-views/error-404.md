---
id: error-404
title: "Pagina No Encontrada"
route: /404
auth:
  required: false
layout: minimal
components:
  - type: error-illustration
    variant: not-found
  - type: error-code
    code: "404"
  - type: error-message
    title: "Pagina No Encontrada"
    description: "La pagina que buscas no existe o ha sido movida a otra direccion."
  - type: action-buttons
    items:
      - label: "Ir al Inicio"
        action: navigate_to /
        variant: primary
      - label: "Contactar Soporte"
        action: open_modal contact-support
        variant: secondary
---

# Vista de Error 404: No Encontrada

## Cuando se muestra
- Usuario navega a una ruta que no existe
- Recurso eliminado o movido (task, user, etc.)
- URL mal escrita

## HTTP Status
404 Not Found

## Layout
Similar a 403: minimal, centrado, codigo grande
