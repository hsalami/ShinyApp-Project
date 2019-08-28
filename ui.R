library(shiny)


shinyUI(pageWithSidebar(
  
  headerPanel("Central Limit Theorem"),

  sidebarPanel(
    fluidRow(tags$a(href='help.html', target='blank', 'Documentation File')),
    fluidRow(selectInput("dist", "Parent Distribution:", choices = list("Exponential" = 1,"Uniform" = 2),selected = 1),
             uiOutput("rateO")),
    fluidRow(tags$br(),tags$br()),
    fluidRow(
      sliderInput("num","Sample Size:",min=40,max=300,value=100),
      sliderInput("samp","Number of Repetitions:",min=200,max=1000,value=100),
      actionButton("start","Begin"))
    ,width=3),
  
  mainPanel(
    tags$head(tags$style(".shiny-plot-output{height:43vh !important;width:100vh !important}")),
    fluidRow(plotOutput("distPlot"),align="center"),
    fluidRow(plotOutput("plot"),align="center")
    )
  )
)
