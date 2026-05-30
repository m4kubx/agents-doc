---
id: error-500
title: "Error Interno del Servidor"
route: /500
auth:
  required: false
layout: minimal
components:
  - type: error-illustration
    variant: server-error
  - type: error-code
    code: "500"
  - type: error-message
    title: "Error Inesperado"
    description: "Ocurrio un error inesperado. Nuestro equipo de soporte ha sido notificado automaticamente."
  - type: action-buttons
    items:
      - label: "Reintentar"
        action: refresh
        variant: primary
      - label: "Contactar Soporte"
        action: open_modal contact-support
        variant: secondary
---

# Vista de Error 500: Error Interno del Servidor

## Cuando se muestra
- Error no controlado en el servidor
- Excepcion no capturada
- Base de datos no disponible
- Timeout de servicio externo

## Comportamiento
1. Mostrar pagina de error inmediatamente (no mostrar detalles tecnicos)
2. Loggear el error en el servidor con stack trace
3. Opcional: boton Reintentar con reintento exponencial

## HTTP Status
500 Internal Server Error

## Notas Tecnicas
- NO mostrar detalles del error al usuario (stack trace, SQL, etc.)
- SI loggear el error en el servidor con ID de seguimiento
- El usuario puede ver el ID de error para reportarlo a soporte
