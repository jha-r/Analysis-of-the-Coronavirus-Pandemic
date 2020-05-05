server <- function(input, output) {
  sourceDirectory("modules", recursive = TRUE)

  observe({
    data <- data_atDate(input$timeSlider)
  })
}