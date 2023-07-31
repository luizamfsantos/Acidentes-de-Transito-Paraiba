### Import libraries
library(dplyr)

### Import data
pb_acidentes_2023 <- read_csv("Data/pb_acidentes_2023.csv")



#### Clean data
# select interesting columns
importante_columns <- c("id", "data_inversa","dia_semana", "horario","br", "km","municipio","causa_acidente","tipo_acidente", "classificacao_acidente","condicao_metereologica","pessoas","ilesos","feridos","feridos_leves","feridos_graves","mortos","veiculos")
acidentes23 <- pb_acidentes_2023[,importante_columns]
# fix special characters
characters_columns <- c("dia_semana", "municipio","causa_acidente","tipo_acidente", "classificacao_acidente","condicao_metereologica")
acidentes23[,characters_columns] <- iconv(acidentes23[,characters_columns], from = "ISO-8859-1", to = "UTF-8")
acidentes23$dia_semana <- iconv(acidentes23$dia_semana, from = "ISO-8859-1", to = "UTF-8")
acidentes23$dia_semana <- iconv(acidentes23$dia_semana, from = "ISO-8859-1", to = "UTF-8")
acidentes23$dia_semana <- iconv(acidentes23$dia_semana, from = "ISO-8859-1", to = "UTF-8")
acidentes23$dia_semana <- iconv(acidentes23$dia_semana, from = "ISO-8859-1", to = "UTF-8")


# remove NA

### Visualize data



### Are there more accidents over the weekend than over the week