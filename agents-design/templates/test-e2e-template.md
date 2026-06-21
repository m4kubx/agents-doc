---
section: test-e2e
title: "Tests E2E — Patrón por Flujo"
version: "1.0.0"
---

# 🌐 Tests E2E: [NOMBRE_FLUJO]

> Patrón para tests E2E con Playwright: flujos completos desde la perspectiva del usuario.

---

## Configuración Base

```typescript
// e2e/fixtures/auth.ts
import { test as base } from '@playwright/test';

export type TestUser = {
  email: string;
  password: string;
  role: string;
  name: string;
};

export const USERS = {
  admin: { email: 'admin@test.com', password: 'Admin123!', role: 'ADMIN', name: 'Admin Test' },
  manager: { email: 'manager@test.com', password: 'Manager123!', role: 'MANAGER', name: 'Manager Test' },
  user: { email: 'user@test.com', password: 'User123!', role: 'USER', name: 'User Test' },
};

export const test = base.extend<{
  loginAs: (user: TestUser) => Promise<void>;
}>({
  loginAs: async ({ page }, use) => {
    await use(async (user: TestUser) => {
      await page.goto('/login');
      await page.fill('[data-testid="email"]', user.email);
      await page.fill('[data-testid="password"]', user.password);
      await page.click('[data-testid="login-button"]');
      await page.waitForURL(/\/dashboard/);
    });
  },
});

export { expect } from '@playwright/test';
```

---

## Patrón: Tests de Autenticación

```typescript
// e2e/auth.spec.ts
import { test, expect, USERS } from './fixtures/auth';

test.describe('Autenticación', () => {
  test('login exitoso redirige al dashboard', async ({ page }) => {
    await page.goto('/login');
    await page.fill('[data-testid="email"]', USERS.admin.email);
    await page.fill('[data-testid="password"]', USERS.admin.password);
    await page.click('[data-testid="login-button"]');

    await expect(page).toHaveURL(/\/dashboard/);
    await expect(page.getByText('Dashboard')).toBeVisible();
  });

  test('login fallido muestra error', async ({ page }) => {
    await page.goto('/login');
    await page.fill('[data-testid="email"]', 'wrong@test.com');
    await page.fill('[data-testid="password"]', 'wrong');
    await page.click('[data-testid="login-button"]');

    await expect(page.getByText(/credenciales inválidas/i)).toBeVisible();
    // El usuario permanece en login
    await expect(page).toHaveURL(/\/login/);
  });

  test('usuario no autenticado es redirigido a login', async ({ page }) => {
    await page.goto('/tasks');
    await expect(page).toHaveURL(/\/login/);
    await expect(page.getByText(/inicia sesión/i)).toBeVisible();
  });

  test('logout redirige a login y limpia sesión', async ({ page, loginAs }) => {
    await loginAs(USERS.admin);
    await page.click('[data-testid="logout-button"]');
    await expect(page).toHaveURL(/\/login/);

    // Intentar volver a dashboard
    await page.goto('/dashboard');
    await expect(page).toHaveURL(/\/login/);
  });
});
```

---

## Patrón: Tests de RBAC (crítico)

```typescript
// e2e/rbac.spec.ts
import { test, expect, USERS } from './fixtures/auth';

test.describe('RBAC — Acceso según rol', () => {
  test('admin puede ver /users', async ({ page, loginAs }) => {
    await loginAs(USERS.admin);
    await page.goto('/users');
    await expect(page.getByText(/usuarios/i)).toBeVisible();
    await expect(page.getByRole('button', { name: /crear usuario/i })).toBeVisible();
  });

  test('manager NO puede ver /users', async ({ page, loginAs }) => {
    await loginAs(USERS.manager);
    await page.goto('/users');
    await expect(page).toHaveURL(/\/403/);
    await expect(page.getByText(/acceso denegado/i)).toBeVisible();
  });

  test('user NO puede ver botón "Nueva Tarea"', async ({ page, loginAs }) => {
    await loginAs(USERS.user);
    await page.goto('/tasks');
    await expect(page.getByText(/mis tareas/i)).toBeVisible();
    await expect(page.getByRole('button', { name: /nueva tarea/i })).not.toBeVisible();
  });

  test('admin puede eliminar tarea, manager NO', async ({ page, loginAs }) => {
    await loginAs(USERS.admin);
    await page.goto('/tasks');
    const deleteButtons = page.getByRole('button', { name: /eliminar/i });
    await expect(deleteButtons.first()).toBeVisible();

    await loginAs(USERS.manager);
    await page.goto('/tasks');
    await expect(page.getByRole('button', { name: /eliminar/i })).toHaveCount(0);
  });

  test('sidebar cambia según rol', async ({ page, loginAs }) => {
    await loginAs(USERS.admin);
    await expect(page.getByText('Configuración')).toBeVisible();
    await expect(page.getByText('Usuarios')).toBeVisible();

    await loginAs(USERS.user);
    await expect(page.getByText('Configuración')).not.toBeVisible();
    await expect(page.getByText('Usuarios')).not.toBeVisible();
    await expect(page.getByText('Mis Tareas')).toBeVisible();
  });
});
```

---

## Patrón: Tests de CRUD

```typescript
// e2e/task-crud.spec.ts
import { test, expect, USERS } from './fixtures/auth';

test.describe('CRUD de Tareas', () => {
  test('admin crea una tarea exitosamente', async ({ page, loginAs }) => {
    await loginAs(USERS.admin);

    await page.goto('/tasks');
    await page.click('text=Nueva Tarea');

    // Verificar que el formulario se abre
    await expect(page).toHaveURL(/\/tasks\/create/);
    await expect(page.getByText('Nueva Tarea')).toBeVisible();

    // Llenar formulario
    await page.fill('[data-testid="title"]', 'Tarea de prueba E2E');
    await page.fill('[data-testid="description"]', 'Descripción de prueba');
    await page.selectOption('[data-testid="priority"]', 'HIGH');

    // Submit
    await page.click('[data-testid="save-button"]');

    // Verificar redirección y toast
    await expect(page).toHaveURL(/\/tasks/);
    await expect(page.getByText(/creada exitosamente/i)).toBeVisible();
    await expect(page.getByText('Tarea de prueba E2E')).toBeVisible();
  });

  test('user NO puede acceder a /tasks/create', async ({ page, loginAs }) => {
    await loginAs(USERS.user);
    await page.goto('/tasks/create');
    await expect(page).toHaveURL(/\/403/);
  });

  test('admin edita una tarea existente', async ({ page, loginAs }) => {
    await loginAs(USERS.admin);
    await page.goto('/tasks');

    // Click en editar de la primera tarea
    await page.click('[data-testid="edit-button"]:first-of-type');
    await expect(page).toHaveURL(/\/tasks\/.+\/edit/);

    // Modificar título
    await page.fill('[data-testid="title"]', 'Tarea editada E2E');
    await page.click('[data-testid="save-button"]');

    await expect(page.getByText(/actualizada exitosamente/i)).toBeVisible();
    await expect(page.getByText('Tarea editada E2E')).toBeVisible();
  });

  test('admin elimina tarea con confirmación', async ({ page, loginAs }) => {
    await loginAs(USERS.admin);
    await page.goto('/tasks');

    // Click eliminar
    await page.click('[data-testid="delete-button"]:first-of-type');

    // Modal de confirmación aparece
    await expect(page.getByText(/confirmar eliminación/i)).toBeVisible();

    // Cancelar → no se elimina
    await page.click('text=Cancelar');
    await expect(page.getByText(/confirmar eliminación/i)).not.toBeVisible();

    // Confirmar → se elimina
    await page.click('[data-testid="delete-button"]:first-of-type');
    await page.click('text=Confirmar');
    await expect(page.getByText(/eliminada exitosamente/i)).toBeVisible();
  });
});
```

---

## Patrón: Tests de Navegación y Estados

```typescript
// e2e/navigation.spec.ts
import { test, expect, USERS } from './fixtures/auth';

test.describe('Navegación', () => {
  test('sidebar links navegan correctamente', async ({ page, loginAs }) => {
    await loginAs(USERS.admin);

    const links = [
      { text: 'Dashboard', url: /\/dashboard/ },
      { text: 'Tareas', url: /\/tasks/ },
      { text: 'Usuarios', url: /\/users/ },
      { text: 'Configuración', url: /\/settings/ },
    ];

    for (const link of links) {
      await page.click(`text=${link.text}`);
      await expect(page).toHaveURL(link.url);
    }
  });

  test('404 para rutas inexistentes', async ({ page }) => {
    await page.goto('/ruta-inexistente');
    await expect(page.getByText(/404|no encontrado/i)).toBeVisible();
    // Botón volver al inicio funciona
    await page.click('text=Ir al Inicio');
    await expect(page).toHaveURL(/\/login/);
  });

  test('paginación funciona en listado de tareas', async ({ page, loginAs }) => {
    await loginAs(USERS.admin);
    await page.goto('/tasks');

    // Ver página siguiente
    await page.click('[data-testid="next-page"]');
    await expect(page).toHaveURL(/page=2/);
    // Volver atrás
    await page.click('[data-testid="prev-page"]');
    await expect(page).toHaveURL(/page=1/);
  });
});

test.describe('Estados de UI', () => {
  test('muestra loading skeleton mientras cargan datos', async ({ page, loginAs }) => {
    await loginAs(USERS.admin);
    await page.goto('/dashboard');
    // El skeleton debe aparecer brevemente antes de los datos
    await expect(page.getByTestId('dashboard-skeleton')).toBeVisible();
    await expect(page.getByTestId('dashboard-skeleton')).not.toBeVisible({ timeout: 5000 });
    // Luego los datos
    await expect(page.getByText('Total Tareas')).toBeVisible();
  });

  test('muestra empty state cuando no hay tareas', async ({ page, loginAs }) => {
    // Usar un usuario sin tareas
    await loginAs(USERS.user);
    await page.goto('/tasks');
    await expect(page.getByText(/no hay tareas/i)).toBeVisible();
    await expect(page.getByRole('button', { name: /crear tarea/i })).toBeVisible();
  });
});
```

---

## Playwright Config

```typescript
// playwright.config.ts
import { defineConfig } from '@playwright/test';

export default defineConfig({
  testDir: './e2e',
  fullyParallel: true,
  retries: 1,
  workers: 3,
  reporter: [['html'], ['list']],
  timeout: 30000,
  use: {
    baseURL: process.env.BASE_URL || 'http://localhost:3000',
    trace: 'retain-on-failure',
    screenshot: 'only-on-failure',
    testIdAttribute: 'data-testid',
  },
  projects: [
    {
      name: 'setup',
      testMatch: '**/global-setup.ts',
    },
    {
      name: 'chromium',
      use: { browserName: 'chromium' },
      dependencies: ['setup'],
    },
  ],
});
```

---

## data-testid Attributes (convención)

Usa siempre `data-testid` para elementos clave en los componentes:

| Elemento | data-testid |
|----------|-------------|
| Email input | `email` |
| Password input | `password` |
| Botón login | `login-button` |
| Botón logout | `logout-button` |
| Botón crear | `create-button` |
| Botón editar | `edit-button` |
| Botón eliminar | `delete-button` |
| Botón guardar | `save-button` |
| Botón cancelar | `cancel-button` |
| Botón reintentar | `retry-button` |
| Input título | `title` |
| Input descripción | `description` |
| Select prioridad | `priority` |
| Select estado | `status` |
| Tabla de datos | `data-table` |
| Skeleton loader | `skeleton` |
| Toast notificación | `toast` |
| Modal | `modal` |
| Sidebar nav | `sidebar-nav` |
| Paginación siguiente | `next-page` |
| Paginación anterior | `prev-page` |
