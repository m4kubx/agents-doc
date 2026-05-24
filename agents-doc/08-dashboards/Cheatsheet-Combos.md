# Cheatsheet - Combinaciones de Plantillas (2026)

Guía rápida de qué templates usar según el tipo de tarea.

---

## 🔥 Combos Recomendados

| Tipo de Tarea | Combo Recomendado | Orden de uso | Notas |
|---------------|-------------------|--------------|-------|
| **Chat nuevo (cualquier cosa)** | `00-Principio-No-Generacion` | 1 | Siempre primero |
| **Retomar proyecto existente** | `01-Gestion-Contexto-v2` | 1 | Usa el Memory Bank |
| **Decisión técnica / Tradeoff / Arquitectura** | `02-Razonamiento-Estructurado` + `05-Suposiciones-Explicitas` | 1 → 2 | Luego Auto-Crítica |
| **Funcionalidad con lógica compleja** | `09-Sesion-Completa-Alta-Eficiencia` | 1 | El combo más poderoso |
| **Especificar funcionalidad formal** | `04-SDD` + `05-Suposiciones-Explicitas` | 1 → 2 | Ideal antes de TDD |
| **Implementar con TDD** | `07-TDD-Red-Green-Refactor` | 1 | Usa después de tener spec |
| **Después de que otro agente entrega trabajo** | `08-Verification-Agent` | 1 | Auditoría de fidelidad |
| **Quieres máxima calidad posible** | `09-Sesion-Completa-Alta-Eficiencia` + `06-Formato-Salida-Estructurado` | 1 | Combo nuclear |

---

## 🚀 El Combo Nuclear (Máxima Eficiencia)

Usa esto cuando la tarea sea **importante** y quieras el mejor resultado posible:

1. **09-Sesion-Completa-Alta-Eficiencia** (todo en uno)
2. (Opcional) **06-Formato-Salida-Estructurado** al final

Este combo activa:
- Principio de No Generación
- Razonamiento Estructurado
- Suposiciones Explícitas
- Auto-Crítica Integrada

---

## 📋 Por Nivel de Complejidad

### Nivel Básico (Tareas simples)
- Solo `00-Principio-No-Generacion`

### Nivel Intermedio
- `00-Principio-No-Generacion`
- `02-Razonamiento-Estructurado`
- `03-Auto-Critica`

### Nivel Avanzado (Recomendado para la mayoría de casos)
- `09-Sesion-Completa-Alta-Eficiencia`

### Nivel Experto / Crítico
- `09-Sesion-Completa-Alta-Eficiencia`
- `06-Formato-Salida-Estructurado` (para entregar al Orchestrator o a otro agente)

---

## 🎯 Flujos Comunes

### Flujo: Nueva funcionalidad importante
1. `09-Sesion-Completa-Alta-Eficiencia`
2. (Si hace falta) `04-SDD`
3. `07-TDD-Red-Green-Refactor`

### Flujo: Decisión de arquitectura
1. `02-Razonamiento-Estructurado`
2. `05-Suposiciones-Explicitas`
3. `03-Auto-Critica`

### Flujo: Usando Orchestrator
1. Orchestrator asigna tarea
2. Agente ejecuta con `09-Sesion-Completa-Alta-Eficiencia`
3. Orchestrator llama a `08-Verification-Agent` para auditar

### Flujo: Retomar proyecto después de días
1. `01-Gestion-Contexto-v2` (con Memory Bank actualizado)
2. `00-Principio-No-Generacion`

---

## ⚡ Atajos Mentales

- **¿Dudo de algo?** → Usa `05-Suposiciones-Explicitas`
- **¿La tarea es compleja?** → Usa `09-Sesion-Completa-Alta-Eficiencia`
- **¿Acabo de recibir trabajo de otro agente?** → Usa `08-Verification-Agent`
- **¿Quiero TDD?** → Usa `07-TDD-Red-Green-Refactor`
- **¿Necesito especificación formal?** → Usa `04-SDD`

---

**Regla de oro**:  
Cuando no sepas qué usar, elige **`09-Sesion-Completa-Alta-Eficiencia`**.  
Cubre el 80% de los casos de forma excelente.

---

*Última actualización: 2026-05-24*
