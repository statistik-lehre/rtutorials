library(shiny)


function(input, output, session) {

  ### Function definitions

  # Standard error

  .se <- function(sd, n) {
    sd / sqrt(n)
  }

  # Effect Size
  .delta <- function(prop0, prop1, population_sd) {
    (prop1 - prop0) / population_sd
  }

  .prop1 <- function(delta, prop0, population_sd) {
    .delta * population_sd + prop0
  }


  # Helper for shading the area under normal dist. curve
  .pshade <- function(x, min, max, mean, se) {
    y <- dnorm(x = x, mean = mean, sd = se)
    y[x < min  |  x > max] <- NA
    return(y)
  }

  # Plotting function
  .shade_plot <- function(
    alpha = 0.05,
    prop0 = 0.5,
    prop = 0.34,
    se = 1,
    detail = 800) {

    z_krit <- qnorm(1 - alpha, mean = prop0, sd = se)

    ggplot() +
      stat_function(geom = "area",
                    fill = "4",
                    alpha = .4,
                    fun = .pshade,
                    args = list(min = z_krit, max = xlim[2], mean = prop0, se = se),
                    n = detail) +
      stat_function(geom = "area",
                    fill = "2",
                    alpha = .4,
                    fun = .pshade,
                    args = list(min = prop1, max = xlim[2], mean = prop0, se = se),
                    n = detail) +
      geom_vline(xintercept = c(prop0, prop1), color = c(4, 7), linetype = "dashed") +
      geom_vline(xintercept = z_krit, color = "red" ) +
      geom_text(aes(x = prop0, y = 0.91 * ylim[2]),
                label = "H0") +
      geom_text(aes(x = prop1, y = 0.98 * ylim[2]),
                label = "beobachteter\nKennwert") +
      geom_function(fun = dnorm, args = list(mean = prop0, sd = se), n = detail) +
      geom_function(fun = dnorm, args = list(mean = prop1, sd = se), n = detail) +
      xlim(xlim) +
      ylim(ylim) +
      theme_bw() +
      ylab("Wahrscheinlichkeit") +
      xlab("Kennwert: Anteil roter Kugeln")
  }
  .shade_plot(se = 10, prop0 = 100, prop1 = 120, detail = 1000)

    output$distPlot <- renderPlot({

    })

}
