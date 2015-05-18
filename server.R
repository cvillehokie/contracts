library(datasets)
data(state)
source("./helper.R")

shinyServer(function(input, output) {
    
    transformdata <- reactive ({#subsets UI selected data
        withProgress(message = 'Subsetting in progress',
                     value = 0, {
                         for (i in 1:15) {
                             incProgress(1/15)
                             Sys.sleep(0.05)
                         }
                     })
        
        df[df[,find_sub(input$toggle)],]
    })
    
    #Displays map of where obligated funds are being spent
    output$main_plot <- renderPlot ({
        data<-transformdata() #subsets UI selected data
 
        #combine dollars obligated by state
        aggdata<- aggregate(data$dollarsobligated, 
                            by=list(data$state), 
                            FUN=sum, 
                            na.rm=FALSE)
        
        my_title <- paste(input$toggle, " Contract Winners")
        
        colnames(aggdata) <- c("state", "obligated")
        
        aggdata$perc <- aggdata$obligated / sum(aggdata$obligated)
        
        
        percent_map(var=aggdata$obligated, 
                    percents=aggdata$perc, 
                    color="darkgreen", 
                    legend.title="States with the Most Dollars",
                    thetitle=my_title
                    )
    })
    
    output$textit <- renderUI({
        data<-transformdata() #subsets UI selected data
        
        title <- paste("<h4>", input$toggle, 
                       " Contract Winners", "</h4>")
        
        ####dollar data
        str1 <- paste("<b>","Dollars Obligated for","</b>")
        str2 <- paste("Mean: ",
                           summary(data$dollarsobligated)[4],
                           ", Median: ",
                           summary(data$dollarsobligated)[3])
        str_doll <- paste(str1, str2, sep = '<br/>')
        
        ####empl data
        str1 <- paste("<b>","Number of Employees","</b>")
        str2 <- paste("Mean: ",
                           summary(data$numberofemployees)[4],
                           ", Median: ",
                           summary(data$numberofemployees)[3])
        str_empl <- paste(str1, str2, sep = '<br/>')
        HTML(paste(title, str_doll, str_empl,  sep = '<br/>'))
        
        })
   
   output$showemployees <- renderPlot ({
       data<-transformdata() #subsets UI selected data

       my_title <- paste(input$toggle, " Contract Winners")
       
       g <- hist(data$numberofemployees,
                 breaks=20,
                 col="red",
                 xlab = "Number of Employees",
                 main=my_title
        )
       
       xfit <- seq(min(data$numberofemployees), 
                   max(data$numberofemployees))
       yfit <- dnorm(xfit, 
                     mean=mean(data$numberofemployees), 
                     sd=sd(data$numberofemployees))
       yfit <- yfit*diff(g$mids[1:2])*length(data$numberofemployees)
       lines(xfit, yfit, col="blue", lwd=2)

   })
})

