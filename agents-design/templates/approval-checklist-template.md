---
project: "[NOMBRE_PROYECTO]"
phase: "design-review"
version: "1.0.0"
status: "pending"  # pending | in-review | changes-requested | approved
reviewer: "[NOMBRE_REVIEWER]"
date: "[FECHA]"
---

# Design Review Checklist

> Revisa cada mockup y flujo generado por el Agente B antes de aprobar el pase al Agente C.

---

## 1. Mockups HTML

| # | Mockup | Estado | Notas |
|---|--------|--------|-------|
| 1 | login.html | `⬜ pending` | |
| 2 | register.html | `⬜ pending` | |
| 3 | dashboard.html | `⬜ pending` | |
| 4 | tasks-list.html | `⬜ pending` | |
| 5 | task-form.html | `⬜ pending` | |
| 6 | users-list.html | `⬜ pending` | |
| 7 | settings.html | `⬜ pending` | |
| 8 | 403.html | `⬜ pending` | |
| 9 | 404.html | `⬜ pending` | |
| 10 | 500.html | `⬜ pending` | |

### Criterios por Mockup
- [ ] El layout corresponde al tipo especificado (sidebar, minimal, blank)
- [ ] Los elementos de la vista están presentes y en el orden correcto
- [ ] Los estados (loading, empty, error, success) están representados
- [ ] Las acciones/botones visibles corresponden al rol seleccionado
- [ ] El sidebar y navegación reflejan correctamente el rol del usuario
- [ ] El diseño es responsive (o se indica cómo se comporta en mobile/tablet)

---

## 2. Flujos de Usuario

| # | Flujo | Estado | Notas |
|---|-------|--------|-------|
| 1 | user-journey-map.md | `⬜ pending` | |
| 2 | auth-flow.md | `⬜ pending` | |
| 3 | task-crud-flow.md | `⬜ pending` | |
| 4 | admin-flow.md | `⬜ pending` | |
| 5 | navigation-flow.md | `⬜ pending` | |

### Criterios por Flujo
- [ ] Cubre todos los caminos (happy path + edge cases + errores)
- [ ] Los roles y permisos están correctamente aplicados en cada paso
- [ ] Los estados de UI (loading, empty, error, success) están mapeados
- [ ] El diagrama Mermaid es claro y completo
- [ ] Las user stories de Agente A están trazadas al flujo
- [ ] Las reglas de negocio están documentadas

---

## 3. Consistencia General

- [ ] Todas las vistas mencionadas en routing-tree.md existen en 01-views/
- [ ] Todos los roles en permissions-matrix.yml están definidos en roles.yml
- [ ] Las vistas de error (403, 404, 500) están presentes y mockeadas
- [ ] La información en _handoff-to-c.md es consistente con mockups y flujos
- [ ] Las rutas en los mockups coinciden con las rutas definidas en navigation/

---

## 4. Decisión Final

| Criterio | Resultado |
|----------|-----------|
| ¿Todos los mockups están correctos? | `⬜ Sí / ⬜ No / ⬜ N/A` |
| ¿Todos los flujos están completos? | `⬜ Sí / ⬜ No / ⬜ N/A` |
| ¿Hay cambios solicitados? | `⬜ Sí / ⬜ No` |
| ¿Se aprueba el pase a Agente C? | `⬜ Sí / ⬜ No` |

### Cambios Solicitados
1. [Cambio solicitado 1]
2. [Cambio solicitado 2]

### Notas Adicionales
[Notas del revisor]

---

> **Instrucción**: Una vez aprobado, el Agente B puede generar _handoff-to-c.md y pasar a la Fase 3.
