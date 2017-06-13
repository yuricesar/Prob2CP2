library(shiny)
library(tidyverse, warn.conflicts = F)
library(highcharter)
library(plotly)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Avaliação episódios"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        "episodios",
        "Filtrar pelo intervalo de episódios",
        min = 0,
        max = 700,
        value = c(0, 700)
      ),
      selectInput("filtros", "Séries", c(dados$series_name), selected = "13 Reasons Why", selectize = TRUE, multiple = TRUE)
    ),
    
    # Show a plot of the generated distribution
    # Main Panel
    mainPanel(
      tabsetPanel(type="tab", 
                  tabPanel("Plot", plotlyOutput("myhist"))
                  
      )
      
    )
    
  )
))
