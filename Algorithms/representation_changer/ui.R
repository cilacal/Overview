library(shiny)
library(shinydashboard)

ui <- bootstrapPage(
  tags$head(
    tags$style(
      ".title {margin: auto; width: 500px}"
    )
  ), 
  tags$div(class = "title", titlePanel("Number representation changer")),

  hr(),
  fluidRow(
    box(width = 12, title = "Decimal to something else", 
        splitLayout(
          textInput("dec_input", "Decimal representation", ""),
          textInput("base1", "Base", ""),
          textInput("bits", "Bits", "")
        )
    )
  ),
  hr(),
  paste0("Result:"),
  textOutput("result_repr"),
  hr(),
  hr(),
  fluidRow(
    box(width = 12, title = "Something else to decimal", 
        splitLayout(
          textInput("seq", "Other representation", ""),
          textInput("base2", "Base", "")
        )
    )
  ),
  hr(),
  paste0("Result:"),
  textOutput("result_dec"),
  hr(),
  hr()
)