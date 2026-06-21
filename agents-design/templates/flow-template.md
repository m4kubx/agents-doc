---
id: [flow-id]
title: "[Nombre del Flujo]"
type: [user-journey | auth-flow | crud-flow | admin-flow | navigation-flow]
related_stories: ["US-001", "US-002"]
related_views: ["view-login", "view-dashboard"]
roles: [admin, manager, user]
---

# Flujo: [Nombre del Flujo]

## Descripción
[Descripción general del flujo: qué proceso describe, quién lo ejecuta, cuándo se activa]

## User Stories Relacionadas
| ID | Historia |
|----|----------|
| US-001 | Como [rol] quiero [acción] para [beneficio] |
| US-002 | Como [rol] quiero [acción] para [beneficio] |

---

## Diagrama de Flujo

```mermaid
flowchart TD
  A([Inicio]) --> B{Permiso?}
  B -->|No| C[Redirigir a 403]
  B -->|Sí| D[Acción principal]

  D --> E{Estado del dato}
  E -->|Vacío| F[Mostrar empty state]
  E -->|Error| G[Mostrar error state]
  E -->|Cargando| H[Skeleton loader]
  E -->|Datos| I[Renderizar contenido]

  I --> J{Acción del usuario}
  J -->|Crear| K[Abrir modal / Navegar a formulario]
  J -->|Editar| L[Abrir modal precargado]
  J -->|Eliminar| M[Modal confirmación]
  J -->|Ver detalle| N[Navegar a detalle]

  M -->|Confirmar| O[API DELETE -> toast éxito -> refresh]
  M -->|Cancelar| P[Cerrar modal]

  K --> Q[Validar formulario]
  Q -->|Error| R[Mostrar errores inline]
  Q -->|Éxito| S[API POST -> toast -> redirect]

  L --> T[Precargar datos -> Editar -> Validar]
  T -->|Error| R
  T -->|Éxito| U[API PUT -> toast -> redirect]

  N --> V[Cargar detalle]
  V -->|Cargando| H
  V -->|No encontrado| W[Mostrar 404]
  V -->|Datos| X[Renderizar detalle]

  F --> J
  G --> J{Reintentar?}
  J -->|Reintentar| D
```

---

## Vista General

### Actores
| Actor | Descripción |
|-------|-------------|
| [Rol] | [Qué puede hacer en este flujo] |
| [Rol] | [Qué puede hacer en este flujo] |

### Precondiciones
- [Condición 1]
- [Condición 2]

### Postcondiciones
- [Resultado esperado 1]
- [Resultado esperado 2]

---

## Pasos del Flujo Detallados

### Paso 1: [Nombre del paso]
| Campo | Valor |
|-------|-------|
| **Vista** | `[enlace a la vista]` |
| **Acción** | [qué hace el usuario] |
| **Permiso requerido** | [rol(es)] |
| **Validaciones** | [validaciones del sistema] |
| **Respuesta esperada** | [qué debe ocurrir] |
| **Error posible** | [qué puede fallar y cómo se maneja] |

### Paso 2: [Nombre del paso]
...

---

## Mapa de Navegación

```mermaid
flowchart LR
  A[Vista A] -->|Acción X| B[Vista B]
  B -->|Acción Y| C[Vista C]
  B -->|Cancelar| A
  C -->|Éxito| D[Vista D]
  C -->|Error| B
```

---

## Estados de Interfaz por Paso

| Paso | Vista | Estado | Descripción Visual | Comportamiento |
|------|-------|--------|-------------------|----------------|
| 1 | login | loading | Spinner en botón + inputs deshabilitados | Bloquear UI hasta respuesta |
| 1 | login | error | Alert rojo arriba del form | Mantener datos ingresados |
| 2 | dashboard | empty | "No hay tareas aún. Crea tu primera tarea." + botón CTA | Botón lleva a /tasks/create |
| 2 | dashboard | loading | Skeleton de 4 widgets | Animación de shimmer |

---

## Reglas de Negocio

| ID | Regla | Aplica a | Consecuencia si no se cumple |
|----|-------|----------|------------------------------|
| R1 | Un manager solo ve tareas de su equipo | manager | 403 o filtro automático |
| R2 | Un usuario no puede eliminar tareas | user | Botón eliminar oculto / 403 |
| R3 | [Regla adicional] | [rol] | [consecuencia] |

---

## Validación del Flujo

- [ ] Todos los pasos tienen estados (loading, empty, error, success) definidos
- [ ] Cada bifurcación del mermaid tiene una vista o acción correspondiente
- [ ] Los permisos RBAC están correctamente aplicados en cada paso
- [ ] Las reglas de negocio están implementadas en la lógica del flujo
- [ ] Los errores tienen mensajes claros para el usuario y log para debugging
