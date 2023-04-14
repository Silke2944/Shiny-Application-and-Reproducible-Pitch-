
library(shiny)
shinyServer(function(input, output) {
        model <- lm(disp ~ mpg, data = mtcars)

        
        modelpred <- reactive({
                mpgInput <- input$sliderMPG
                predict(model, newdata = data.frame(mpg = mpgInput))
        })
        
        output$plot <- renderPlot({
                mpgInput <- input$sliderMPG
                
                plot(mtcars$mpg, mtcars$disp, xlab = "Miles Per Gallon", 
                     ylab = "Displacement", bty = "n", pch = 16,
                     xlim = c(10, 35), ylim = c(50, 350))
                if(input$showModel){
                        abline(model, col = "pink", lwd = 2)
                }
                legend(25, 250, c("Prediction"), pch = 16, 
                       col = c("pink"), bty = "n", cex = 1.2)
                points(mpgInput, modelpred(), col = "pink", pch = 16, cex = 2)
        })
        
        output$pred <- renderText({
                modelpred()
        })
        
})
