library(shiny)
library(ggplot2)

# User Interface

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "alpha",
        label = "Signifikanzniveau (einseitig)",
        min = 0.001,
        max = 0.1,
        value = 0.05,
        step = 0.001
      ),
      numericInput(
        inputId = "mu_0",
        label = "Erwartungswert",
        value = 0),

      numericInput(
        inputId = "mu_1",
        label = "Stichprobenmittelwert",
        value = 0.5,
        step = 0.25
      ),
      numericInput(
        inputId = "sd",
        label = "Populations-Standardabweichung",
        value = 1,
        min = 0
      ),
      sliderInput(
        inputId = "n",
        label = "Stichprobengröße n",
        min = 30,
        max = 1000,
        value = 43,
        step = 1
      )
    ),
    mainPanel(
      plotOutput(
        outputId = "p"
      ),
      tableOutput(
        outputId = "power"
      )
    ),
  )
)

### Function definitions

# Standard error

.se <- function(sd, n) {
  sd / sqrt(n)
}

# Effect Size
.delta <- function(mu_0, mu_1, population_sd) {
  (mu_1 - mu_0) / population_sd
}

.mu_1 <- function(delta, mu_0, population_sd) {
  .delta * population_sd + mu_0
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
    mu_0 = 0,
    mu_1 = 2.5,
    se = 1,
    xlim = c(mu_0 - 5 * se, mu_1 + 5 * se),
    ylim = dnorm(mu_1, mean = mu_1, sd = se) * c(-0.025 , 1.15),
    detail = 800) {

  z_krit <- qnorm(1 - alpha, mean = mu_0, sd = se)

  ggplot() +
    stat_function(geom = "area",
                  fill = 7,
                  alpha = .4,
                  fun = .pshade,
                  args = list(min = xlim[1], max = z_krit, mean = mu_1, se = se),
                  n = detail) +
    stat_function(geom = "area",
                  fill = "4",
                  alpha = .4,
                  fun = .pshade,
                  args = list(min = z_krit, max = xlim[2], mean = mu_0, se = se),
                  n = detail) +
    stat_function(geom = "area",
                  fill = "2",
                  alpha = .4,
                  fun = .pshade,
                  args = list(min = mu_1, max = xlim[2], mean = mu_0, se = se),
                  n = detail) +
    geom_vline(xintercept = c(mu_0, mu_1), color = c(4, 7), linetype = "dashed") +
    geom_vline(xintercept = z_krit, color = "red" ) +
    geom_text(aes(x = mu_0, y = 0.91 * ylim[2]),
              label = "kein Effekt") +
    geom_text(aes(x = mu_1, y = 0.98 * ylim[2]),
              label = "beobachteter\nEffekt") +
    geom_function(fun = dnorm, args = list(mean = mu_0, sd = se), n = detail) +
    geom_function(fun = dnorm, args = list(mean = mu_1, sd = se), n = detail) +
    xlim(xlim) +
    ylim(ylim) +
    theme_bw() +
    ylab("Wahrscheinlichkeitsdichte") +
    xlab("Mittelwerte")
}
.shade_plot(se = 10, mu_0 = 100, mu_1 = 120, detail = 1000)


# Calculation of effect size, p value, power und beta
.power <- function(alpha = 0.05, mu_0 = 0, mu_1= 2.5, se = 1, n = 100, population_sd = 10){
  z_krit <- qnorm(1 - alpha, mean = mu_0, sd = se)
  beta <- pnorm(z_krit, mean = mu_1, sd = se)
  p <- 1 - pnorm(mu_1, mean = mu_0, sd = se)
  delta <- .delta(mu_0, mu_1, population_sd)
  output <- data.frame(
    "Cohen's d" = delta,
    p = p, beta = beta,
    Power = 1 - beta
  )
  return(round(output, digits = 4))
}

### Server logic

server <- function(input, output){
  output$p <- renderPlot(
    {
      se <- .se(input$sd, input$n)

      .shade_plot(
        alpha = input$alpha,
        mu_0 = input$mu_0,
        mu_1 = input$mu_1,
        se = se)
    }
  )
  output$power <- renderTable(
    .power(
      alpha = input$alpha,
      mu_0 = input$mu_0,
      mu_1 = input$mu_1,
      se = .se(sd = input$sd, n = input$n),
      population_sd = input$sd
    )
  )
}

# obligatory to create the output
shinyApp(ui, server)
