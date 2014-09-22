# ui.R

shinyUI(fluidPage(
  titlePanel("Impact of US Weather on population health and the economy"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create maps to view the impact of weather on population health and the economy."),
      p(em("Github repository documentation:",a("Github repo",href="https://github.com/shivam11/StormAnalysis"))),
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = c("Fatalities", "Injuries",
                              "Property Damage", "Crop Damage"),
                  selected = "Fatalities"),

      sliderInput("Year", "Year to be displayed:", 
                  min=1950, max=1996, value=1996,  step=1,
                  format="###0",animate=TRUE)
      ),
    
    
    mainPanel( h3(textOutput("year")),
               plotOutput("map"),
               htmlOutput("gvis"))
  )
))