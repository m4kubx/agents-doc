# 🚀 PROMPT DE ACTIVACIÓN — Agente C (Implementation)
# Generado por: Agente B (Design Documentation)
# Proyecto: [NOMBRE_PROYECTO]
# Versión: 1.0.0

---

## 📋 INSTRUCCIÓN PRINCIPAL

Actúa como un **Desarrollador Senior Full-Stack**. Debes crear un proyecto de software completo
y funcional llamado **[NOMBRE_PROYECTO]** basándote en la especificación técnica detallada a continuación.

No hagas preguntas. Implementa TODO lo especificado. Crea el proyecto en: `<ruta-destino>/`

---

## 🏗️ 1. ESPECIFICACIÓN TÉCNICA DEL PROYECTO

### 1.1 Stack Tecnológico
| Capa | Tecnología | Versión |
|------|-----------|---------|
| Frontend | [tecnología] | [versión] |
| Backend | [tecnología] | [versión] |
| Base de Datos | [tecnología] | [versión] |
| ORM | [tecnología] | [versión] |
| Auth | [tecnología] | [versión] |
| UI Library | [tecnología] | - |
| Testing | [tecnología] | - |
| CI/CD | [tecnología] | - |

### 1.2 Estructura de Directorios
```
[proyecto]/
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   ├── views/
│   │   ├── hooks/
│   │   ├── services/
│   │   ├── contexts/
│   │   ├── types/
│   │   └── utils/
│   ├── public/
│   ├── tests/
│   ├── package.json
│   └── tsconfig.json
├── backend/
│   ├── src/
│   │   ├── routes/
│   │   ├── controllers/
│   │   ├── services/
│   │   ├── middleware/
│   │   ├── models/
│   │   └── utils/
│   ├── prisma/ (o equivalente)
│   ├── tests/
│   ├── package.json
│   └── tsconfig.json
├── docker-compose.yml
├── Dockerfile
├── .env.example
├── .github/workflows/ci.yml
└── README.md
```

---

## 👥 2. MODELO DE USUARIOS Y ROLES (RBAC)

### 2.1 Roles del Sistema
| Rol | Descripción | Permisos |
|-----|-------------|----------|
| admin | [descripción] | [permisos] |
| manager | [descripción] | [permisos] |
| user | [descripción] | [permisos] |

### 2.2 Matriz de Permisos (Rol × Vista × Acción)
| Vista | admin | manager | user | público |
|-------|-------|---------|------|---------|
| [vista] | ✅ | ✅ | ✅ | ❌ |

### 2.3 Route Guards
| Ruta | Guard | Redirigir a |
|------|-------|-------------|
| [ruta] | `[guard]` | `[fallback]` |

---

## 🖥️ 3. VISTAS DEL SISTEMA

### 3.1 Vistas Públicas
[Descripción de cada vista pública con sus componentes]

### 3.2 Vistas Protegidas
[Descripción de cada vista protegida con sus componentes]

### 3.3 Sidebar por Rol
```yaml
admin:
  - label: [label], route: /[ruta], icon: [icon]
```

---

## 🎨 4. COMPONENTES UI REUTILIZABLES

### 4.1 Botones
| Variante | Uso | Estados |
|----------|-----|---------|
| primary | Acción principal | default, hover, active, disabled, loading |

### 4.2 Formularios
[Especificación de formularios]

### 4.3 Tablas
[Especificación de tablas]

### 4.4 Modales
[Especificación de modales]

---

## ⚠️ 5. VISTAS DE ERROR

### 5.1 403 — Acceso Denegado
- Layout: Minimal
- Acciones: Volver al inicio, Solicitar acceso

### 5.2 404 — No Encontrado
- Layout: Minimal
- Acciones: Ir al inicio, Contactar soporte

### 5.3 500 — Error Interno
- Layout: Minimal
- Acciones: Reintentar, Contactar soporte

---

## 🗄️ 6. MODELO DE BASE DE DATOS

```prisma
// Schema Prisma completo
```

---

## 🔌 7. API ENDPOINTS
| Método | Ruta | Auth | Rol | Descripción |
|--------|------|------|-----|-------------|
| GET | [ruta] | Sí/No | [rol] | [desc] |

---

## ✅ 8. REQUISITOS NO FUNCIONALES
- [NFR 1]
- [NFR 2]

---

## 📐 9. PLAN DE IMPLEMENTACIÓN (FASES)

### Fase 1: [Nombre]
- [ ] Tarea 1
- [ ] Tarea 2

### Fase 2: [Nombre]
- [ ] Tarea 1
- [ ] Tarea 2

---

## 🚫 10. RESTRICCIONES
1. [Restricción 1]
2. [Restricción 2]

---

## 🔄 11. OUTPUT ESPERADO
Al finalizar, el proyecto debe contener:
- Código fuente completo y funcional
- Tests que pasan (`npm test` o equivalente)
- README con instrucciones de instalación y uso
- docker-compose.yml funcional
- CI pipeline configurado
- .env.example con todas las variables necesarias

---

*Prompt generado por Agente B (Design Documentation)*
*Basado en la documentación del Agente A (agents-doc)*
