#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)

# Define server logic required to draw a histogram
function(input, output, session) {

    source("../R/int2bin.R", local = TRUE)
    source("../R/generateCards.R", local = TRUE)#
    
    cards<- eventReactive(input$genButton, {
        generateCards(input$ncards, altogether = T)
    })
    
    #Render the data frame as a table
        output$cardmat<- renderTable(cards(), colnames = F)

        #Export cards as csv
        #Get data frame containing all cards
        allcards<- reactive({
            generateCards(input$ncards, altogether = T)
        })

        #Export those cards
        output$export <- downloadHandler(
            filename = function(){"MagicWithMaths.csv"},
            content = function(fname){
                write.table(allcards(), fname, sep = ",",
                            col.names = F, row.names = F,
                            na = "")
            }
        )

}
