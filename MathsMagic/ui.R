#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Magic with Maths!"),

    # Sidebar with a numeric input for number of cards required
    sidebarLayout(
        sidebarPanel(
            numericInput("ncards", "Number of cards:", 3, min = 3, max = 100),
            actionButton("genButton", "Generate")
        ),

        # Show the cards required for the trick and give option to export
        mainPanel(
            # Display the cards
            tableOutput("cardmat"), 
            
            # Button to export the cards
            downloadButton("export", "Export to csv")
        )
    )
)
