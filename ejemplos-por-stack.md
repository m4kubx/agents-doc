# Ejemplos Completos por Stack

> Ejemplos concretos y realistas de cómo aplicar toda la metodología (Principio de No Generación + SDD/TDD + roles + gestión de contexto) en stacks populares.

---

## Stack 1: Node.js + TypeScript + Express + PostgreSQL + React

### Escenario
Quieres implementar el módulo de **registro de usuarios** con email + password + verificación.

### Paso 0: Inicio del chat (siempre)

Copia el prompt de activación del Principio de No Generación + gestión de contexto.

### Paso 1: Razonamiento estructurado + Suposiciones (nueva técnica avanzada)

Antes de SDD, usa las nuevas plantillas para decisiones importantes:

```
Actúa como developer senior experto en Node.js + TypeScript + Express + PostgreSQL.

Sigue el Principio de No Generación Sin Orden.

Primero aplica RAZONAMIENTO ESTRUCTURADO FORZADO (plantilla-razonamiento-estructurado.md) + SURFACING DE SUPOSICIONES (plantilla-suposiciones-explicitas.md) sobre el módulo de registro de usuarios.

Tarea: Analiza las implicaciones de usar verificación por email vs magic links vs OAuth para este endpoint.

Lista todas las suposiciones y presenta tradeoffs claros antes de proponer una dirección.
```

Una vez aprobadas las decisiones y suposiciones, pasas a SDD.

### Paso 2: Usar SDD para definir el comportamiento

Prompt al agente (rol: Arquitecto o Developer Senior):

```
Actúa como developer senior experto en Node.js + TypeScript + Express + PostgreSQL.

Sigue el Principio de No Generación Sin Orden.

Vamos a aplicar SDD + TDD para el módulo de registro de usuarios.

Contexto:
- Usamos Prisma como ORM
- PostgreSQL
- JWT para autenticación posterior
- Ya existe el modelo User en Prisma (id, email, passwordHash, emailVerified, createdAt)

Primero genera una especificación SDD completa del endpoint POST /auth/register siguiendo la plantilla-sdd.md.

Incluye surfacing de suposiciones explícitas como paso previo.

No generes código ni tests todavía.
```

Después de que apruebes la especificación, pasas a TDD.

### Paso 2: TDD Red (solo tests)

Prompt:
```
Aprobada la especificación SDD.

Ahora pasa a fase Red de TDD (ver guia-tdd-con-agentes.md).

Escribe los tests (usando Vitest + supertest) para el endpoint POST /auth/register.

Solo tests. Deben fallar cuando se ejecuten.
Detente cuando termines la fase Red.
```

### Paso 3: Green (implementación mínima)

```
Aprobados los tests de Red (fallan como deben).

Pasa a Green.

Implementa solo lo estrictamente necesario en src/modules/auth/register.ts y el controller.

Usa Prisma, bcrypt, y devuelve 201 con { message: "User registered. Please verify email" }.

Ejecuta los tests al final y muestra resultados.
```

### Paso 4: Revisión + Checklist

Usas la plantilla-revision.md + la Checklist de Validación del README.

---

## Stack 2: Python + FastAPI + MongoDB + Pydantic

### Escenario
Implementar un servicio de **cálculo de precio dinámico** para un marketplace (lógica de negocio con muchas reglas).

### Enfoque recomendado: SDD primero + técnicas avanzadas de eficiencia

**Paso previo recomendado (nuevo):**

Usa Gestión de Contexto v2 + Razonamiento Estructurado + Auto-Crítica:

```
Actúa como QA Engineer + Developer Senior experto en Python + FastAPI + MongoDB.

Principio de No Generación activado.

Primero actualiza el Memory Bank usando plantilla-gestion-contexto-v2.md con el estado actual del servicio de pricing.

Luego aplica RAZONAMIENTO ESTRUCTURADO FORZADO sobre las reglas de pricing dinámico.

Finalmente, genera la especificación SDD completa usando plantilla-sdd.md + plantilla-suposiciones-explicitas.md.

Incluye al menos 12 casos edge diferentes.
```

**Durante la generación de la spec y código:**

Agrega siempre Auto-Crítica y formato estructurado:

```
Aplica AUTO-CRÍTICA INTEGRADA (plantilla-autocritica-integrada.md) antes de entregarme la especificación.

Al final, entrega la salida usando el schema de la plantilla-formato-salida-estructurado.md (usa el formato de especificación SDD).
```

Una vez aprobada la spec, puedes:
- Generar tests con pytest (TDD)
- O incluso generar la implementación directamente desde la spec muy detallada (SDD puro)

Esto es especialmente útil cuando la lógica es complicada y el agente tiende a inventar reglas o hacer suposiciones ocultas.

---

## Stack 3: Go + Gin + MySQL + Vue 3 (frontend)

### Escenario
Construir un pequeño módulo de **gestión de inventario** (backend en Go + frontend simple en Vue).

### Enfoque recomendado

1. **Backend**:
   - Usa SDD + TDD con el rol Developer Senior en Go.
   - Tests con `testing` package + testify.
   - Estructura típica: handlers, services, repositories.

2. **Frontend**:
   - Rol separado: puedes usar un agente con rol "Frontend Developer Vue".
   - Activa el Principio de No Generación.
   - Pide primero componentes + types basados en la API spec ya aprobada.

Ejemplo de prompt para el frontend:

```
Actúa como frontend developer senior experto en Vue 3 + TypeScript + Pinia.

Principio de No Generación activado.

El backend ya tiene la API de inventario definida y aprobada (ver especificación SDD adjunta).

Tarea: Crear la vista de "Inventario" con:
- Tabla de productos
- Filtros (por categoría y stock bajo)
- Modal de ajuste de stock

Primero propón la estructura de componentes y stores.
No generes código hasta que apruebe la propuesta.
```

---

## Patrones que se repiten en todos los stacks (buenas prácticas)

- Siempre empezar con **Principio de No Generación**.
- Para lógica de negocio compleja → **SDD primero**.
- Para la mayoría de los módulos de aplicación → **SDD + TDD**.
- Usar **roles explícitos** (ver matriz-roles-agentes.md).
- Cada vez que cambias de chat → usar **plantilla-gestion-contexto.md**.
- Commits y ramas controlados por el humano (ver workflow-git-con-agentes.md).
- El Orchestrator (si existe) es quien asigna las tareas a los diferentes roles/stacks.

---

## Cómo usar estos ejemplos en la práctica

1. Copia el ejemplo más cercano a tu stack.
2. Adáptalo con tu contexto real (modelos, librerías específicas, arquitectura ya aprobada).
3. Combínalo con las plantillas y guías correspondientes.
4. Guarda tus prompts personalizados para reutilizarlos en futuros proyectos.

Estos ejemplos demuestran que la metodología es stack-agnóstica: el poder está en el proceso y en las restricciones que le pones al agente, no en el lenguaje.

---

## Uso de las técnicas avanzadas de eficiencia (2026)

Las nuevas plantillas de alta prioridad se integran de la siguiente forma en cualquier stack:

- **Razonamiento Estructurado + Suposiciones**: Úsalas siempre antes de SDD o arquitectura en lógica compleja (ejemplos arriba en Stack 1 y 2).
- **Auto-Crítica Integrada**: Agrégala al final de casi cualquier prompt importante: "Aplica auto-crítica integrada antes de mostrarme el resultado".
- **Gestión de Contexto v2**: Úsala en lugar de la v1 cuando el proyecto tenga más de 3-4 módulos o dure más de 2 semanas.
- **Formato de Salida Estructurado**: Especialmente útil cuando el Orchestrator pasa resultados entre agentes (handoffs más limpios).
- **Verification Agent**: Después de que un Developer o Arquitecto entrega, el Orchestrator asigna un chat separado con rol Verification Agent para auditar fidelidad exacta a la orden original.

Ejemplo combinado potente (copia y adapta):

```
Actúa como [rol].

Principio de No Generación activado.

1. Aplica RAZONAMIENTO ESTRUCTURADO FORZADO + SURFACING DE SUPOSICIONES.
2. Genera [SDD / propuesta / código] usando el formato estructurado de salida.
3. Antes de mostrarme el resultado final, aplica AUTO-CRÍTICA INTEGRADA completa.

Contexto actual: [pegar estado de plantilla-gestion-contexto-v2.md]
```

---

## Siguiente nivel

Una vez que domines estos patrones en un stack, puedes:
- Pasar a setups con Orchestrator + múltiples agentes especializados + Verification Agent.
- Crear tus propias "plantillas de proyecto" con prompts pre-armados para tu stack favorito.
- Medir la productividad real (tareas completadas por hora de interacción con agente) y ajustar.

La combinación de **Principio de No Generación + SDD/TDD + roles claros + técnicas avanzadas de eficiencia + buen Git** es actualmente una de las formas más efectivas y profesionales de construir software asistido por IA.
