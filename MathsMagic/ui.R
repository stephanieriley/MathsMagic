#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Magic with Maths!"),

    # Sidebar with a numeric input for number of cards required
    sidebarLayout(
        sidebarPanel(
            numericInput("ncards", "Number of cards:", 3, min = 3, max = 10),
            actionButton("genButton", "Generate"),
            
            h4(),
            p("At Christmas, lucky individuals might find a surprise waiting in their Christmas crackers. Besides the usual mini deck of cards, micro pen and tiny book, the luckiest of the bunch can find themselves with a magic trick. One of which is the", tags$b("Mystery Calculator"),"."),
            p("For this trick, the 'magician' holds out a set of cards like the ones below."),
            p("The 'magician' asks the unsuspecting friend or family member to pick a number on one of the cards. They then show each card and ask which ones contain the number that they are thinking of. The 'magician' can then", tags$s("magically"), " mathematically determine what number their friend or family member was thinking."),
                
            h4("Behind the magic curtain"),
            p("The so-called magician keeps the cards that contain the number that their victims are thinking of to the side. They then sum the first number of each card together, to guess the number."),
            p(tags$i("How does it work?"), " The answer is binary numbers!"),
                    
            h4("Do the trick yourself"),
            p("If you want to impress people with this trick, this Shiny app will generate as many (or as few) cards as you would like."),
            
            p("The code is available ", tags$a(href="https://github.com/stephanieriley/MathsMagic", "here."))
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
