
#http://shiny.rstudio.com/gallery/word-cloud.html


shinyUI(fluidPage(
    # Application title
    titlePanel("US Federal Contracts Awarded FY14"),
    
    sidebarLayout(
        sidebarPanel(
            h4("Subset Data"),
            radioButtons("toggle", "Select type of business:", 
                         org_flags)
            ),
        
        # 
        mainPanel(
          tabsetPanel(
            tabPanel("About", includeMarkdown("about.md")),
            tabPanel("Statistics", htmlOutput("textit")),
            tabPanel("Num Employees", plotOutput("showemployees")),
            tabPanel("Places of Performance (This is Slow!)", plotOutput("main_plot"))
          )
#             h4("Obligated Dollars"),
#             h6("CONUS Map of the Place of Performance"),
#             
#             #plotOutput("main_plot"),
#             
#             h4("Employees within each company"),
# 
#             plotOutput("showemployees"),
#             
#             h4("Various other statistics"),
#             
#             htmlOutput("textit"),
#             
#             h3("The Background:"),
        )
    )
))
