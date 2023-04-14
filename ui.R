
library(shiny)
shinyUI(fluidPage(
        titlePanel("Predict Displacement from MPG"),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderMPG", "What is the MPG of the car?", 10, 35, value = 20),
                        checkboxInput("showModel", "Show/Hide Model", value = TRUE),
                ), 
                mainPanel(
                        plotOutput("plot"),
                        h3("Predicted Displacement from Model:"),
                        textOutput("pred"),
                )
        )
))