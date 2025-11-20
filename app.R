#Esto va a cargarse en la rama feat1 
# La idea es explorar una funcionalidad nueva, sin comprometer 
# el estado del proyecto en main.

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("La vieja y confiable data de géisers"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Cantidad de bins:",
                        min = 1,
                        max = 60,
                        value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Tiempo para la próxima erupción (en minutos)',
             main = 'Histograma de los tiempos de espera')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
