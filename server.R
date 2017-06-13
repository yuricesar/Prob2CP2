library(shiny)
library(tidyverse, warn.conflicts = F)
library(readr)
library(highcharter)
library(plotly)

theme_set(theme_bw())

dados <- read_csv(file = "series_from_imdb.csv")

shinyServer(function(input, output) {
  output$myhist = renderPlotly({
    plot_ly(data = dados, 
            x = ~ series_ep, 
            y = ~ UserRating, 
            color = ~as.character(series_name), 
            text = ~paste('Nome: ', series_name,  '
                          Avaliação: ', UserRating,  '
                          Quantidade de votos: ', UserVotes,  '
                          Temporada e Episódio: ', season, 'x', season_ep)) %>% 
      filter(dados$series_name %in% input$filtros, dados$series_ep >= input$episodios[1], dados$series_ep <= input$episodios[2]) %>%
      add_trace(y = ~ UserRating, 
                type = "scatter",
                mode = "lines+markers",
                color = ~as.character(series_name),
                line = list(width = 1), 
                hoverinfo = "text")
  })
  
})