#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(dplyr)
library(mosaic)
library(shiny)
require(leaflet)
require(sp)
require(RColorBrewer)

# get map data
bangla_map = readRDS('gadm36_BGD_2_sp.rds')

# coloring map based on dataset
bihs_original <- readxl::read_excel('BIHS_household_2011_15.xlsx')
bihs_map <- bihs_original %>% group_by(NAME_2) %>%
    summarise(ave_age = mean(~hhhead_age, na.rm = TRUE), 
              house_owned_prop = prop(~house_owned == "owned"),
              literacy = prop(~hhhead_literate == "can read"),
              phone_prop = prop(~asset_telephone == "Yes")) %>%
    ungroup()


# put variables in map data
final_map <- merge(bangla_map@data, bihs_map, all.x = TRUE)

bangla_map$ave_age <- final_map$ave_age
bangla_map$phone_prop <- final_map$phone_prop
bangla_map$house_owned_prop <- final_map$house_owned_prop

my.map <- leaflet(bangla_map) %>%
    setView(lat = 23.6850, lng = 90.3563, zoom = 6) %>%
    addTiles()

color <-colorQuantile("YlOrRd", NULL, n = 4)
my.map <- my.map %>%
    addPolygons(
        fillColor = ~color(phone_prop),
        weight = 2, #line thickness in pixels
        opacity = 1, #line opacity, 1 is totally opaque
        color = "white", #line color
        dashArray = "3", #type of lines. see help file for addPolygons and link there for more info...this is dotted lines
        fillOpacity = 0.7)

my.map1 <- my.map %>%
    addPolygons(
        fillColor = ~color(house_owned_prop),
        weight = 2, #line thickness in pixels
        opacity = 1, #line opacity, 1 is totally opaque
        color = "white", #line color
        dashArray = "3", #type of lines. see help file for addPolygons and link there for more info...this is dotted lines
        fillOpacity = 0.7)

my.map2 <- my.map %>%
    addPolygons(
        fillColor = ~color(ave_age),
        weight = 2, #line thickness in pixels
        opacity = 1, #line opacity, 1 is totally opaque
        color = "white", #line color
        dashArray = "3", #type of lines. see help file for addPolygons and link there for more info...this is dotted lines
        fillOpacity = 0.7)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Bangladesh BIHS data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout( 
        sidebarPanel(
            selectInput("bihsvar", 
                        "Variable to show on map: ",
                        c("Phone proportions" = "phone_prop",
                          "Average age" = "ave_age",
                          "Literacy" = "hhhead_literate"),
                        )
                    ),

        # Show a plot of the generated distribution
        mainPanel(
           leafletOutput("my.map"),
           leafletOutput("my.map1"),
           leafletOutput("my.map2")
        )
    )
)

# Define server logic required to draw a map
server <- function(input, output) {
    output$my.map <- renderLeaflet({my.map})
    output$my.map1 <- renderLeaflet({my.map1})
    output$my.map2 <- renderLeaflet({my.map2})
}

# Run the application 
shinyApp(ui = ui, server = server)
