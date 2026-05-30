# Handoff: Agente A -> Agente B
# Simulacion: Proyecto TaskManager

## Proyecto: TaskManager
## Ruta: agents-doc/agents-doc/05-proyectos/taskmanager/

## Documentos Generados

| Fase | Archivo | Descripcion |
|------|---------|-------------|
| 1 | `01-Business-Model-y-Requerimientos.md` | BMC, user personas (admin, manager, user), user stories, MVP scope |
| 2 | `02-ADR-TechStack.md` | Decision: React + Node.js + PostgreSQL + JWT |
| 3 | `03-Esquema-Base-de-Datos.md` | Entidades: User, Task, Comment. ERD en Mermaid |
| 4 | `04-UI-Vistas-y-Flujos-de-Usuario.md` | 15 vistas, flujo login, flujo CRUD, componentes UI |
| 5 | `05-API-Design.md` | REST API, 20 endpoints, JWT auth por rol |
| 6 | `06-Seguridad-y-NFR.md` | JWT + bcrypt, 3 roles, rate limiting, HTTPS |
| 7 | `07-Roadmap-y-Riesgos.md` | 3 fases, 5 riesgos identificados |
| - | `00-Project-Brief-Consolidado.md` | Resumen ejecutivo completo |

## Roles del Sistema

| Rol | Descripcion |
|-----|-------------|
| admin | Acceso total al sistema (CRUD todas las entidades) |
| manager | Gestiona tareas de su equipo (crear, editar, ver) |
| user | Usuario basico (ver y gestionar tareas propias) |

## Stack Tecnologico

| Capa | Tecnologia |
|------|-----------|
| Frontend | React + TypeScript + Tailwind CSS |
| Backend | Node.js + Express + TypeScript |
| Base de Datos | PostgreSQL + Prisma ORM |
| Autenticacion | JWT + bcrypt |

## Instrucciones para el Agente B

1. Lee todos los archivos en la carpeta del proyecto
2. Genera especificaciones tecnicas de UI/UX en:
   `agents-doc/agents-design/01-proyectos/taskmanager/`
3. Genera `_handoff-to-c.md` con prompt auto-contenido para Agente C
4. NO generes codigo — solo documentacion tecnica
