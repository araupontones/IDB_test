server<- function(input, output){
  source("R/2.carpintery.R")
  
  
  output$txt_cuenta_casos <- renderUI({
    
   
    HTML(paste('<h2> Se han registrado', txt_total_casos, ' casos en el sistema</h2>'))
    
    #txt_total_casos
    
  })
  
  output$explicacion_criterios <- renderUI({
    
    
    HTML(paste('<p>', txt_explicacion_chart_criterios,'</p>'))
    
    #txt_total_casos
    
  })
  
  
  output$explicacion_monitoria <- renderUI({
    
    
    HTML(paste('<p>', txt_explicacion_chart_monitoria,'</p>'))
    
    #txt_total_casos
    
  })
  
  
  
  output$criterios <- renderPlot({
    
    chart_criterios
  })
  
  output$monitoria <- renderPlot({
    
    chart_monitoria
  })
  
}