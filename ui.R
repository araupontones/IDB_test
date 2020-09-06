
library("shinycssloaders")


ui <- fluidPage(
  
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "www/style.css")
  ),
  
  title = "Monitoreo",
  
  h1("Monitoreo de Estándares de Manejo de Complicaciones Obstétricas por Hemorragia"),
  uiOutput("txt_cuenta_casos"),
  
  fluidRow(
    actionButton("boton_link",
                 label = "Registrar un caso nuevo",
                 onclick =  "window.open('http://100.26.142.103/WebInterview/ASHM2BNK/Start', '_blank')")
  ),
  
  hr(),
  
  fluidRow(
  column(6, 
         
         withSpinner(plotOutput("criterios")),
         uiOutput("explicacion_criterios")
         ),
  
  column(6, 
         withSpinner(plotOutput("monitoria")),
         uiOutput("explicacion_monitoria")
  )
  )
  
  
  
)



