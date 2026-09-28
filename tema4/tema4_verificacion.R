library(tidyverse)

df <- read_csv("estudiantes.xls")

glimpse(df)
colSums(is.na(df))

# Limpieza
df_limpio <- df %>%
  drop_na(nota) %>%
  mutate(asistencia_pct = replace_na(asistencia_pct, mean(asistencia_pct, na.rm = TRUE)))

# Verificar que no queden NA
colSums(is.na(df_limpio))

# Promedio de nota 
promedio_por_curso <- df_limpio %>%
  group_by(curso) %>%
  summarise(promedio_nota = mean(nota))

print(promedio_por_curso)

# Guardar resultado
write_csv(df_limpio, "estudiantes_limpio_R.csv")

