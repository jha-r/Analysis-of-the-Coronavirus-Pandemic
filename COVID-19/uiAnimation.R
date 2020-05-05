body_plots1 <- dashboardBody(
 
      tags$video(src="covid19.mp4",
                width="500px",
                height="350px",
                type="video/mp4")

)

page_animation <- dashboardPage(
  title   = "Animation",
  header  = dashboardHeader(disable = TRUE),
  sidebar = dashboardSidebar(disable = TRUE),
  body    = body_plots1
)