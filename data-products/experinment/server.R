library(shiny)
x <<- x + 1  #only execute once
y <<- 0

shinyServer(   # each time refresh the page, code here will be executed
  function(input, output) {    
    y <<- y + 1    
    output$text1 <- renderText({input$text1})    
    output$text2 <- renderText({input$text2})    
    output$text3 <- renderText({as.numeric(input$text1)+1})    
    output$text4 <- renderText(y)    
    output$text5 <- renderText(x)  
  }
)