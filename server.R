## server is waiting for the client's request, and provides services requested
## This project uses galton data.

library(UsingR)
data(galton)
shinyServer(
  function(input, output) {

## function to plot parent v. child height, user can choose the type of plot
    
    currentPlot <- function() {
    if (input$plot.type == 'plain') {plot(galton)} 
      else if (input$plot.type == 'jitter') {plot(jitter(child,5) ~ jitter(parent,5),galton)}
       else {sunflowerplot(galton)}
    }
    
## function to plot either child height or parent height histogram
    
    currentHist <- function() {
      ifelse ((input$select == 'parent'),
              (hist(galton$parent, breaks = input$breaks, xlab = 'Parent Height', col = input$color.his, main = 'Histogram')
              ),
              (hist(galton$child, breaks = input$breaks, xlab = 'Child Height', col = input$color.his, main = 'Histogram'))
    )}
    
    output$bothplot <- renderPlot(currentPlot()) ## rendering parent v child plot
    
    output$oid <- renderPrint({input$id2}) ## rendering checkbox status
   
    output$odate <- renderPrint({input$date}) ## rendering date information
    
    output$newHist <- renderPlot(currentHist()) ## rendering histogram of either parent or child height histogram
      
    output$summary <- renderPrint({  ## rendering summary of the data
      summary(galton)
    })
    output$table <- renderTable({    ## rendering raw data
      data.frame(galton)
    })
    output$doc1 <- renderText("This is the document for how to use the software.
    This produtct is divided into several panels. The first panel displays Parent v. Child height.
    The second panel displays either Parent or Child height. The third panel displays summary statistics.
    The fourth panel displays entire data. The side panel has all the necessary controls.
    The control panel provides ways to control functionality of related panel.
    The Plot 1 panel control allows users to choose how to view data.
    The plain plot type displays dot plot only. In order words, it does not show the desnity of dots.
    Sunflower shows density of dots. The bigger the sunflower is, the denser the dot is.
    Jitter plot reflects jittering phenomenon of data. No dot is fixed in a location. It is likely to jitter.
    The checkbox can be customize to the need. Unlike radio button where only one can be chosen, Checkbox allows multiple selection.
    Panel 2 control allows users to choose a histogram of frequency, either Parent or Child height.
    The histogram color and break control allows users to choose the the color and number of breaks of the histogram.
    Summary panel displays summary statistic of data.
    The Table panel opens the raw data.
    Documentation panel show the document.")
  }) 