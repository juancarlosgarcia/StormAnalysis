# server.R

library(maps)
library(mapproj)

shinyServer(
  function(input, output) {

    datalist <- reactive({switch(input$var, 
                       "Fatalities" = 1,
                       "Injuries" = 2,
                       "Property Damage" = 3,
                       "Crop Damage" = 4)})
    title <- reactive({switch(input$var, 
                                 "Fatalities" = "Population Health (Fatalities)",
                                 "Injuries" = "Population Health (Injuries)",
                                 "Property Damage" = "Economy (Property Damage)",
                                 "Crop Damage" = "Economy (Crop Damage)")})
    myYear <- reactive({
      input$Year
    })
    
    output$year <- renderText({
      paste(title(),"impact in ", myYear()," due to Weather Events")
    })
    
    
    output$gvis <- renderGvis({
      
      d<-datalist()
      myData <- subset(raw.data, (year > (myYear()-1)) & (year < (myYear()+1)))
       if(d==1){
              state.fatalities<-aggregate(FATALITIES~STATE,data=myData,FUN="sum", na.action = na.omit)
       }
      if(d==2){
        state.fatalities<-aggregate(INJURIES~STATE,data=myData,FUN="sum", na.action = na.omit)
       }
      if(d==3){
              state.fatalities<-aggregate(PROPDMG~STATE,data=myData,FUN="sum", na.action = na.omit)
       }
      if(d==4){
              state.fatalities<-aggregate(CROPDMG~STATE,data=myData,FUN="sum", na.action = na.omit)
       }

      data(stateMapEnv)
      names(state.fatalities)[1] <-'state.abb'
      names(state.fatalities)[2] <-'value'
      stateList<-data.frame(state.abb)
      state.fatalities<-merge(stateList,state.fatalities,by.x="state.abb",all=TRUE)
      state.fatalities$state.name <- tolower(state.name[match(state.fatalities$state.abb,  state.abb)])
      state.fatalities[is.na(state.fatalities$value),]$value<-0
      dat2 <- state.fatalities
      gvisGeoChart(dat2, "state.name", "value",options=list(region="US",displayMode="regions",resolution="provinces"))

      
#       myData <- subset(dat, 
#                        (year > (myYear()-1)) & (year < (myYear()+1)))
#       gvisGeoChart(myData,
#                    locationvar="state", colorvar="demVote",
#                    options=list(region="US", displayMode="regions", 
#                                 resolution="provinces",
#                                 width=500, height=400,
#                                 colorAxis="{colors:['#FFFFFF', '#0000FF']}"
#                    ))     
    })
  }
)