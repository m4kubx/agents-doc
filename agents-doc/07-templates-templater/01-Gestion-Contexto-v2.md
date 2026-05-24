<%*
const fecha = tp.date.now("YYYY-MM-DD");
const hora = tp.date.now("HH:mm");
const proyecto = await tp.system.prompt("Nombre del proyecto/sistema:");
const stack = await tp.system.prompt("Stack principal:");
-%>
# Gestión de Contexto v2 - <% proyecto %>

**Fecha:** <% fecha %>  
**Hora:** <% hora %>

---

## Executive Summary

**Sistema:** <% proyecto %>  
**Stack:** <% stack %>  
**Estado actual:**

## Memory Bank

### Decisiones Técnicas Aprobadas
- 

### Supuestos Actuales del Proyecto
- 

### Reglas de Arquitectura y Convenciones
- 

### Backlog Estratégico
- Alta prioridad: 
- Media prioridad: 

## Contexto de la Sesión Actual

**Módulo / Tarea en progreso:** 

**Cambios recientes importantes:**

**Preguntas abiertas:**

---

## Tarea de este chat

[Describe exactamente qué quieres que haga ahora]
