library(shiny)

# Get the color palettes from RColorBrewer to display as options for the user
getColorPalettes <- function(){
    c(RColorBrewer:::quallist) # other options: RColorBrewer:::seqlist, RColorBrewer:::divlist
}

cols_numeric <- sapply(names(iris), function(x) is.numeric(iris[[x]]))

shinyUI(pageWithSidebar(
    # Application title
    headerPanel("Let me choose the K-colors!"),
    sidebarPanel(
        selectInput('palette', 'Color Palette', getColorPalettes()),
        selectInput('xcol', 'X Variable', names(iris)[cols_numeric]),
        selectInput('ycol', 'Y Variable', names(iris)[cols_numeric],
                    selected=names(iris)[[2]]),
        numericInput('clusters', 'Cluster count', 3,
                     min = 1, max = 9)
    ),
    mainPanel(
        plotOutput('plot1'),
        helpText("This app showcases the benefits of interactivity in exploratory analysis.",
                 "One may rapidly explore potential clusters in different dimensions with just a few clicks.",
                 "Since we did not find any relevant example in the internet, we decided to illustrate also",
                 "the selection of different color Palettes using RColorBrewer!",
                 "\n",
                 "Select the variables you want to plot in the X and Y-axis, which will be also",
                 "the dimensions clustering will take place. The Color Palette widget allows you to select",
                 "one of the qualitative ColorBrewer palettes. You may play around with the number of clusters and try to",
                 "determine the optimal number."),
        h4("Links:"),
        h5(a("Presentation in RPubs", href="http://rpubs.com/henfiber/devdataprod1")),
        h5(a("Code on Github", href="https://github.com/henfiber/datasciencecoursera/tree/master/devdataprod/proj1"))
    )
    
))