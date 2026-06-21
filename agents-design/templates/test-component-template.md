---
section: test-component
title: "Tests de Componentes UI — Patrón"
version: "1.0.0"
---

# 🎨 Tests de Componentes UI: [NOMBRE_COMPONENTE]

> Patrón para testear cada componente UI: render, estados, acciones según rol.

---

## Patrón Base: Render + Estados

```typescript
import { describe, it, expect, beforeEach } from 'vitest';
import { render, screen, waitFor } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { [Componente] } from './[Componente]';

// Mock de datos
const mockData = { /* ... */ };
const mockOnAction = vi.fn();

describe('[Componente]', () => {
  describe('render', () => {
    it('renderiza el título "[texto]"', () => {
      render(<[Componente] />);
      expect(screen.getByText(/[texto]/i)).toBeDefined();
    });

    it('renderiza el botón "[label]"', () => {
      render(<[Componente] />);
      expect(screen.getByRole('button', { name: /[label]/i })).toBeDefined();
    });

    it('renderiza [N] filas en la tabla', () => {
      render(<[Componente] data={mockData} />);
      const rows = screen.getAllByRole('row');
      expect(rows.length).toBe(mockData.length + 1); // +1 header
    });
  });

  describe('estado loading', () => {
    it('muestra skeleton mientras isLoading=true', () => {
      render(<[Componente] isLoading={true} />);
      expect(screen.getByTestId('skeleton')).toBeDefined();
    });

    it('NO muestra skeleton cuando isLoading=false', () => {
      render(<[Componente] isLoading={false} data={mockData} />);
      expect(screen.queryByTestId('skeleton')).toBeNull();
    });

    it('deshabilita botones durante loading', () => {
      render(<[Componente] isLoading={true} />);
      const buttons = screen.getAllByRole('button');
      buttons.forEach(btn => {
        expect(btn).toBeDisabled();
      });
    });
  });

  describe('estado empty', () => {
    it('muestra mensaje vacío cuando data=[]', () => {
      render(<[Componente] data={[]} />);
      expect(screen.getByText(/no hay/i)).toBeDefined();
    });

    it('muestra botón de acción en empty state', () => {
      render(<[Componente] data={[]} />);
      expect(screen.getByRole('button', { name: /crear/i })).toBeDefined();
    });

    it('NO muestra tabla cuando no hay datos', () => {
      render(<[Componente] data={[]} />);
      expect(screen.queryByRole('table')).toBeNull();
    });
  });

  describe('estado error', () => {
    it('muestra mensaje de error cuando error=true', () => {
      render(<[Componente] error="Error al cargar" />);
      expect(screen.getByText(/error/i)).toBeDefined();
    });

    it('botón de reintentar funciona', async () => {
      const onRetry = vi.fn();
      render(<[Componente] error="Error" onRetry={onRetry} />);
      await userEvent.click(screen.getByRole('button', { name: /reintentar/i }));
      expect(onRetry).toHaveBeenCalledOnce();
    });
  });
});
```

---

## Patrón: Botones y Acciones

```typescript
describe('[Componente] — acciones', () => {
  it('llama onDelete al hacer click en botón eliminar', async () => {
    const onDelete = vi.fn();
    render(<[Componente] onDelete={onDelete} />);
    await userEvent.click(screen.getByRole('button', { name: /eliminar/i }));
    expect(onDelete).toHaveBeenCalledWith('id-esperado');
  });

  it('abre modal de confirmación antes de eliminar', async () => {
    render(<[Componente] />);
    await userEvent.click(screen.getByRole('button', { name: /eliminar/i }));
    expect(screen.getByText(/confirmar/i)).toBeDefined();
    expect(screen.getByRole('button', { name: /cancelar/i })).toBeDefined();
  });

  it('NO elimina si se cancela en el modal', async () => {
    const onDelete = vi.fn();
    render(<[Componente] onDelete={onDelete} />);
    await userEvent.click(screen.getByRole('button', { name: /eliminar/i }));
    await userEvent.click(screen.getByRole('button', { name: /cancelar/i }));
    expect(onDelete).not.toHaveBeenCalled();
  });

  it('navega a [ruta] al hacer click en [botón]', async () => {
    const mockNavigate = vi.fn();
    render(
      <MemoryRouter>
        <[Componente] />
      </MemoryRouter>
    );
    // Si usas useNavigate mock:
    // vi.mock('react-router-dom', () => ({
    //   ...vi.importActual('react-router-dom'),
    //   useNavigate: () => mockNavigate,
    // }));
    await userEvent.click(screen.getByRole('button', { name: /crear/i }));
    expect(mockNavigate).toHaveBeenCalledWith('/[ruta]');
  });
});
```

---

## Patrón: Formularios y Validación

```typescript
describe('[Formulario] — validación', () => {
  beforeEach(() => {
    render(<[Formulario] />);
  });

  it('botón submit deshabilitado si hay campos vacíos', () => {
    expect(screen.getByRole('button', { name: /guardar/i })).toBeDisabled();
  });

  it('muestra error inline si [campo] está vacío al hacer submit', async () => {
    await userEvent.click(screen.getByRole('button', { name: /guardar/i }));
    expect(screen.getByText(/campo requerido/i)).toBeDefined();
  });

  it('muestra error inline si email tiene formato inválido', async () => {
    const input = screen.getByLabelText(/email/i);
    await userEvent.type(input, 'email-invalido');
    await userEvent.tab();
    expect(screen.getByText(/email inválido/i)).toBeDefined();
  });

  it('habilita submit cuando todos los campos son válidos', async () => {
    await userEvent.type(screen.getByLabelText(/título/i), 'Mi tarea');
    await userEvent.type(screen.getByLabelText(/descripción/i), 'Descripción');
    expect(screen.getByRole('button', { name: /guardar/i })).not.toBeDisabled();
  });
});

describe('[Formulario] — envío', () => {
  it('llama onSubmit con datos del formulario', async () => {
    const onSubmit = vi.fn();
    render(<[Formulario] onSubmit={onSubmit} />);

    await userEvent.type(screen.getByLabelText(/título/i), 'Nueva tarea');
    await userEvent.type(screen.getByLabelText(/descripción/i), 'Descripción');
    await userEvent.click(screen.getByRole('button', { name: /guardar/i }));

    expect(onSubmit).toHaveBeenCalledWith({
      title: 'Nueva tarea',
      description: 'Descripción',
    });
  });

  it('muestra loading en botón durante submit', async () => {
    const onSubmit = vi.fn(() => new Promise(resolve => setTimeout(resolve, 100)));
    render(<[Formulario] onSubmit={onSubmit} />);

    await userEvent.click(screen.getByRole('button', { name: /guardar/i }));
    expect(screen.getByRole('button', { name: /guardando/i })).toBeDefined();
    expect(screen.getByRole('button', { name: /guardando/i })).toBeDisabled();
  });

  it('muestra toast de éxito tras submit exitoso', async () => {
    const onSubmit = vi.fn().mockResolvedValue({});
    render(<[Formulario] onSubmit={onSubmit} />);

    await userEvent.click(screen.getByRole('button', { name: /guardar/i }));
    await waitFor(() => {
      expect(screen.getByText(/creada exitosamente/i)).toBeDefined();
    });
  });

  it('muestra error del servidor si submit falla', async () => {
    const onSubmit = vi.fn().mockRejectedValue(new Error('Error del servidor'));
    render(<[Formulario] onSubmit={onSubmit} />);

    await userEvent.click(screen.getByRole('button', { name: /guardar/i }));
    await waitFor(() => {
      expect(screen.getByText(/error del servidor/i)).toBeDefined();
    });
  });
});
```

---

## Patrón: Sidebar y Navegación

```typescript
describe('Sidebar — items por rol', () => {
  const sidebarItems = {
    ADMIN: ['Dashboard', 'Tareas', 'Usuarios', 'Reportes', 'Configuración'],
    MANAGER: ['Dashboard', 'Tareas', 'Equipo', 'Reportes'],
    USER: ['Dashboard', 'Mis Tareas'],
  };

  it.each([
    ['ADMIN', sidebarItems.ADMIN],
    ['MANAGER', sidebarItems.MANAGER],
    ['USER', sidebarItems.USER],
  ])('renderiza items correctos para rol %s', (rol, items) => {
    renderConRol(rol, <Sidebar />);
    items.forEach(item => {
      expect(screen.getByText(item)).toBeDefined();
    });
  });

  it('NO renderiza items de admin para rol user', () => {
    renderConRol('USER', <Sidebar />);
    expect(screen.queryByText('Usuarios')).toBeNull();
    expect(screen.queryByText('Configuración')).toBeNull();
  });

  it('destaca el link activo', () => {
    render(
      <MemoryRouter initialEntries={['/tasks']}>
        <Sidebar />
      </MemoryRouter>
    );
    const tasksLink = screen.getByText('Tareas').closest('a');
    expect(tasksLink?.className).toContain('active');
  });
});
```
