## Shiny user interface routine interact with users.
## It accepts user input, request for the necessary service to server,
## then provides output to users.

library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Galton's Height Data - see Documentation panel for how to use"),

## sidepanel provides control mechanisms along with information

  sidebarPanel(
    h3('Plot 1 panel control'),
    h4('select button below'),
    radioButtons('plot.type', 'Parent v. Child (select plot type)',
                 c(Plain = 'plain',
                   Jitter = 'jitter',
                   Sunflower ='sunflower')),
    checkboxGroupInput("id2", "Checkbox",
                       c("Value 1" = "1",
                         "Value 2" = "2",
                         "Value 3" = "3")),
    dateInput("date", "Date"),
    h4('======================'),
    h3('Plot 2 panel control'),
    h4('Click Plot 2 panel'),
    radioButtons('select', 'Parent or Child (select one)',
                 c(Parent = 'parent',
                   Child = 'child')),  
    radioButtons('color.his', 'Histgram color',
                 c(Green='green',
                   Blue = 'blue',
                   Yellow='yellow'),
                 ','),
    sliderInput('breaks', 'Histgram breaks',value = 10, min = 6, max = 20,
                step = 2)
  ),

## mainpanel routine gives overall structures, here, "tab" based panel gives users
## familiar pane mechanism where overlapped panes provide various information to users

  mainPanel(
    tabsetPanel(type = "tabs",
                tabPanel("Plot1", plotOutput("bothplot"), verbatimTextOutput("oid"), verbatimTextOutput("odate")),
                tabPanel("Plot2", plotOutput("newHist")),
                tabPanel("Summary", verbatimTextOutput("summary")),
                tabPanel("Table", tableOutput("table")),
                tabPanel("Documentation", verbatimTextOutput("doc1")
  )
    )
      )
))