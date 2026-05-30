---
id: login
title: "Inicio de Sesion"
route: /login
layout: minimal
auth:
  required: false
  note: "Si el usuario ya esta autenticado, redirigir a /dashboard"
actions:
  - label: "Iniciar Sesion"
    type: button
    variant: primary
    action: api_call POST /api/auth/login
    roles: []
states:
  loading: "Boton deshabilitado con spinner + inputs deshabilitados"
  empty: "Formulario limpio con placeholder"
  error: "Alert rojo 'Credenciales invalidas' o 'Cuenta bloqueada' o 'Error de conexion'"
  success: "Redirect a /dashboard o a query param ?redirect="
---

# Vista: Inicio de Sesion

## Descripcion
Formulario de autenticacion para acceder al sistema.

## Layout
```
+---------------------------------------------------+
|                                                   |
|                   [Logo]                          |
|                                                   |
|            Inicia Sesion en TaskManager            |
|                                                   |
|  +---------------------------------------------+  |
|  |  Correo electronico                         |  |
|  |  [________________________]                 |  |
|  +---------------------------------------------+  |
|                                                   |
|  +---------------------------------------------+  |
|  |  Contrasena                                 |  |
|  |  [________________________]  [👁]            |  |
|  +---------------------------------------------+  |
|                                                   |
|  [x] Recordarme          Olvide mi contrasena?   |
|                                                   |
|  +---------------------------------------------+  |
|  |           INICIAR SESION                     |  |
|  +---------------------------------------------+  |
|                                                   |
|  No tienes cuenta? Registrate                    |
|                                                   |
+---------------------------------------------------+
```

## Componentes
- TextInput: email (validacion email format)
- TextInput: password (type password + toggle visibility)
- Checkbox: Recordarme
- Link: Olvide contrasena -> /forgot-password
- Link: Registro -> /register
- Button: Iniciar Sesion (primary, full-width, loading state)

## Validaciones
| Campo | Regla | Error |
|-------|-------|-------|
| email | email valido | "Ingresa un correo valido" |
| password | minimo 8 chars | "La contrasena debe tener al menos 8 caracteres" |

## Comportamiento
1. Usuario ingresa credenciales
2. Click en Iniciar Sesion
3. Loading state: boton con spinner
4. Exito: redirect a dashboard (o a ?redirect=...)
5. Error: alert con mensaje especifico
6. Si ya esta autenticado -> redirect a /dashboard
