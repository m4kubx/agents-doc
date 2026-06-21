---
section: test-rbac
title: "Tests RBAC — Patrón por Endpoint"
version: "1.0.0"
---

# 🔐 Tests RBAC: [NOMBRE_ENDPOINT]

> Copia este patrón para cada endpoint y complete con los roles/permisos del proyecto.

---

## Backend — Test de Permisos por Endpoint

```typescript
import { describe, it, expect, beforeAll } from 'vitest';
import request from 'supertest';
import { app } from '../src/app';
import { createTestUser, getToken } from './helpers';

describe('RBAC — [Método] /api/[recurso]', () => {
  describe('sin autenticación', () => {
    it('responde 401 si no hay token', async () => {
      const res = await request(app)
        .[método]('/api/[recurso]');
      expect(res.status).toBe(401);
      expect(res.body.error).toBeDefined();
    });

    it('responde 401 si el token es inválido', async () => {
      const res = await request(app)
        .[método]('/api/[recurso]')
        .set('Authorization', 'Bearer token-invalido');
      expect(res.status).toBe(401);
    });
  });

  describe('como admin', () => {
    let token: string;
    beforeAll(async () => {
      const user = await createTestUser({ role: 'ADMIN' });
      token = getToken(user);
    });

    it('responde 200 y devuelve datos', async () => {
      const res = await request(app)
        .[método]('/api/[recurso]')
        .set('Authorization', `Bearer ${token}`);
      expect(res.status).toBe(200);
      expect(res.body).toBeDefined();
    });
  });

  describe('como manager', () => {
    let token: string;
    beforeAll(async () => {
      const user = await createTestUser({ role: 'MANAGER' });
      token = getToken(user);
    });

    it('responde 200 con datos filtrados por su equipo', async () => {
      const res = await request(app)
        .[método]('/api/[recurso]')
        .set('Authorization', `Bearer ${token}`);
      expect(res.status).toBe(200);
      // Verificar que SOLO devuelve datos de su equipo
      res.body.forEach((item: any) => {
        expect(item.teamId).toBe(user.teamId);
      });
    });

    // Si aplica: operaciones restringidas para manager
    it('responde 403 al intentar [acción restringida]', async () => {
      const res = await request(app)
        .[método_restringido]('/api/[recurso]/[id]')
        .set('Authorization', `Bearer ${token}`);
      expect(res.status).toBe(403);
    });
  });

  describe('como user', () => {
    let token: string;
    let userId: string;
    beforeAll(async () => {
      const user = await createTestUser({ role: 'USER' });
      token = getToken(user);
      userId = user.id;
    });

    it('responde 200 solo con datos propios', async () => {
      const res = await request(app)
        .[método]('/api/[recurso]')
        .set('Authorization', `Bearer ${token}`);
      expect(res.status).toBe(200);
      res.body.forEach((item: any) => {
        expect(item.userId).toBe(userId);
      });
    });

    it('responde 403 al intentar acceder a recurso de otro usuario', async () => {
      const otraId = 'some-other-user-id';
      const res = await request(app)
        .[método]('/api/[recurso]/' + otraId)
        .set('Authorization', `Bearer ${token}`);
      expect(res.status).toBe(403);
    });
  });
});
```

---

## Frontend — Test de Visibilidad por Rol

```typescript
import { describe, it, expect, beforeEach } from 'vitest';
import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { AuthContext } from '../contexts/AuthContext';
import { [Componente] } from './[Componente]';

const renderConRol = (rol: string, ui: React.ReactElement) => {
  return render(
    <AuthContext.Provider value={{ user: { role: rol }, ...mockAuth }}>
      {ui}
    </AuthContext.Provider>
  );
};

describe('[Componente] — visibilidad por rol', () => {
  describe('como admin', () => {
    it('renderiza botón "[acción]"', () => {
      renderConRol('ADMIN', <[Componente] />);
      expect(screen.getByRole('button', { name: /[acción]/i })).toBeDefined();
    });

    it('botón "[acción]" está habilitado', () => {
      renderConRol('ADMIN', <[Componente] />);
      expect(screen.getByRole('button', { name: /[acción]/i })).not.toBeDisabled();
    });
  });

  describe('como manager', () => {
    it('renderiza botón "[acción]"', () => {
      renderConRol('MANAGER', <[Componente] />);
      expect(screen.getByRole('button', { name: /[acción]/i })).toBeDefined();
    });

    // Si manager NO puede eliminar:
    it('NO renderiza botón "Eliminar"', () => {
      renderConRol('MANAGER', <[Componente] />);
      expect(screen.queryByRole('button', { name: /eliminar/i })).toBeNull();
    });
  });

  describe('como user', () => {
    it('NO renderiza botón "[acción-restringida]"', () => {
      renderConRol('USER', <[Componente] />);
      expect(screen.queryByRole('button', { name: /[acción-restringida]/i })).toBeNull();
    });

    it('NO renderiza link a /users', () => {
      renderConRol('USER', <[Componente] />);
      expect(screen.queryByText(/usuarios/i)).toBeNull();
    });
  });

  describe('sin autenticación', () => {
    it('redirige a /login', () => {
      // ... render sin AuthContext
    });
  });
});
```

---

## Helpers para Tests RBAC

```typescript
// tests/helpers.ts
import { app } from '../src/app';
import { prisma } from '../src/lib/prisma';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';

export async function createTestUser(overrides: Partial<User> = {}) {
  const defaultUser = {
    name: 'Test User',
    email: `test-${Date.now()}@example.com`,
    password: await bcrypt.hash('password123', 1),
    role: 'USER',
    active: true,
  };

  return prisma.user.create({
    data: { ...defaultUser, ...overrides },
  });
}

export function getToken(user: User): string {
  return jwt.sign(
    { id: user.id, role: user.role, email: user.email },
    process.env.JWT_SECRET || 'test-secret',
    { expiresIn: '1h' }
  );
}

export function getTokenForRole(role: string): string {
  return jwt.sign(
    { id: 'test-id', role, email: 'test@test.com' },
    process.env.JWT_SECRET || 'test-secret',
    { expiresIn: '1h' }
  );
}
```
