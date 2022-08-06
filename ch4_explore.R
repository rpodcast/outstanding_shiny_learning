library(shiny)
library(OSUICode)

# handle dependency
mdb_cdn <- "https://cdnjs.cloudflare.com/ajax/libs/"
mdb_css <- paste0(mdb_cdn, "mdb-ui-kit/3.6.0/mdb.min.css")

mdb_card_dep <- function() {
  htmlDependency(
    name = "mdb-card",
    version = "1.0",
    src = c(href = mdb_cdn),
    stylesheet = "mdb-ui-kit/3.6.0/mdb.min.css"
  )
}

# create the card
my_card <- function(...) {
  cardTag <- my_card(...)
  
  # attach dependencies (old way)
  # htmltools::attachDependencies(cardTag, bs4_card_dep())
  
  # simpler way
  tagList(cardTag, mdb_card_dep())
  
}

### APP CODE ### 

ui <- fluidPage(
  title = "Hello Shiny!",
  tags$style("body {background: gainsboro;}"),
  fluidRow(
    column(
      width = 6,
      br(),
      my_card_with_deps("Card Content")
    )
  )
)

shinyApp(ui, server = function(input, output) { })