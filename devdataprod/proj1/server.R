library(RColorBrewer)

shinyServer(function(input, output, session) {
    
    # Apply variable selection
    selectedData <- reactive({
        iris[, c(input$xcol, input$ycol)]
    })
    
    # Perform clustering
    clusters <- reactive({
        kmeans(selectedData(), input$clusters)
    })
    
    # Select RColorBrewer Palette
    palette <- reactive(function(){
        pal <- brewer.pal(9, input$palette)
    })    
    
    # Render the K-means plot
    output$plot1 <- renderPlot({
        par(mar = c(5.1, 4.1, 0, 1))
        pal <- palette()
        plot(selectedData(),
             col = pal[clusters()$cluster],
             pch = 20, cex = 3)
        points(clusters()$centers, pch = 4, cex = 3, lwd = 3)
    })
    
})