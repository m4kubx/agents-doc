#!/bin/bash
# Script de Validacion: Verifica que un proyecto del Agente A cumple con los requisitos del Agente B
# Uso: bash validate-agente-a-input.sh <ruta-del-proyecto>
# Ejemplo: bash validate-agente-a-input.sh /c/Users/MAKUBEX/Desktop/agents-doc/agents-doc/05-proyectos/taskmanager

if [ $# -eq 0 ]; then
    echo "Error: Debes proporcionar la ruta del proyecto"
    echo "Uso: bash validate-agente-a-input.sh <ruta-del-proyecto>"
    echo "Ejemplo:"
    echo "  bash validate-agente-a-input.sh /c/Users/MAKUBEX/Desktop/agents-doc/agents-doc/05-proyectos/taskmanager"
    exit 1
fi

PROJECT_PATH="$1"
PASS=0
FAIL=0
WARN=0

echo ""
echo "========================================"
echo " Validacion de Proyecto del Agente A"
echo " Proyecto: $(basename \"$PROJECT_PATH\")"
echo " Ruta: $PROJECT_PATH"
echo "========================================"
echo ""

# 1. Verificar que la carpeta existe
if [ ! -d "$PROJECT_PATH" ]; then
    echo "La carpeta del proyecto no existe: $PROJECT_PATH"
    exit 1
fi
echo "[OK] Carpeta del proyecto existe"
echo ""

# 2. Archivos requeridos (que B necesita leer)
REQUIRED_FILES=(
    "00-Project-Brief-Consolidado.md"
    "01-Business-Model-y-Requerimientos.md"
    "03-Esquema-Base-de-Datos.md"
    "04-UI-Vistas-y-Flujos-de-Usuario.md"
    "05-API-Design.md"
    "06-Seguridad-y-NFR.md"
)

echo "--- Archivos Requeridos ---"
for file in "${REQUIRED_FILES[@]}"; do
    if [ -f "$PROJECT_PATH/$file" ]; then
        FILESIZE=$(wc -c < "$PROJECT_PATH/$file" 2>/dev/null || echo 0)
        if [ "$FILESIZE" -gt 100 ]; then
            echo "[OK] $file ($FILESIZE bytes)"
            PASS=$((PASS + 1))
        else
            echo "[WARN] $file existe pero parece vacio ($FILESIZE bytes)"
            WARN=$((WARN + 1))
        fi
    else
        echo "[FAIL] $file no encontrado"
        FAIL=$((FAIL + 1))
    fi
done
echo ""

# 3. Archivos opcionales
OPTIONAL_FILES=(
    "02-ADR-Arquitectura.md"
    "07-Roadmap-y-Riesgos.md"
    "_handoff-to-b.md"
)

echo "--- Archivos Opcionales ---"
for file in "${OPTIONAL_FILES[@]}"; do
    if [ -f "$PROJECT_PATH/$file" ]; then
        echo "[OK] $file presente"
    else
        echo "[ - ] $file no presente (opcional)"
    fi
done
echo ""

# 4. Verificar frontmatter YAML en archivos Markdown
echo "--- Validacion de Frontmatter YAML ---"
for file in "$PROJECT_PATH"/*.md; do
    if [ -f "$file" ]; then
        BASENAME=$(basename "$file")
        FIRST_LINE=$(head -1 "$file")
        if [ "$FIRST_LINE" = "---" ]; then
            echo "[OK] $BASENAME tiene frontmatter YAML"
            PASS=$((PASS + 1))
        else
            echo "[WARN] $BASENAME no tiene frontmatter YAML"
            WARN=$((WARN + 1))
        fi
    fi
done
echo ""

# 5. Verificar estructura de entidades en DB Schema
echo "--- Validacion de Entidades BD ---"
DB_FILE="$PROJECT_PATH/03-Esquema-Base-de-Datos.md"
if [ -f "$DB_FILE" ]; then
    ENTITY_COUNT=$(grep -c "^### " "$DB_FILE" 2>/dev/null || echo 0)
    if [ "$ENTITY_COUNT" -gt 0 ]; then
        echo "[OK] $ENTITY_COUNT entidades encontradas en esquema BD"
        PASS=$((PASS + 1))
    else
        echo "[WARN] No se encontraron entidades (###) en el esquema BD"
        WARN=$((WARN + 1))
    fi
fi

# 6. Resumen
echo ""
echo "========================================"
echo " RESUMEN DE VALIDACION"
echo "========================================"
total=$((PASS + FAIL + WARN))
echo "Total de verificaciones: $total"
echo "[OK] Pasaron: $PASS"
echo "[FAIL] Fallaron: $FAIL"
echo "[WARN] Advertencias: $WARN"
echo ""

if [ "$FAIL" -gt 0 ]; then
    echo "RESULTADO: El proyecto NO esta listo para el Agente B"
    exit 1
elif [ "$WARN" -gt 0 ]; then
    echo "RESULTADO: El proyecto esta listo, pero revisa las advertencias"
    exit 0
else
    echo "RESULTADO: El proyecto esta COMPLETAMENTE listo para el Agente B"
    exit 0
fi
