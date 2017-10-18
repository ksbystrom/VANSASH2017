#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   

  
  # Draw last 10 events on hockey rink

    output$puckPlot <- renderPlot({ 
                                    gameData <- subset(Canucks, game == input$gameChoice)
                                    greaterThan <- subset(gameData, clock >= input$timeChoice) 
                                    n <- length(greaterThan$clock)
                                    last10 <- greaterThan[(n-9):n,]
                                    last <- greaterThan[n,]
                                    plot(1, type="n", xlim=c(0, 200), ylim=c(0, 85),
                                         main = "Event Mapping Throughout a Hockey Game",
                                         xlab = "X Coordinate of Hockey Rink (200 ft Total)",
                                         ylab = "Y Coordinate of Hockey Rink (85 ft Total)")
                                    lim <- par()
                                    rasterImage(img2, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
                                    lines(last10$y_coord_ft~last10$x_coord_ft, type = "l", lwd = 3)
                                    points( last[1,8], last[1,9], pch = 19,lwd = 10)
                                })
  
  #create data table underneath hockey rink
    output$gameStats <- renderTable({
      gameData <- subset(Canucks, game == input$gameChoice)
      table(gameData$player, dnn = c("Player"))
    })
  
})
