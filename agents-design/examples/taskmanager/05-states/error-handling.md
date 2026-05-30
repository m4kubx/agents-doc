# Manejo de Errores - TaskManager

## Estrategia General

| Tipo de Error | Que se Muestra | Accion del Usuario |
|--------------|----------------|-------------------|
| Red (fetch) | Alert en pagina + toast | Reintentar manual |
| Autenticacion | Redirect a /login | Iniciar sesion |
| Permisos | Redirect a /403 | Solicitar acceso |
| No encontrado | Vista /404 | Navegar a inicio |
| Servidor (500) | Vista /500 | Reintentar + reportar |
| Validacion | Errores inline en formulario | Corregir campos |
| Timeout | Toast "Tiempo de espera agotado" | Reintentar |

## Toast Notifications

| Tipo | Icono | Duracion | Accion |
|------|-------|----------|--------|
| Success | check-circle | 3s | - |
| Error | x-circle | 5s | "Reintentar" |
| Warning | alert-triangle | 4s | "Ver detalles" |
| Info | info | 3s | - |

Posicion: Esquina superior derecha
Max visibles: 3 (cola de espera)
Animacion: slide-in-right, fade-out

## Form Validation

### Reglas Generales
- Validar en blur (pérdida de foco)
- Validar en submit (todos los campos)
- Mostrar errores debajo del campo correspondiente
- El boton submit se deshabilita si hay errores

### Mensajes de Error
| Campo | Error | Mensaje |
|-------|-------|---------|
| Titulo | required | "El titulo es obligatorio" |
| Titulo | maxLength | "El titulo no puede exceder 200 caracteres" |
| Email | format | "Ingresa un email valido" |
| Password | minLength | "La contrasena debe tener al menos 8 caracteres" |
| Descripcion | maxLength | "La descripcion no puede exceder 2000 caracteres" |

### Comportamiento
1. Al hacer blur en un campo -> validar solo ese campo
2. Al hacer submit -> validar todos los campos
3. Si hay errores -> scroll al primer error + focus
4. Campos con error tienen borde rojo + icono de error
5. El boton submit se deshabilita hasta que todos los campos requeridos esten completos

## Manejo de Red/API

### Fetch Errors
```
// Estrategia de reintento
- Primer error: mostrar toast con "Reintentar"
- Segundo error consecutivo: mostrar alert en pagina
- Tercer error consecutivo: mostrar vista de error completa
- Timeout: 10 segundos por defecto
```

### Estados por Llamada API
| Estado | UI Response |
|--------|-------------|
| idle | Muestra datos o empty state |
| loading | Skeleton loader |
| success | Renderiza datos |
| error | Error message + retry |
| empty | Empty state (sin datos) |

### Optimistic Updates
- Crear: mostrar inmediatamente, rollback si falla
- Editar: mostrar inmediatamente, rollback si falla + toast error
- Eliminar: mostrar confirmacion, luego eliminar, rollback si falla
