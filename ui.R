#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel(h1("Generate a Normal Distribution")),

    # Sidebar with a slider input for number of bins/samples/mean/deviance
    sidebarLayout(
        sidebarPanel(
            h4(strong("Modify Distribution Parameters"), align="center"),
            sliderInput("n", h5(strong("number of samples:")), min=0, max=1000, value=100),
            sliderInput("mu", h5(strong("mu:")), min=-50, max=50, value=0),
            sliderInput("sigma", h5(strong("sigma:")), min=1, max=5, value=1, step=0.25),
            sliderInput("bins", h5(strong("Number of bins:")), min=5, max=50, value=35)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("Distribution & Sample", align="center"),
            plotOutput("distPlot")
        )
    )
))
