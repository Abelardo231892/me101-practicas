#---TAREA 2-----

library(tidyverse)

# 1. Reconstrucción del dataset y matriz de correlación
estaciones <- c('Cusco', 'Pisaq', 'Urubamba', 'Ollantaytambo', 'Sicuani', 'Santo Tomás', 'Espinar', 'Calca', 'Anta', 'Paucartambo')
datos <- data.frame(
  temperatura_c = c(18.5, 22.0, 24.5, NA, 16.0, 14.2, 12.8, 21.5, 17.8, 19.2),
  humidity_pct = c(65, 58, 72, 80, 50, 68, 45, 60, 62, 70),
  precipitacion_mm = c(12.4, 5.1, 8.3, 15.0, 2.0, 18.5, 1.2, 6.0, 9.4, 14.1),
  altitud_m = c(3399, 2972, 2870, 2792, 3550, 3660, 3928, 2925, 3337, 2906),
  row.names = estaciones
)

# Imputación de NA con la mediana
num_cols <- c('temperatura_c', 'humidity_pct', 'precipitacion_mm', 'altitud_m')
df_clean <- datos[, num_cols]
for(col in num_cols) {
  df_clean[is.na(df_clean[, col]), col] <- median(df_clean[, col], na.rm = TRUE)
}

matriz_corr <- cor(df_clean)
print(round(matriz_corr, 4))

# 2. Conversión a formato largo con pivot_longer()
corr_larga <- as.data.frame(matriz_corr) %>%
  mutate(Var1 = rownames(.)) %>%
  pivot_longer(cols = -Var1, names_to = "Var2", values_to = "Correlacion")

print(nrow(corr_larga)) # Debe ser igual a 4^2 = 16

# 3. Heatmap con ggplot2 y geom_tile()
ggplot(corr_larga, aes(x = Var1, y = Var2, fill = Correlacion)) +
  geom_tile(color = "white") +
  geom_text(aes(label = round(Correlacion, 2)), color = "black", size = 4) +
  scale_fill_gradient2(low = "blue", mid = "white", high = "red", midpoint = 0, limits = c(-1, 1)) +
  theme_minimal() +
  labs(title = "Matriz de Correlación con ggplot2", x = "", y = "", fill = "Corr") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave("heatmap_ggplot2.png", width = 7, height = 6, dpi = 300)

#---- TAREA 3 ----
library(pheatmap)

# 1. pheatmap CON agrupamiento jerárquico por defecto
pheatmap(matriz_corr, 
         display_numbers = TRUE, 
         number_format = "%.2f",
         color = colorRampPalette(c("navy", "white", "firebrick3"))(100),
         main = "Heatmap pheatmap Agrupado",
         filename = "heatmap_pheatmap_agrupado.png",
         width = 6, height = 5, res = 300)

# 2. pheatmap SIN agrupamiento (cluster_rows = FALSE, cluster_cols = FALSE)
pheatmap(matriz_corr, 
         cluster_rows = FALSE, 
         cluster_cols = FALSE,
         display_numbers = TRUE, 
         number_format = "%.2f",
         color = colorRampPalette(c("navy", "white", "firebrick3"))(100),
         main = "Heatmap pheatmap Sin Agrupar",
         filename = "heatmap_pheatmap_sin_agrupar.png",
         width = 6, height = 5, res = 300)