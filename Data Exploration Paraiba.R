########## Import libraries
library(dplyr)
library(tidyr)
library(ggplot2)

########## Import data
pb_acidentes_2023 <- read_csv("Data/pb_acidentes_2023.csv")



########## Clean data
### select interesting columns
importante_columns <- c("id", "data_inversa","dia_semana", "horario","br", "km","municipio","causa_acidente","tipo_acidente", "classificacao_acidente","condicao_metereologica","pessoas","ilesos","feridos","feridos_leves","feridos_graves","mortos","veiculos")
acidentes23 <- pb_acidentes_2023[,importante_columns]

### fix special characters
characters_columns <- c("dia_semana", "municipio","causa_acidente","tipo_acidente", "classificacao_acidente","condicao_metereologica")
acidentes23[,characters_columns] <- iconv(acidentes23[,characters_columns], from = "ISO-8859-1", to = "UTF-8")
acidentes23$dia_semana <- iconv(acidentes23$dia_semana, from = "ISO-8859-1", to = "UTF-8")
acidentes23$municipio <- iconv(acidentes23$municipio, from = "ISO-8859-1", to = "UTF-8")
acidentes23$causa_acidente <- iconv(acidentes23$causa_acidente, from = "ISO-8859-1", to = "UTF-8")
acidentes23$tipo_acidente <- iconv(acidentes23$tipo_acidente, from = "ISO-8859-1", to = "UTF-8")
acidentes23$classificacao_acidente <- iconv(acidentes23$classificacao_acidente, from = "ISO-8859-1", to = "UTF-8")
acidentes23$condicao_metereologica <- iconv(acidentes23$condicao_metereologica, from = "ISO-8859-1", to = "UTF-8")

### remove NA
acidentes23$km <- gsub(",",".",acidentes23$km)
acidentes23 <- drop_na(acidentes23,km)

### fix data type 

acidentes23$km <- as.double(acidentes23$km)


########## Visualize data


### how many people die per day
mortos_por_dia <- aggregate(acidentes23$mortos, by=list(acidentes23$data_inversa), sum)
plot(mortos_por_dia)



########## Data Analysis
### Are there more accidents over the weekend than over the week
mortos_por_dia_semana <- aggregate(acidentes23$mortos, by=list(acidentes23$dia_semana), sum)
weekend <- sum(mortos_por_dia_semana$x[c(1,4,6)])
weekdays <- sum(mortos_por_dia_semana$x[-c(1,4,6)])
