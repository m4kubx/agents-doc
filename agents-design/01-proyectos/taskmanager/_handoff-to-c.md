# PROMPT DE ACTIVACION - Agente C (Implementation)
# Generado por: Agente B (Design Documentation)
# Proyecto: TaskManager
# Version: 1.0.0

---

## INSTRUCCION PRINCIPAL

Actua como un Desarrollador Senior Full-Stack. Crea un proyecto de software completo
y funcional llamado TaskManager basandote en la especificacion tecnica detallada a continuacion.

No hagas preguntas. Implementa TODO lo especificado.

---

## 1. ESPECIFICACION TECNICA DEL PROYECTO

### 1.1 Stack Tecnologico
| Capa | Tecnologia | Version |
|------|-----------|---------|
| Frontend | React + TypeScript | 18+ |
| Backend | Node.js + Express + TypeScript | 20 LTS |
| Base de Datos | PostgreSQL | 15+ |
| ORM | Prisma | 5+ |
| Auth | JWT + bcrypt | - |
| UI Library | Tailwind CSS + shadcn/ui | - |
| Testing | Vitest + Playwright | - |
| CI/CD | GitHub Actions | - |
| Deployment | Docker + docker-compose | - |

### 1.2 Estructura de Directorios
```
taskmanager/
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
│   ├── prisma/
│   │   └── schema.prisma
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

## 2. MODELO DE USUARIOS Y ROLES (RBAC)

### 2.1 Roles del Sistema
| Rol | Descripcion | Permisos |
|-----|-------------|----------|
| admin | Acceso total al sistema | CRUD tareas, CRUD usuarios, reportes, config |
| manager | Gestion del equipo | CRUD tareas de su equipo, asignar, ver usuarios |
| user | Usuario regular | CRUD solo sus tareas |

### 2.2 Matriz de Permisos
| Vista | admin | manager | user | publico |
|-------|-------|---------|------|---------|
| /login | - | - | - | SI |
| /register | - | - | - | SI |
| /dashboard | SI | SI | SI | NO |
| /tasks | todas | equipo | propias | NO |
| /tasks/create | SI | SI | NO | NO |
| /tasks/:id/edit | SI | SI(equipo) | NO | NO |
| /tasks/:id/delete | SI | NO | NO | NO |
| /users | SI | solo ver | NO | NO |
| /users/create | SI | NO | NO | NO |
| /reports | SI | SI | NO | NO |
| /settings | SI | NO | NO | NO |

### 2.3 Route Guards
| Ruta | Guard | Redirigir a |
|------|-------|-------------|
| Cualquier protegida sin auth | isAuthenticated() | /login?redirect= |
| /users/* (manager) | hasRole([admin]) | /403 |
| /users/* (user) | hasRole([admin]) | /403 |
| /tasks/create (user) | hasRole([admin,manager]) | /tasks |
| /tasks/:id/edit (user) | ownsTask OR hasRole([admin]) | /403 |
| /settings (no admin) | hasRole([admin]) | /403 |

---

## 3. VISTAS DEL SISTEMA

### 3.1 Vistas Publicas

#### Login (/login)
- Layout: Minimal (sin sidebar)
- Formulario: email + password + Remember me
- Boton Iniciar Sesion (primary, full-width)
- Link Olvide password y Registro
- Estados: loading(boton disabled+spinner), error(alert rojo), success(redirect dashboard)

#### Register (/register)
- Similar a login + campos: nombre, confirmar password

### 3.2 Vistas Protegidas

#### Dashboard (/dashboard)
- Layout: Sidebar-layout
- Widgets segun rol:
  - admin: Total tareas, Estado tareas, Usuarios activos, Grafico
  - manager: Tareas equipo, Pendientes, Performance
  - user: Mis tareas, Vencidas, Proximos vencimientos

#### Listado de Tareas (/tasks)
- Ver ejemplo completo en especificacion original

#### Crear Tarea (/tasks/create)
- Formulario: Titulo, Descripcion, Estado, Prioridad, Asignado a
- Solo admin/manager pueden asignar a otros

### 3.3 Sidebar por Rol
admin: Dashboard, Tareas, Usuarios, Reportes, Configuracion
manager: Dashboard, Tareas, Equipo, Reportes
user: Dashboard, Mis Tareas

---

## 4. COMPONENTES UI

| Componente | Variantes | Estados |
|-----------|-----------|--------|
| primary-button | sm/md/lg | default, hover, active, disabled, loading |
| danger-button | sm/md/lg | default, hover, active, disabled, confirm |
| icon-button | ghost/solid | default, hover, active, disabled |
| text-input | - | default, focused, filled, error, disabled |
| select | - | default, focused, filled, error, disabled, empty |
| data-table | - | loading, empty, error, normal |
| confirm-modal | danger/warning/info | closed, opening, open, closing |

---

## 5. VISTAS DE ERROR

### 403 - Acceso Denegado
- Layout: Minimal
- Ilustracion + No tienes permisos
- Acciones: Volver al Dashboard, Solicitar Acceso
- HTTP 403

### 404 - No Encontrado
- Layout: Minimal
- Ilustracion + Pagina no encontrada
- Acciones: Ir al Inicio, Contactar Soporte
- HTTP 404

### 500 - Error Interno
- Layout: Minimal
- Ilustracion + Error inesperado
- Acciones: Reintentar, Contactar Soporte
- HTTP 500

---

## 6. MODELO DE BASE DE DATOS

```prisma
enum Role { ADMIN MANAGER USER }
enum TaskStatus { PENDING IN_PROGRESS DONE }
enum Priority { LOW MEDIUM HIGH }

model User {
  id        String   @id @default(uuid())
  name      String
  email     String   @unique
  password  String
  role      Role     @default(USER)
  avatar    String?
  active    Boolean  @default(true)
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
  tasksCreated  Task[] @relation("TaskCreatedBy")
  tasksAssigned Task[] @relation("TaskAssignedTo")
  comments      Comment[]
}

model Task {
  id          String     @id @default(uuid())
  title       String
  description String?
  status      TaskStatus @default(PENDING)
  priority    Priority   @default(MEDIUM)
  createdById String
  assignedToId String?
  createdAt   DateTime   @default(now())
  updatedAt   DateTime   @updatedAt
  createdBy  User   @relation("TaskCreatedBy", fields: [createdById], references: [id])
  assignedTo User?  @relation("TaskAssignedTo", fields: [assignedToId], references: [id])
  comments   Comment[]
}

model Comment {
  id        String   @id @default(uuid())
  content   String
  taskId    String
  userId    String
  createdAt DateTime @default(now())
  task Task @relation(fields: [taskId], references: [id])
  user User @relation(fields: [userId], references: [id])
}
```

---

## 7. API ENDPOINTS

| Metodo | Ruta | Auth | Rol | Descripcion |
|--------|------|------|-----|-------------|
| POST | /api/auth/register | No | - | Registrar usuario |
| POST | /api/auth/login | No | - | Iniciar sesion -> JWT |
| POST | /api/auth/logout | Si | - | Cerrar sesion |
| GET | /api/auth/me | Si | - | Obtener perfil |
| GET | /api/tasks | Si | auth | Listar (filtrado por rol) |
| POST | /api/tasks | Si | admin,manager | Crear tarea |
| GET | /api/tasks/:id | Si | auth | Detalle tarea |
| PUT | /api/tasks/:id | Si | admin,manager,owner | Actualizar |
| DELETE | /api/tasks/:id | Si | admin | Eliminar |
| GET | /api/users | Si | admin,manager | Listar usuarios |
| POST | /api/users | Si | admin | Crear usuario |
| PUT | /api/users/:id | Si | admin | Actualizar usuario |
| DELETE | /api/users/:id | Si | admin | Eliminar usuario |

---

## 8. REQUISITOS NO FUNCIONALES

- Seguridad: JWT(24h), bcrypt(12 rounds), rate limiting en auth
- UX: Responsive mobile-first, modo claro/oscuro, micro-interacciones, skeleton loading
- Performance: Paginacion server-side, lazy loading rutas, debounce busquedas
- Testing: Unit tests (Vitest) servicios, E2E (Playwright) flujos criticos
- Codigo: ESLint + Prettier, TypeScript strict, Conventional Commits

---

## 9. PLAN DE IMPLEMENTACION

### Fase 1: Scaffolding y Config
- Inicializar frontend/backend, TypeScript, Prisma, Docker

### Fase 2: Autenticacion
- Modelo User, endpoints auth, JWT middleware, frontend login/register

### Fase 3: CRUD Tareas
- Modelo Task, endpoints CRUD, frontend vistas con filtros

### Fase 4: Admin Usuarios
- CRUD usuarios, solo admin, frontend UserList/UserForm

### Fase 5: Dashboard
- Endpoints estadisticas, frontend widgets, graficos

### Fase 6: Pulido
- Vistas error (403,404,500), estados carga/vacio, tests
