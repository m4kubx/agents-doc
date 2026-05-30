# Flujo de Login - TaskManager

```mermaid
sequenceDiagram
    actor User as Usuario
    participant Login as LoginPage
    participant Auth as AuthService
    participant API as API
    participant DB as Base de Datos

    User->>Login: Ingresa email + password
    Login->>Login: Validacion cliente (formato email, min 8 chars)
    alt Validacion falla
        Login-->>User: Muestra error inline en campo
    else Validacion exitosa
        User->>Login: Click "Iniciar Sesion"
        Login->>Login: Boton loading + inputs disabled
        Login->>Auth: POST /api/auth/login {email, password}
        Auth->>API: Procesa request
        API->>DB: Buscar usuario por email
        alt Usuario no encontrado
            DB-->>API: null
            API-->>Auth: 401 "Credenciales invalidas"
            Auth-->>Login: Error
            Login-->>User: Toast error + habilitar inputs
        else Usuario encontrado
            DB-->>API: user
            API->>API: Verificar password (bcrypt)
            alt Password incorrecto
                API-->>Auth: 401 "Credenciales invalidas"
                Auth-->>Login: Error
                Login-->>User: Toast error
            else Password correcto
                API->>API: Generar JWT (access + refresh)
                API-->>Auth: 200 {user, accessToken, refreshToken}
                Auth-->>Login: Success
                Login->>Login: Guardar tokens (httpOnly cookies o localStorage)
                Login->>Login: Redirect a /dashboard (o ?redirect=...)
                Login-->>User: Dashboard view
            end
        end
    end
```

## Flujo Alternativo: Olvide mi Password

```mermaid
sequenceDiagram
    actor User as Usuario
    participant Login as LoginPage
    participant API as API

    User->>Login: Click "Olvide mi contrasena"
    Login->>User: Muestra input de email
    User->>Login: Ingresa email
    Login->>API: POST /api/auth/forgot-password {email}
    API-->>Login: 200 {message: "Si el email existe, recibiras un link"}
    Login-->>User: Toast success + mensaje generico
    Note over User,Login: Siempre mostrar mismo mensaje (seguridad)
```

## Reglas de UI

1. **Formulario centrado** en layout minimal (sin sidebar)
2. **Logo** arriba del formulario
3. **Link "Olvide mi password"** abajo del campo password
4. **Link "Registrarse"** abajo del boton submit
5. **Redirect automatico** si el usuario ya esta autenticado
6. **Proteccion contra fuerza bruta**: bloqueo de cuenta tras 5 intentos fallidos
7. **CAPTCHA** despues de 3 intentos fallidos
8. **Mensaje de error generico**: nunca revelar si el email existe o no
