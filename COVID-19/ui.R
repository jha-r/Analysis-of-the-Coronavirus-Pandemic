source("modules/uiMain.R", local = TRUE)
source("modules/uiPlots.R", local = TRUE)
source("modules/uiDataTable.R", local = TRUE)

ui <- fluidPage(
  theme = "styles.css",
  title = "COVID-19 Dashboard",

  tags$style(type = "text/css", ".container-fluid {padding-left: 0px; padding-right: 0px !important;}"),
  tags$style(type = "text/css", ".navbar {margin-bottom: 0px;}"),
  tags$style(type = "text/css", ".content {padding: 0px;}"),
  tags$style(type = "text/css", ".row {margin-left: 0px; margin-right: 0px;}"),
  tags$style(HTML(".col-sm-12 { padding: 5px; margin-bottom: -15px; }")),
  tags$style(HTML(".col-sm-6 { padding: 5px; margin-bottom: -15px; }")),
  navbarPage(
    title       = div("COVID-19 Dashboard", style = "padding-left: 10px"),
    collapsible = TRUE,
    fluid       = TRUE,
    tabPanel("World Map", page_overview, value = "page-overview"),
    tabPanel("Animation",br(),tags$h1('Animation for Spread of Coronavirus Pandemics'),br(),div(tags$video(src="covid19.mp4",
                                    width="800px",
                                    height="600px",                                    type="video/mp4",
                                    controls="controls")),style = "color:red"),
    tabPanel("Plots", page_plots, value = "page-plots"),
    tabPanel("Data", page_fullTable, value = "page-fullTable")

  )
)