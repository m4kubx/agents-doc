# Dashboard - Metodología Agents

**Última actualización:** <% tp.date.now("YYYY-MM-DD HH:mm") %>

---

## 📚 Plantillas Principales

```dataview
TABLE file.tags as Tags
FROM "01-plantillas"
SORT file.name ASC
```

## 📖 Guías

```dataview
LIST
FROM "02-guias"
SORT file.name ASC
```

## 👥 Roles y Patrones

```dataview
LIST
FROM "03-roles-y-patrones"
```

## 🚀 Templates de Templater (Listos para usar)

**Los más usados (recomendados):**
- 00-Principio-No-Generacion
- 01-Gestion-Contexto-v2
- 02-Razonamiento-Estructurado
- 09-Sesion-Completa-Alta-Eficiencia

```dataview
LIST
FROM "07-templates-templater"
SORT file.name ASC
```

## 📌 Accesos Rápidos

- [[00-core/principio-no-generacion-sin-orden]]
- [[00-core/plantilla-gestion-contexto-v2]]
- [[00-core/plantilla-razonamiento-estructurado]]
- [[00-core/plantilla-autocritica-integrada]]
- [[00-core/patron-orchestrator]]

**Guías rápidas:**
- [[08-dashboards/Cheatsheet-Combos]] ← **Empieza por aquí**

**Templates avanzados recomendados:**
- [[07-templates-templater/09-Sesion-Completa-Alta-Eficiencia]]
- [[07-templates-templater/04-SDD]]
- [[07-templates-templater/08-Verification-Agent]]

---

## 🔄 Últimos Proyectos

```dataview
LIST
FROM "05-proyectos"
SORT file.mtime DESC
LIMIT 10
```
