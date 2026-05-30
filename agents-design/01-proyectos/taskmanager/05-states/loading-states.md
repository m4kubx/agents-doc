# Estados de Carga - TaskManager

## Dashboard
```
+---------------------------------------------------+
| [Skeleton 300x150]  [Skeleton 300x150]            |
| [Skeleton 300x150]  [Skeleton 300x150]            |
+---------------------------------------------------+
```
- 4 skeleton widgets con animacion pulse
- Duracion: ~1-2 segundos (simulacion de carga)
- Transicion: fade-out del skeleton, fade-in del contenido

## Listado de Tareas
```
+---------------------------------------------------+
| [Skeleton input busqueda]                         |
| [Skeleton row]  [Skeleton row]  [Skeleton row]    |
| [Skeleton row]  [Skeleton row]  [Skeleton row]    |
| [Skeleton pagination]                             |
+---------------------------------------------------+
```
- 6 skeleton rows con animacion pulse
- Los skeletons mantienen la estructura de la tabla (columnas)
- Input de busqueda tambien en skeleton (deshabilitado)

## Detalle de Tarea
```
+---------------------------------------------------+
| [Skeleton titulo 60% width]                       |
| [Skeleton text 100% width]                        |
| [Skeleton text 90% width]                         |
| [Skeleton text 80% width]                         |
| [Skeleton badge] [Skeleton badge] [Skeleton badge]|
+---------------------------------------------------+
```
- Skeleton del titulo mas angosto
- 3 lineas de texto de diferentes anchos
- Badges/etiquetas como circulos pequenos

## Formularios (Crear/Editar)
```
+---------------------------------------------------+
| [Skeleton input label]                            |
| [Skeleton input field]                            |
| [Skeleton input label]                            |
| [Skeleton input field]                            |
| [Skeleton button disabled con spinner]            |
+---------------------------------------------------+
```
- Inputs deshabilitados durante la carga
- Boton submit con spinner y texto "Guardando..."
- No se permite interaccion hasta que termine

## Animaciones Sugeridas
- Skeleton: `animate-pulse` (Tailwind) o `@keyframes pulse`
- Duracion skeleton: 1.5s cycle
- Transicion contenido: `opacity 300ms ease-in-out`
- Spinner: `@keyframes spin` 1s linear infinite
