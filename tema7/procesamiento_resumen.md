### Resumen de Procesamiento de Imágenes con Python



#### (a) Figuras dibujadas

Se creó una imagen sintética de 120x120 píxeles sobre un fondo azul oscuro (RGB: 20, 30, 70). En ella se dibujaron dos figuras:

1\. Un rectángulo de color rojo (RGB: 220, 50, 50) ubicado en las coordenadas \[15, 15, 55, 55].

2\. Un círculo de color verde (RGB: 50, 200, 80) ubicado en las coordenadas \[65, 65, 105, 105].



#### (b) Comparación de Escala de Grises

Para el píxel de fondo localizado en la coordenada (5, 5):

\- Pillow .convert('L'): 30 (valor entero uint8).

\- scikit-image color.rgb2gray() ( 255): 30.33 (valor en coma flotante float64).



La ligera diferencia se debe a que Pillow redondea los valores al entero de 8 bits más cercano, mientras que scikit-image preserva la precisión continua en número flotante.



#### (c) Binarización y Umbral de Otsu

\- Umbral de Otsu obtenido: 0.2104 (equivalente a un nivel de gris de \~53.65 en escala 0-255).

\- Proporción de la imagen por encima del umbral (primer plano / True): 22.22% de los píxeles totales, correspondientes de forma precisa a las regiones donde se dibujaron las figuras geométricas.

