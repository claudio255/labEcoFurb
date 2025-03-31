#install.packages("WDI")
library(WDI)
WDIsearch('gdp')

#GDP (current US$)(NY.GDP.MKTP.CD)

#Baixar os dados do PIB 
#Tudo que é produzido em um País/Estado/Municipio
#Em um determinado periodo

#GDP (current US$)(NY.GDP.MKTP.CD)
#Gross Domestic Product (GDP) Em dólares norte-americano
#Codigo NY.MKTP.CD

COD_GDP <- WDIsearch('gdp')
#É importante procurar pelo proprio site do Banco Mundial,
#é mais eficiente

#Com o código, vamos baixar os dados

options(scipen= 999) #ajustar numeros(notação cientifica)

#Dados em Painel
dadospib <- WDI(country="all", indicator="NY.GDP.MKTP.CD")

#Corte Transversal
dadospib2023 <- WDI(country="all", indicator="NY.GDP.MKTP.CD",
                   start= 2023, end= 2023)

#Serie temporal
dadospibbr <- WDI(country = 'BR',
                  indicator = 'NY.GDP.MKTP.CD')

#Fazer Graficos
#gglot2 (faz parte do pacote tidyverse)

#install.packages("tidyverse")
library(tidyverse)

#Dados em painel
grafpainel <- ggplot(dadospib,
                     mapping = aes(y = NY.GDP.MKTP.CD,
                                   x = year)) +
  geom_point()

print(grafpainel)

#Corte Transversal
grafcorte <- ggplot(dadospib2023,
                     mapping = aes(y = NY.GDP.MKTP.CD,
                                   x = year)) +
  geom_line(color = "green")

print(grafcorte)

#Serie temporal
grafserie <- ggplot(dadospibbr,
                    mapping = aes(y = NY.GDP.MKTP.CD,
                                  x = year)) +
  geom_line(color = "blue")

print(grafserie)

#Exercicio teste
dadospibbr2020 <- WDI(country="BR", indicator="NY.GDP.MKTP.CD",
                    start= 2020, end= 2023)

grafexemplo <- ggplot(dadospibbr2020,
                    mapping = aes(y = NY.GDP.MKTP.CD,
                                  x = year)) +
  geom_line(color = "red")

print(grafexemplo)

#Exercicio 2
dadosriqueza <- WDI(country="BR", indicator="NW.DOW.PC.CD")

grafriqueza <- ggplot(dadosriqueza,
                      mapping = aes(y = NW.DOW.PC.CD,
                                    x = year)) +
  geom_line(color = "purple")

print(grafriqueza)