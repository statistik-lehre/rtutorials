ui <- fluidPage(
  sliderInput("mean", "Arithmetisches Mittel", min = 0, max = 9.5, value = 1, step = 0.1),
  plotOutput("meanplot"),
  actionButton("show", "Lösung anzeigen", class = "btn-default"),
  plotOutput("optimumPlot"),
)

server <- function(input, output) {

  # Prerequisites: Daten müssen noch mal erstellt werden weil shiny app verwendet eigenes environment
  require(ggplot2)
  # sysinfo <- Sys.info()
  # if(sysinfo["sysname"] == "Linux") require(Cairo) #bessere Grafik unter Linux, ist aber nur hörensagen und nicht nötig

  y <- c(1, 1, 9, 3, 6)
  x <- 1:5


  # Lösungsplot
  optimumPlot <-
    ggplot(NULL, aes(x = x, y = y)) +
    geom_point(colour = "purple") +
    geom_hline(yintercept = mean(y), color = "blue") +
    geom_linerange(x = x, ymin = y, ymax = mean(y), linetype = "solid", colour = "red") +
    annotate(geom = "label", x = 4.1, y = 1.5, hjust = 0, col = "red", size = 5,
             label = paste0("Summe der \nResiduen \n= ", round(sum(y - mean(y)), 4))) +
    theme_minimal() +
    labs(x = "x", y = "Beispielwerte", title = "beste Schätzung") +
    coord_cartesian(xlim = c(0, 5.5), ylim = c(0, 9.5), expand = F)

  # Check Button Logic
  observeEvent(input$show, {
    output$optimumPlot <- renderPlot(optimumPlot)
  })

  # Plot
  output$meanplot <- renderPlot({

    ggplot(NULL, aes(x = x, y = y)) +
      geom_point(colour = "purple") +
      geom_hline(yintercept = input$mean, color = "blue") +
      geom_linerange(x = x, ymin = y, ymax = input$mean, linetype = "solid", colour = "red") +
      annotate(geom = "label", x = 4.1, y = 1.5, hjust = 0, col = "red", size = 5,
               label = paste0("Summe der \nResiduen \n= ", round(sum(y - input$mean), 4))) +
      theme_minimal() +
      labs(x = "x", y = "Beispielwerte", title = "beste Schätzung") +
      coord_cartesian(xlim = c(0, 5.5), ylim = c(0, 9.5), expand = F)

  })
}
shiny::shinyApp(ui = ui, server = server)
