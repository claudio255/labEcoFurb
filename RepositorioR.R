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
baseib <- WDI(country="all", indicator="NY.GDP.MKTP.CD")

basepib2023 <- WDI(country="all", indicator="NY.GDP.MKTP.CD",
                   start= 2023, end= 2023)
