# Resumen de Actividades - Tema 10: Mapas de Calor

## a) Herramienta más rápida
La herramienta más rápida y directa resultó ser **pheatmap en R**, ya que permite generar un mapa de calor completo, con anotaciones numéricas y dendrogramas con apenas una o dos líneas de código. En Python, `seaborn.heatmap` es igualmente muy ágil para matrices estáticas.

## b) Efecto del agrupamiento en pheatmap
El agrupamiento jerárquico automático cambió el orden de las variables en los ejes, agrupando juntas a la temperatura y la altitud por su correlación inversa, y a la humedad con la precipitación por su relación directa, evidenciando de forma visual inmediata la estructura subyacente de los datos meteorológicos.

## c) Matriz de correlación de Pearson
| Variables | temperatura_c | humedad_pct | precipitacion_mm | altitud_m |
| :--- | :--- | :--- | :--- | :--- |
| **temperatura_c** | 1.0000 | 0.4370 | -0.0132 | -0.8578 |
| **humedad_pct** | 0.4370 | 1.0000 | 0.8253 | -0.6787 |
| **precipitacion_mm** | -0.0132 | 0.8253 | 1.0000 | -0.2495 |
| **altitud_m** | -0.8578 | -0.6787 | -0.2495 | 1.0000 |