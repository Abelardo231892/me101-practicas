# Completa: crea el vector 'notas'
notas <- c(11, 14, 20, 8, 16, 13)

# Completa: muestra el primer y el ultimo elemento
primero <- notas[1]
ultimo <- notas[length(notas)]

print(primero)
print(ultimo)
#_________________________________________________________________
# Completa: promedio, maximo y cantidad de aprobados
promedio <- mean(notas)
maximo <- max(notas)
cantidad_aprobados <- sum(notas >= 10.5)

print(promedio)
print(maximo)
print(cantidad_aprobados)
#___________________________________________________________-____
library(tidyverse)

# Completa: crea el data.frame o tibble 'datos' con las mismas columnas y valores
datos <- tibble(
  nombre = c("Juan","Roberto","Ana","Yeni","Emily"),
  nota = c(11,20,14,35,7),
  asistencia_pct = c(50,70,80,20,100)
)

# Completa: filtra con las dos condiciones combinadas
datos_filtrados <- datos %>% filter(nota >= 10.5 & asistencia_pct >= 70)
print(datos_filtrados)