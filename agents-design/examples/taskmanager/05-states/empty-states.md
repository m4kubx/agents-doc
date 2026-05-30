# Estados Vacios - TaskManager

## Dashboard - Sin Tareas
```
+---------------------------------------------------+
|                                                   |
|              [Ilustracion: lista vacia]            |
|                                                   |
|         "Bienvenido a TaskManager"                |
|     "Comienza creando tu primera tarea"            |
|                                                   |
|        [Boton: "+ Crear Primera Tarea"]           |
|                                                   |
+---------------------------------------------------+
```
- Ilustracion amigable (no error, sino oportunidad)
- Mensaje de bienvenida personalizado
- CTA claro: boton primary "Crear Primera Tarea"
- Accion alternativa: "Importar tareas" (link)

## Listado de Tareas - Sin Resultados
```
+---------------------------------------------------+
|                                                   |
|              [Ilustracion: lupa/vacio]             |
|                                                   |
|         "No se encontraron tareas"                |
|     "Intenta ajustar los filtros de busqueda"      |
|                                                   |
|        [Boton: "Limpiar Filtros"]                 |
|        [Link: "Crear Nueva Tarea"]                |
|                                                   |
+---------------------------------------------------+
```
- Distinguir entre:
  - No hay tareas en absoluto -> CTA "Crear Primera Tarea"
  - Filtros sin resultados -> CTA "Limpiar Filtros"
  - Busqueda sin resultados -> "No se encontraron resultados para \"[query]\""

## Detalle de Tarea - No Encontrada
```
+---------------------------------------------------+
|                                                   |
|         "Esta tarea ya no existe"                  |
|     "Pudo haber sido eliminada o la URL es incorrecta"|
|                                                   |
|        [Boton: "Volver al Listado"]               |
|                                                   |
+---------------------------------------------------+
```
- Similar a 404 pero contextual a la entidad
- Accion: volver al listado de tareas

## Comentarios - Sin Comentarios
```
+---------------------------------------------------+
|  [Icono: chat-text]                               |
|  "Sin comentarios"                                |
|  "Se el primero en comentar"                       |
|  [Textarea + Boton "Comentar"]                    |
+---------------------------------------------------+
```
- El formulario de comentarios SIEMPRE visible
- El estado vacio esta debajo del formulario
- Mensaje positivo: "Se el primero en comentar"

## Animaciones Sugeridas
- Ilustracion: fade-in + slide-up sutil
- Boton CTA: hover scale 1.02
- Transicion a estado con datos: fade-out + fade-in
