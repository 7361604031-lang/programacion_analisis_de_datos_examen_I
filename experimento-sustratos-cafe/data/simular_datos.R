# Datos SIMULADOS: el experimento es una propuesta y aún no se ha instalado en vivero.
# Se ejecuta una sola vez; las páginas leen el CSV resultante.
set.seed(1508)

sustratos <- c("Tierra agrícola", "Tierra + arena", "Tierra + gallinaza", "Tierra + humus")
codigos   <- c("S1", "S2", "S3", "S4")
medias    <- c(18.5, 17.2, 23.8, 25.6)   # altura esperada a los 90 días (cm)

# DCA: 4 sustratos x 5 repeticiones = 20 unidades, sorteadas en 20 posiciones del vivero
trat <- sample(rep(1:4, each = 5))
datos <- data.frame(
  unidad   = 1:20,
  fila     = rep(1:4, each = 5),
  columna  = rep(1:5, times = 4),
  codigo   = codigos[trat],
  sustrato = sustratos[trat]
)
datos$altura_cm <- round(medias[trat] + rnorm(20, 0, 1.9), 1)

write.csv(datos, "data/cafe_sustratos.csv", row.names = FALSE)
