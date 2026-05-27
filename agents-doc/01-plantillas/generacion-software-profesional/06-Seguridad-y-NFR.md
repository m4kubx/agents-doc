---
title: Sub-Plantilla - Seguridad y Requisitos No Funcionales (NFR)
type: plantilla
tags:
  - metodologia
  - plantilla
  - generacion-documentacion
  - seguridad
  - nfr
fase: 5
---

# Sub-Plantilla: Seguridad y Requisitos No Funcionales

---

## 1. Threat Model Básico

Usar STRIDE o similar para las áreas más críticas:

| Área | Amenazas Identificadas | Mitigaciones |
|------|------------------------|--------------|
| Autenticación | | |
| Datos sensibles | | |
| Comunicación | | |
| Infraestructura | | |

## 2. OWASP Top 10 (2021) - Consideraciones

Para cada ítem relevante, indicar cómo se mitiga en este proyecto.

## 3. Requisitos de Seguridad

- Cifrado en tránsito y en reposo
- Manejo de secretos (Vault, env, etc.)
- Logging de eventos de seguridad
- Incident response plan básico
- Compliance requerido (GDPR, HIPAA, PCI-DSS, etc.)

## 4. Requisitos No Funcionales

### Performance
- Tiempo de respuesta p95 por tipo de endpoint
- Throughput esperado
- Carga concurrente esperada

### Escalabilidad
- Estrategia horizontal / vertical
- Cuellos de botella esperados

### Disponibilidad y Resiliencia
- SLA objetivo
- Estrategia de backups
- Disaster Recovery (RTO / RPO)

### Observabilidad
- Logging
- Métricas
- Tracing
- Alerting

### Mantenibilidad y Operabilidad
- ...

**Entregable**: Sección dentro de `05-Especificacion-Tecnica.md` o documento dedicado `06-Seguridad-y-NFR.md`.
