# Usando um tema mais clean e moderno
theme_minimal(base_size = 14) + 
  theme(plot.title = element_text(size = 20, face = "bold", color = "darkblue"),
        axis.title = element_text(size = 14, face = "bold"),
        axis.text = element_text(size = 12)) 

# Exibindo o gráfico
print(grafico_esperanca_vida)



# Carregar pacotes necessários
library(WDI)
library(ggplot2)
library(dplyr)

# Coletando os dados de expectativa de vida ao nascer para mulheres de 2000 a 2023 para vários países
dados_esperanca_vida <- WDI(country = "all", indicator = "SP.DYN.LE00.FE.IN", start = 2000, end = 2023)

# Filtrando para garantir que não haja valores faltantes
dados_esperanca_vida <- dados_esperanca_vida %>%
  filter(!is.na(SP.DYN.LE00.FE.IN))  # Remover NA

# Selecionando um subconjunto de países para facilitar a visualização (ex: Brasil, EUA, China, Índia)
# Ajuste para o seu interesse
dados_esperanca_vida_subset <- dados_esperanca_vida %>%
  filter(country %in% c("Brazil", "United States", "China", "India", "Germany", "France"))

# Verificando os primeiros dados para garantir que estão corretos
head(dados_esperanca_vida_subset)

# Criando o gráfico em painel para expectativa de vida ao nascer para mulheres
grafico_painel <- ggplot(dados_esperanca_vida_subset, aes(x = year, y = SP.DYN.LE00.FE.IN)) +
  
  # Adicionando os pontos e linhas de tendência
  geom_point(aes(color = country), size = 2, alpha = 0.7) + 
  geom_line(aes(color = country), size = 0.8, alpha = 0.6) + 
  
  # Facetando por país (cria um painel para cada país)
  #facet_wrap(~ country, scales = "free_y", ncol = 3) +  # Ajustei o número de colunas para 3 (facet_wrap para separa em graficos)
  
  # Renomeando os eixos e título
  labs(title = "Expectativa de Vida ao Nascer para Mulheres (2000-2023)", 
       x = "Ano", 
       y = "Expectativa de Vida (Anos)") + 
  
  # Usando um tema limpo e moderno
  theme_minimal(base_size = 14) + 
  theme(plot.title = element_text(size = 20, face = "bold", color = "darkblue"),
        axis.title = element_text(size = 14, face = "bold"),
        axis.text = element_text(size = 10),
        strip.text = element_text(size = 8, face = "bold"))

# Exibindo o gráfico
print(grafico_painel)


# Carregar pacotes necessários
library(WDI)
library(ggplot2)
library(dplyr)

# Coletando os dados de expectativa de vida ao nascer para mulheres de 2021 para o Brasil e Uruguai
dados_esperanca_vida_brasil_uruguai <- WDI(country = c("BR", "UY"), indicator = "SP.DYN.LE00.FE.IN", start = 2021, end = 2021)

# Verificando os dados coletados
head(dados_esperanca_vida_brasil_uruguai)

# Criando o gráfico de painel para comparar Brasil e Uruguai
grafico_painel <- ggplot(dados_esperanca_vida_brasil_uruguai, aes(x = factor(country), y = SP.DYN.LE00.FE.IN, fill = country)) +
  # Adicionando as barras
  geom_bar(stat = "identity", show.legend = FALSE) + 
  
  # Renomeando os eixos e título
  labs(title = "Comparação da Expectativa de Vida ao Nascer para Mulheres em 2021", 
       x = "País", 
       y = "Expectativa de Vida (Anos)") + 
  
  # Usando um tema moderno e personalizado
  theme_minimal(base_size = 14) + 
  scale_fill_manual(values = c("BR" = "blue", "UY" = "green")) +  # Cores personalizadas para Brasil e Uruguai
  theme(plot.title = element_text(size = 20, face = "bold", color = "darkblue"),
        axis.title = element_text(size = 14, face = "bold"),
        axis.text = element_text(size = 12))

# Exibindo o gráfico
print(grafico_painel)