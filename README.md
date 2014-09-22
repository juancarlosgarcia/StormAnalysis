---
title       : Storm Analysis
subtitle    : A Shiny App to view the impact of the Weather on the health of the population and the economy
author      : 
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---

## The app
- User can select a type of report
  - Fatalities, this is a report on the total number of fatal accidents
  - Injuries, this is a report on the total number of injuries that occured because of the weather
  - Property Damage, this is a report on the cost due to damages to property
  - Crop Damage, this is a report on the cost due to damages to crop
- User an select the a Year to view the data from different reports
- The map can be annimated by selecting a year and clicking the play button

--- .class #id 

## The Reports

![Report selection](figure/selectreports.png)

--- .class #id 

## Year Selection and Animation

![Year selection](figure/selectyear.png)

--- .class #id 

## The app components

- Can be accessed from [here](https://data-machine.shinyapps.io/StormAnalysis/)
- The [googleVis](http://cran.r-project.org/web/packages/googleVis/) package was used to generate the GeoChart
