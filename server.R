#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- rnorm(input$n, mean=input$mu, sd=input$sigma)
        max <- max(x)
        min <- min(x)
        minX <- min - ((max-min)*0.15)
        maxX <- max + ((max-min)*0.15)
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        ggplot(
            data=data.frame(x), aes(x)
        ) + 
        geom_histogram(
            aes(y=..density..), breaks=bins, col="maroon", fill="900C3F", alpha=0.85
        ) + 
        xlim(c(minX, maxX)) + ylim(c(-0.02, .5)) + geom_density(col=2, size=1) + 
        stat_function(fun=dnorm, args=list(mean=input$mu, sd=input$sigma), size=2.5) + 
        geom_vline(xintercept=input$mu, linetype="dashed", color="black", size=1)

    })

})
