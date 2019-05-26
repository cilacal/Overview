# Shiny App description - Representation changer

This description serves only to get an overview about the building structures of an R Shiny application through the example of the ["representation changer"](README.md) of a given number.  Besides that, the usage of other R scripts in a given script is also represented.

## UI side

```R
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
```



Other way to create side-by-side input fields:

```R
textInput_sameRow <- function(inputId, label, value = ""){
  div(style = "display:inline-block",
      tags$label(label, `for` = inputId),
      tags$input(id = inputId, type = "text", value = value, class = "input-small"))
}

ui <- bootstrapPage(
  titlePanel("Number representation changer"),

  textInput_sameRow("dec_input",
                    label = "Decimal representation",
                    value = "Enter an integer..."),
  textInput_sameRow("base",
                    label = "Base",
                    value = "Enter the base...")
)
```



## Server side

```R
source("repr_changer_invers.R")
source("repr_changer.R")

server <- function(input, output){
  output$result_repr <- renderText({
    if(!is.na(as.numeric(input$dec_input))){
      if(is.na(as.numeric(input$base1))){
        return("Please provide a value for the 'base' parameter!")
      } else {
          return(repr_changer(as.numeric(input$dec_input), base = as.numeric(input$base), ifelse(!is.na(as.numeric(input$bits)), as.numeric(input$bits), 32)))
      }
    }
  })
  
  output$dec_input <- renderText(return(input$dec_input))
  
  output$result_dec <- renderText({
    if(!is.na(as.numeric(input$seq))){
      if(is.na(as.numeric(input$base2))){
        return("Please provide a value for the 'base' parameter!")
      } else {
        return(repr_changer_inv(input$seq, base = as.numeric(input$base2)))
      }
    }
  })
}
```







