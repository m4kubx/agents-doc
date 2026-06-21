---
section: tdd-strategy
title: "Estrategia TDD para Agente C"
version: "1.0.0"
---

# 🧪 Estrategia TDD — [NOMBRE_PROYECTO]

> **Regla de oro**: Para cada feature, escribe los tests **ANTES** del código.
> Ciclo: Red (test falla) → Green (implementar) → Refactor (mejorar).

---

## 📊 Pirámide de Testing

```
        ⬆  E2E (Playwright)        — Flujos críticos: 5-10 tests
      ⬆⬆⬆  Component (Testing Library) — Vistas + estados: 20-40 tests
    ⬆⬆⬆⬆⬆  Integration (Supertest)    — API + DB + RBAC: 30-50 tests
  ⬆⬆⬆⬆⬆⬆⬆⬆  Unit (Vitest)              — Servicios + middleware: 40-60 tests
```

---

## 🔐 1. Tests de Autenticación y RBAC (prioridad crítica)

### Backend — cada endpoint × cada rol

```
describe("RBAC — [recurso]") {
  // Cada combinación posible
  it("admin puede [acción] → 200")
  it("manager puede [acción] → 200/403 según regla")
  it("user puede [acción] → 200/403 según regla")
  it("sin token → 401")
  it("token inválido → 401")
  it("token expirado → 401")
  it("rol desconocido → 403")
}
```

### Frontend — cada botón según rol

```
describe("[Componente] — visibilidad por rol") {
  it("renderiza [acción] si el rol es admin")
  it("NO renderiza [acción] si el rol es user")
  it("deshabilita [acción] si el rol es manager sin permiso")
  it("redirige a /403 si accede por URL directa sin permiso")
  it("oculta el botón de eliminar para roles no autorizados")
}
```

---

## 🎨 2. Tests de Componentes UI

### Por cada vista, testear:

```
describe("[Vista] — render") {
  // Estados
  it("renderiza loading skeleton mientras carga")
  it("renderiza empty state cuando no hay datos")
  it("renderiza error state cuando falla la API")
  it("renderiza datos correctamente cuando hay datos")

  // Elementos
  it("renderiza el título de la vista")
  it("renderiza todos los botones de acción según rol")
  it("renderiza la tabla con columnas correctas")
  it("renderiza los filtros disponibles")

  // Acciones
  it("navega a [ruta] al hacer click en [botón]")
  it("abre modal de confirmación al hacer click en eliminar")
  it("ejecuta acción de logout al hacer click en cerrar sesión")
  it("redirige a /login si no está autenticado")
}
```

### Por cada botón/acción:

```
describe("[Botón] — comportamiento") {
  it("tiene texto [label]")
  it("tiene variant [primary/secondary/danger]")
  it("está habilitado para rol [rol]")
  it("está deshabilitado para rol [rol]")
  it("muestra loading al hacer click")
  it("dispara la acción [acción] al hacer click")
  it("tiene atributo aria-label para accesibilidad")
}
```

---

## 🔗 3. Tests de Navegación

```
describe("Navegación — [rol]") {
  // Sidebar
  it("renderiza [N] links en el sidebar")
  it("el link [label] apunta a [ruta]")
  it("el link activo tiene clase active")
  it("los links cambian según el rol: [items esperados]")
  it("click en [link] navega a [ruta]")

  // Redirects
  it("acceso sin auth a /[ruta-protegida] → redirect /login")
  it("acceso de user a /[ruta-admin] → redirect /403")
  it("ruta inexistente → renderiza 404")
  it("error de servidor → renderiza 500")

  // Breadcrumbs
  it("renderiza breadcrumbs en [vista]")
  it("click en breadcrumb navega correctamente")
}
```

---

## 📋 4. Tests de Formularios

```
describe("[Formulario] — validación") {
  // Validación cliente
  it("muestra error inline si [campo] está vacío")
  it("muestra error inline si [campo] tiene formato inválido")
  it("deshabilita botón submit si hay errores")
  it("habilita botón submit si todo es válido")

  // Envío
  it("llama API [endpoint] con datos correctos al submit")
  it("muestra loading en botón mientras envía")
  it("muestra toast de éxito al crear/editar")
  it("redirige a [ruta] tras éxito")
  it("muestra errores del servidor si la API falla")
  it("NO redirige si hay errores del servidor")
}
```

---

## 🚦 5. Tests de Estados (Loading / Empty / Error / Success)

```
describe("[Vista] — estados") {
  // Loading
  it("muestra skeleton de [N] filas mientras carga")
  it("oculta skeleton cuando los datos llegan")
  it("no permite interacciones durante loading")

  // Empty
  it("muestra mensaje '[texto]' cuando no hay datos")
  it("muestra botón de acción primaria en empty state")
  it("oculta empty state cuando hay datos")

  // Error
  it("muestra mensaje de error si la API falla")
  it("botón de reintentar funciona")
  it("mantiene datos previos si hay error en refresh")
  it("oculta error state al reintentar con éxito")
}
```

---

## 📁 6. Estructura de Archivos de Tests

```
[proyecto]/
├── backend/
│   ├── tests/
│   │   ├── setup.ts                    # Config global (BD test, seed)
│   │   ├── helpers.ts                  # Factories, auth helpers
│   │   ├── unit/
│   │   │   ├── middleware/
│   │   │   │   ├── auth.middleware.test.ts
│   │   │   │   └── rbac.middleware.test.ts
│   │   │   ├── services/
│   │   │   │   ├── auth.service.test.ts
│   │   │   │   └── task.service.test.ts
│   │   │   └── utils/
│   │   │       └── validation.test.ts
│   │   └── integration/
│   │       ├── auth.test.ts
│   │       ├── tasks.test.ts
│   │       ├── rbac.test.ts
│   │       └── users.test.ts
│   └── vitest.config.ts
├── frontend/
│   ├── tests/
│   │   ├── setup.ts                    # Config (Testing Library, mocks)
│   │   ├── mocks/
│   │   │   ├── handlers.ts            # MSW handlers
│   │   │   └── server.ts              # MSW server
│   │   ├── components/
│   │   │   ├── Button.test.tsx
│   │   │   ├── Sidebar.test.tsx
│   │   │   ├── DataTable.test.tsx
│   │   │   └── ConfirmModal.test.tsx
│   │   ├── views/
│   │   │   ├── Login.test.tsx
│   │   │   ├── Dashboard.test.tsx
│   │   │   ├── TaskList.test.tsx
│   │   │   └── TaskForm.test.tsx
│   │   └── hooks/
│   │       └── useAuth.test.ts
│   └── vitest.config.ts
└── e2e/
    ├── playwright.config.ts
    ├── fixtures/
    │   └── auth.ts                     # Login helper para tests
    ├── auth.spec.ts
    ├── rbac.spec.ts
    ├── task-crud.spec.ts
    └── navigation.spec.ts
```

---

## ⚙️ 7. Configuración de Testing

### Backend (vitest.config.ts)
```typescript
import { defineConfig } from 'vitest/config';
export default defineConfig({
  test: {
    globals: true,
    environment: 'node',
    setupFiles: ['./tests/setup.ts'],
    testTimeout: 10000,
    coverage: { provider: 'v8', reporter: ['text', 'lcov'] },
  },
});
```

### Frontend (vitest.config.ts)
```typescript
import { defineConfig } from 'vitest/config';
import react from '@vitejs/plugin-react';
export default defineConfig({
  plugins: [react()],
  test: {
    globals: true,
    environment: 'jsdom',
    setupFiles: ['./tests/setup.ts'],
    css: true,
    coverage: { provider: 'v8', reporter: ['text', 'lcov'] },
  },
});
```

### E2E (playwright.config.ts)
```typescript
import { defineConfig } from '@playwright/test';
export default defineConfig({
  testDir: './e2e',
  fullyParallel: true,
  retries: 1,
  use: { baseURL: 'http://localhost:3000' },
  projects: [
    { name: 'chromium', use: { browserName: 'chromium' } },
  ],
});
```

---

## ✅ 8. Criterios de Aceptación de Tests

- [ ] **Cobertura**: Cada endpoint tiene test para cada rol posible
- [ ] **Cobertura**: Cada vista tiene test para loading, empty, error, success
- [ ] **Cobertura**: Cada botón/acción tiene test de visibilidad según rol
- [ ] **Aislamiento**: Tests unitarios NO dependen de BD/API reales
- [ ] **Determinismo**: Mismos inputs → mismos resultados siempre
- [ ] **Velocidad**: Tests unitarios < 100ms cada uno
- [ ] **CI/CD**: `npm test` corre en cada PR, `npm run test:e2e` en main
- [ ] **Sin flakes**: Tests E2E tienen retry y timeouts adecuados

---

> **Instrucción para Agente C**: Implementa cada feature siguiendo TDD.
> 1. Escribe los tests (verán fallar)
> 2. Implementa el código mínimo para que pasen
> 3. Refactoriza manteniendo tests verdes
> 4. Commit con mensaje: `test: [feature]` para tests, `feat: [feature]` para código
