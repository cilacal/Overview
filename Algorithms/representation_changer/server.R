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