#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)

# ## Check if the data exists and download if not.
# if(!file.exists("forestfires.csv")){
#     download.file(url="https://archive.ics.uci.edu/ml/machine-learning-databases/forest-fires/forestfires.csv", "forestfires.csv" )}
## Read in the datafile
forestdata <- read.csv("forestfires.csv", header = TRUE, sep = ",",stringsAsFactors=FALSE) %>%
   mutate(full.month = month.name[match(month, tolower(month.abb))],
          area = as.numeric(area),
          temp=as.numeric(temp))
## Description of the data can be found here: https://archive.ics.uci.edu/ml/datasets/Forest+Fires

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$plot1 = renderPlot({
        barplot(forestdata[which(forestdata$full.month == input$month), which(colnames(forestdata) == input$variable)],
                main=paste("Bargaph of", input$variable, "in", input$month),
                xlab=input$variable)
    })
    
    output$predict = renderPlot({
        ggplot(forestdata[which(forestdata$full.month == input$month), ], aes_string(x = input$variable, y = "area")) +
            geom_point(na.rm = TRUE) +
            geom_smooth(na.rm = TRUE, 
                        method = "lm",
                        se = FALSE) +
            theme_bw()
    })
    output$class <- renderText(
        paste("Class of the selected variable is" , class(forestdata[, which(colnames(forestdata) == input$variable) ]))
    )
    
    output$table <- renderTable({
        forestdata[which(forestdata$full.month == input$month), which(colnames(forestdata) != "full.month")]
    })
    
})




