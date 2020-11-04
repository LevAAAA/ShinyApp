library(shiny)
library(maps)
library(mapproj)

source("helpers.R")
counties <- readRDS("counties.rds")
percent_map(counties$white, "darkgreen", "% White")

shinyServer(function(input, output) {
    output$map <- renderPlot({
        
        if(input$colorPal == "light"){
            colorSet <- c("lightgreen", "grey", "yellow","lightblue")
        }
        if(input$colorPal == "medium"){
            colorSet <- c("green", "black", "orange","blue")
        }
        if(input$colorPal == "dark"){
            colorSet <- c("darkgreen", "red", "darkorange","darkviolet")
        }
        

        args <- switch(input$var,
                       "Percent White" = list(counties$white, colorSet[1], "% White"),
                       "Percent Black" = list(counties$black, colorSet[2], "% Black"),
                       "Percent Hispanic" = list(counties$hispanic, colorSet[3], "% Hispanic"),
                       "Percent Asian" = list(counties$asian, colorSet[4], "% Asian"))
        
        args$min <- input$range[1]
        args$max <- input$range[2]
        
        args$legend <- input$legend
        
        do.call(percent_map, args)
    })
    
})