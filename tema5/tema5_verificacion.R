library(tidyverse)
library(e1071)

df <- read_csv("estudiantes_limpio_R.csv")

# 1. Medidas descriptivas para 'nota'
media <- mean(df$nota, na.rm = TRUE)
mediana <- median(df$nota, na.rm = TRUE)
desv_std <- sd(df$nota, na.rm = TRUE)
varianza <- var(df$nota, na.rm = TRUE)
q1 <- quantile(df$nota, 0.25, na.rm = TRUE)
q3 <- quantile(df$nota, 0.75, na.rm = TRUE)
iqr <- IQR(df$nota, na.rm = TRUE)

print("Media :", media)
print("Mediana :", media)
print("Desviacion estandar :", desv_std)
print("Varianza :", varianza)
print("Q1 :", q1)
print("Q3 :", q3)
print("IQR :", iqr)

# 2. Skewness y Kurtosis con e1071
skew_e1071 <- skewness(df$nota, na.rm = TRUE)
kurt_e1071 <- kurtosis(df$nota, na.rm = TRUE)

cat("e1071 -> Skewness:", round(skew_e1071, 4), "| Kurtosis:", round(kurt_e1071, 4), "\n")

# 3. Función resumen_estadistico
resumen_estadistico <- function(vector, decimales = 4) {
  v_clean <- na.omit(vector)
  n_val <- length(v_clean)
  media_val <- mean(v_clean)
  mediana_val <- median(v_clean)
  desv_std_val <- sd(v_clean)
  cv_pct_val <- (desv_std_val / media_val) * 100
  
  return(list(
    n = n_val,
    media = round(media_val, decimales),
    mediana = round(mediana_val, decimales),
    desv_std = round(desv_std_val, decimales),
    cv_pct = round(cv_pct_val, decimales)
  ))
}

print(resumen_estadistico(df$nota))

# 4. Función clasificar_dispersion y bucle for
clasificar_dispersion <- function(cv_pct) {
  if (cv_pct < 15) {
    return("Baja")
  } else if (cv_pct >= 15 && cv_pct < 30) {
    return("Moderada")
  } else {
    return("Alta")
  }
}

columnas <- c("nota", "asistencia_pct")
for (col in columnas) {
  resumen <- resumen_estadistico(df[[col]])
  nivel <- clasificar_dispersion(resumen$cv_pct)
  cat(sprintf("Columna '%s': CV = %.2f%% -> Dispersión %s\n", col, resumen$cv_pct, nivel))
}