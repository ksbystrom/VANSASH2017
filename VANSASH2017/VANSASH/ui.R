#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
#

library(shiny)
library(dplyr)
library(png)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Canucks Gameplay Slider and Heatmap - VANSASH 2017"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput(inputId = "timeChoice",
                   label = "Time Slider:",
                   min = 10,
                   max = 72000,
                   value = 11300),
    selectInput(inputId = "gameChoice",
                label = "Choose a Game",
                choices = uniqueGames,
                selected = "D6X7-PHD6"),
    tableOutput("gameStats")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("puckPlot")

       
    )
  )
))
