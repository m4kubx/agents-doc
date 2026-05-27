# Workflow de Git con Agentes de IA

> Cómo usar Git de forma profesional cuando el código (o gran parte de él) es generado por agentes, manteniendo trazabilidad, control de calidad y la capacidad de revertir rápido.

---

## Principios básicos

1. **El agente no comitea**. Tú controlas todos los commits.
2. **Cada commit debe tener un propósito claro** y estar relacionado con una tarea aprobada.
3. **Nunca hagas commit de código que no hayas revisado** (aunque lo haya generado el agente).
4. **Usa ramas por tarea/módulo**, no por agente.
5. **El historial debe ser legible por humanos** (los agentes pueden ayudar a escribir buenos mensajes).

---

## Estrategia de ramas recomendada

### Modelo simple (proyectos medianos)

```
main
├── feature/autenticacion-jwt
├── feature/pagos
├── feature/dashboard
└── hotfix/correccion-login
```

### Modelo con Orchestrator (proyectos grandes)

```
main
├── epic/autenticacion
│   ├── feature/login-email-password
│   ├── feature/oauth-google
│   └── feature/refresh-tokens
│
├── epic/pagos
│   └── ...
│
└── chore/actualizar-docs
```

**Regla**: Una rama = una tarea concreta asignada a un agente (o a ti).

---

## Flujo de trabajo por módulo/tarea (paso a paso)

1. **Antes de empezar**
   - Crea una rama desde `main` con nombre claro:
     `git checkout -b feature/modulo-autenticacion`

2. **Durante el trabajo con el agente**
   - Trabaja en la rama.
   - El agente genera código → tú revisas → tú comiteas.
   - Usa commits pequeños y atómicos.

3. **Cada vez que terminas una pieza verificada**
   - Commit con mensaje claro.
   - Opcional: abre un Draft PR para visibilidad (especialmente si hay Orchestrator).

4. **Cuando el módulo pasa la Checklist de Validación**
   - Revisa todo el diff de la rama.
   - Haz squash o rebase si es necesario para limpiar el historial.
   - Abre PR final → revisión humana (o por otro agente con rol Reviewer).
   - Merge a main (preferiblemente squash merge para mantener historial limpio).

5. **Después del merge**
   - Borra la rama local y remota.
   - Actualiza el estado del proyecto (especialmente si usas Orchestrator).

---

## Convención de commits recomendada

Usa el formato:

```
tipo(alcance): descripción corta en imperativo

[contexto adicional si hace falta]

Refs: #ticket o referencia al módulo
Agente: rol usado (opcional pero útil)
```

**Tipos comunes**:
- `feat`: nueva funcionalidad
- `fix`: corrección de bug
- `refactor`: cambio que no altera comportamiento
- `test`: solo agregar o modificar tests
- `docs`: documentación
- `chore`: tareas de mantenimiento (no productivas)

**Ejemplos buenos**:

```
feat(auth): implementar login con email y password

- Agrega endpoint POST /auth/login
- Usa bcrypt + JWT
- Incluye tests unitarios (TDD Red-Green)

Rol: Developer Senior + TDD
```

```
refactor(pagos): extraer validación de monto a función pura

Mejora testabilidad. No cambia comportamiento.

Rol: Refactor Specialist
```

---

## Cómo usar al agente para ayudarte con Git

El agente puede ser muy útil en estas tareas (pero **tú** decides y ejecutas):

- Pedirle que proponga un buen mensaje de commit basado en el diff.
- Pedirle que resuma qué cambió en una rama para el PR description.
- Pedirle que detecte commits que deberían separarse.
- Pedirle que sugiera nombres de ramas mejores.

**Prompt útil**:
```
Actúa como Git expert. Revisa el diff de los últimos cambios y propón:
1. Mensaje de commit claro y en imperativo
2. Si conviene separar en varios commits
3. Nombre de rama sugerido si aún no la creé
```

**Nunca** le des permiso al agente para hacer `git commit`, `git push` o `git merge` directamente (a menos que estés en un entorno muy controlado y con hooks de revisión).

---

## Manejo de errores y situaciones difíciles

### El agente generó código basura en la rama actual

1. No entres en pánico.
2. Usa `git checkout -b backup-intento-fallido` para guardar el intento.
3. Vuelve a `main` o a un commit estable.
4. Crea una nueva rama limpia.
5. Empieza de nuevo con mejor contexto + Principio de No Generación activado.

### Hay muchos commits pequeños y sucios

Usa interactive rebase o squash antes del PR final.

### El agente violó el Principio de No Generación dentro de una rama

- Registra el incidente en el estado del proyecto.
- Reviértelo o refactóralo antes de avanzar.
- Refuerza el prompt la próxima vez que asignes tarea.

---

## Tags y releases

- Usa tags semánticos (`v1.2.0`, `v1.2.1`, etc.).
- Solo taggea desde `main` después de merges completados y probados.
- El agente puede ayudarte a generar el changelog, pero tú decides qué entra en cada release.

---

## Integración con otras prácticas de esta metodología

- **Principio de No Generación**: Actívalo siempre antes de pedirle al agente que te ayude con commits, PRs o resúmenes.
- **TDD**: Haz commits de tests primero (Red), luego de implementación (Green). Esto queda muy limpio en el historial.
- **Orchestrator**: El Orchestrator puede llevar un registro de qué ramas corresponden a qué tareas asignadas.
- **Checklist de Validación**: Solo haz merge cuando el módulo haya pasado toda la checklist.

---

## Resumen del workflow ideal

1. Rama por tarea/módulo desde main.
2. Trabaja con agente(s) en esa rama.
3. Commits atómicos y bien nombrados (tú controlas).
4. Revisión (humana o con agente Reviewer).
5. Squash/rebase si hace falta.
6. PR final → merge a main.
7. Borra la rama.
8. Actualiza estado del proyecto.

Este workflow mantiene trazabilidad excelente incluso cuando gran parte del código fue escrito por agentes.
