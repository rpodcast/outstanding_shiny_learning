# time to dig for the dependencies ----
library(htmltools)
library(shiny)
library(shinydashboardPlus)

server = function(input, output) { }

# shinydashboardPlus example ui ----
dashboard_ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(),
  shinydashboard::dashboardBody()
)

shinyApp(dashboard_ui, server = server)

dashboard_deps <- findDependencies(dashboard_ui)

my_dashboard_box <- function(title, status) {
  tagList(
    shinydashboardPlus::box(
      title = title, 
      status = status,
      collapsible = TRUE,
      collapsed = TRUE), 
    dashboard_deps
  )
}

# argondash example ui -----
library(argonDash)
argon_ui <- argonDashPage()

argon_deps <- findDependencies(argon_ui)

my_user_image <- function() {
  img_url <- "https://raw.githubusercontent.com/rweekly/image/master/2021/W41/README-example-chart-1.png"
  #img_url <- "https://github.com/rstudio/hex-stickers/blob/master/PNG/gt.png"
  tagList(
    argonR::argonUser(
      title = "Afton Coombs",
      subtitle = "Awesome R Streamer!!!!",
      src = img_url
    ),
    argon_deps
  )
}

# template app ----

library(shiny)

ui <- fluidPage(
  tags$style("body { background-color: gainsboro; }"),
  titlePanel("Shiny with a box"),
  #suppressDependencies("argon"),
  my_user_image()
  #my_dashboard_box(title = "My box", status = "danger"),
)
server <- function(input, output) {}
shinyApp(ui, server)


shinyApp(ui, server = server)