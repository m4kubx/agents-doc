# Obsidian Setup Guide for agents-doc

This guide explains how to integrate the `agents-doc` methodology into Obsidian following the recommended "Vault dedicado + Git" approach.

---

## Recommended Approach: Dedicated Vault + Git (Chosen Option)

### Step 1: Open the repository as your Obsidian vault (recommended)

The simplest and cleanest way is to open the existing `agents-doc` folder directly as an Obsidian vault:

1. Open Obsidian
2. Click **"Open folder as vault"**
3. Navigate to:  
   `C:\Users\MAKUBEX\Desktop\agents-doc`
4. Select the folder and open it

This keeps your source of truth in one place and leverages the git repository you already initialized.

---

### Step 2: Install Recommended Plugins

Once the vault is open, install these community plugins (Community Plugins → Browse):

| Plugin              | Purpose                                      | Why it's useful for this methodology                  |
|---------------------|----------------------------------------------|-------------------------------------------------------|
| **Templater**       | Advanced templates with dynamic content      | Quick insertion of any plantilla with variables       |
| **Dataview**        | Powerful queries over your notes             | List all plantillas, filter by tags, create indexes   |
| **Obsidian Git**    | Git integration inside Obsidian              | Auto commit + push, history, backup of your notes     |
| **Canvas**          | Visual canvas for workflows                  | Map Orchestrator flows, role interactions visually    |
| **Tasks** (optional)| Task tracking                                | Track usage of the methodology in your projects       |

After installing, enable them in **Settings → Community plugins**.

---

### Step 3: Configure Obsidian Git (Recommended)

1. Go to **Settings → Obsidian Git**
2. Enable **"Backup on close"** and **"Pull on startup"**
3. Set a commit message template, for example:
   ```
   vault backup: {{date:YYYY-MM-DD}}
   ```
4. (Optional but powerful) Configure automatic backup every X minutes

This gives you version history of any personal notes, examples, and customizations you make on top of the core methodology.

---

### Step 4: Recommended Folder Structure Inside the Vault

You can keep the core methodology clean and add your own layers on top:

```
agents-doc/
├── .gitignore
├── README.md
├── plan-mejoras-eficiencia-agentes.md
├── ...
│
├── 00-metodologia/          ← (optional) your organized copies or favorites
├── 01-ejemplos-personales/
├── 02-proyectos/
│   └── mi-proyecto-actual/
├── 03-canvas/               ← Orchestrator workflows, role maps
└── 99-ajustes-personales/
```

Use tags like `#plantilla`, `#guia`, `#rol`, `#concepto` on the core files for powerful Dataview queries.

---

### Step 5: Useful Dataview Queries (Examples)

Create a note called `Dashboard.md` with queries like:

```dataview
TABLE file.tags as Tags
FROM "."
WHERE contains(file.tags, "#plantilla")
SORT file.name ASC
```

```dataview
LIST
FROM "."
WHERE contains(file.tags, "#guia")
```

---

### Step 6: Templater Setup (Highly Recommended)

1. Create a folder: `templates/`
2. Copy your most-used plantillas into it (or keep references).
3. Configure Templater to use that folder.
4. Create hotkeys or quick commands for the most common starters:
   - Principio de No Generación
   - Gestión de Contexto v2
   - Razonamiento Estructurado
   - Auto-Crítica

---

### Alternative: True Separate Dedicated Vault (Advanced)

If you prefer a completely separate vault folder:

1. Create a new folder, e.g.:
   `C:\Users\MAKUBEX\Documents\Obsidian\agents-doc-methodology`

2. Inside it, create a symbolic link (junction) pointing to the real repo:

   ```powershell
   # Run in PowerShell as Administrator or in the target folder
   mklink /J "metodologia-core" "C:\Users\MAKUBEX\Desktop\agents-doc"
   ```

3. Open the `agents-doc-methodology` folder as your Obsidian vault.
4. Your personal notes live in the vault, while the core methodology stays in the git repo.

This gives you clean separation between "official methodology" and "your personal usage/notes".

---

## Quick Start Checklist

- [ ] Open `C:\Users\MAKUBEX\Desktop\agents-doc` as Obsidian vault
- [ ] Install and enable: Templater, Dataview, Obsidian Git, Canvas
- [ ] Configure Obsidian Git with auto-backup
- [ ] Create a `Dashboard.md` with useful Dataview queries
- [ ] Set up Templater with your favorite starters
- [ ] (Optional) Create a dedicated vault + junction for separation

---

## Benefits of This Setup

- Full git history of the official methodology (already initialized)
- Personal notes and project examples versioned separately via Obsidian Git
- Visual mapping of complex workflows using Canvas
- Fast access to any plantilla via Templater
- Powerful search and indexes via Dataview
- Clean, professional, and future-proof knowledge base

---

This setup turns the agents-doc methodology into a living, versioned, and highly usable system inside Obsidian.
