### **Resumen de Procesamiento de Imágenes Sintéticas**



1\. Dimensiones de las imágenes sintéticas

\- Imagen en escala de grises: Matriz de 2 dimensiones de tamaño 5x5 píxeles (shape (5, 5)).

\- Imagen a color (RGB): Array de 3 dimensiones de tamaño 4x4x3 píxeles (shape (4, 4, 3)).



2\. Colores elegidos y luminosidad

Se seleccionaron dos colores primarios para construir la imagen dividida en mitades:

\- Mitad izquierda (Verde puro \[0, 255, 0]):

\- Luminosidad calculada: 0.299\*0 + 0.587\*255 + 0.114\*0 = 149.685

\- Mitad derecha (Azul puro \[0, 0, 255]):

\- Luminosidad calculada: 0.299\*0 + 0.587\*0 + 0.114\*255 = 29.07



3\. Umbral para la binarización

Se aplicó un umbral de 100. Se escogió este valor porque se encuentra justo en el punto medio entre los valores de luminosidad calculados para el azul (29.07) y el verde (149.685), permitiendo clasificar de manera óptima la mitad más brillante como activa (1/True) y la más oscura como inactiva (0/False).

