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
fluidPage(
  sliderInput("val",
              "Beobachteter Anteil roter Kugeln",
              min = 0,
              max = 1,
              value = 0.34,
              step = 0.01
              ),
  plotOutput("distPlot")
)
