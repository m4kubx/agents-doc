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

---

## 🔄 Últimos Proyectos

```dataview
LIST
FROM "05-proyectos"
SORT file.mtime DESC
LIMIT 10
```
