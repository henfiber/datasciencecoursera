Why Let me choose the K-colors is Cool
========================================================
author: henfibr
date: September 28 2015
transition: rotate

About the App
========================================================

- *Let me choose the K-colors!* is an app that showcases the benefits of interactivity in exploratory analysis
- This app is cool because
     - One may rapidly explore potential clusters in different dimensions with just a few clicks
     - One may determine the optimal number of clusters without complicated analysis.
     - The carefully chosen Color Brewer qualitative palettes help visually distinguish clusters
     - [Link to the app](https://henfiber.shinyapps.io/Developing_Data_Products)

The Color Palettes
========================================================

![plot of chunk unnamed-chunk-1](appPitch-figure/unnamed-chunk-1-1.png) 

the available qualitative palettes

Without our interactive app
========================================================

- Without our interactive app one should run the following code for every pair and number of clusters:
<small>

```r
library(RColorBrewer)
selectedData <- iris[, c("Sepal.Length", "Sepal.Width")]
numClusters <- 3
pal <- brewer.pal(9, "Accent")
clusters <- kmeans(selectedData, numClusters)
par(mar = c(5.1, 4.1, 0, 1))
plot(selectedData,
     col = pal[clusters$cluster],
     pch = 20, cex = 3)
points(clusters$centers, pch=4, cex=3, lwd=3)
```
</small>

Example output
======================

![plot of chunk unnamed-chunk-3](appPitch-figure/unnamed-chunk-3-1.png) 

- Sure, anyone can make a function.. But exploration is more fun!

