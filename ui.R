library(shiny)

shinyUI(fluidPage(
    titlePanel("US Census 2010 Visualization"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Create demographic maps with 
        information from the 2010 US Census."),
            
            selectInput("var", 
                        label = "Choose a variable to display",
                        choices = c("Percent White", "Percent Black",
                                    "Percent Hispanic", "Percent Asian"),
                        selected = "Percent White"),
            
            sliderInput("range", 
                        label = "Range of interest:",
                        min = 0, max = 100, value = c(0, 100)),
            
            checkboxInput("legend",
                          label = "Show legend on Map",
                          value=TRUE),
            
            radioButtons("colorPal",
                         label = "Color Palette",
                         choices = c("light","medium","dark"),
                         choiceValues = c("light","medium","dark")
                         )
        ),
        
        mainPanel(plotOutput("map"))
    )   
))







