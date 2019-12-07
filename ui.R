library(pacman)
p_load(shiny)

## Define UI for application that draws a histogram
shinyUI(fluidPage(

    ## Application title
    titlePanel("The UCI Forest Fire Data"),

    ## Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            ## Input: Selector for choosing the month ----
            selectInput(inputId = "month",
                        label = "Choose a month:",
                        choices = unique(forestdata$full.month)),
            selectInput(inputId = "variable",
                        label = "Choose a variable:",
                        choices = colnames(forestdata)[c(5:13)])
        ),

        ## Show a plot of the generated distribution
        mainPanel(
            
            tabsetPanel(type = "tabs",
                        tabPanel("Descriptives",
                                        br(),
                                        textOutput("class"),
                                        br(),
                                        plotOutput("plot1") 
                            ),
                        tabPanel("Regression on Burned Area", plotOutput("predict")),
                        tabPanel("Raw Data", tableOutput("table"))
                        )
            
        )
    )
))
