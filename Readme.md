
### The Tweets
This was a pull from http://twitter.com,using a #vegan as a search. All were 
downloaded in a seperate script and written to a \"tweets.csv\" file 

### The Cloud:
The interactive panel only works with the Word Cloud
The subsequent word cloud only shows those terms related to the selected terms

### The Credits:
Some places I went for inspiration (but not all inclusive):
http://shiny.rstudio.com/articles/tabsets.html  
http://onertipaday.blogspot.com/2011/07/word-cloud-in-r.html  
http://www.rdatamining.com/examples/text-mining  
http://stackoverflow.com/questions/15506118/make-dataframe-of-top-n-frequent-terms-for-multiple-corpora-using-tm-package-in  
http://davetang.org/muse/2013/04/06/using-the-r_twitter-package/  

  
# http://download.usaspending.gov/datadownlods/Contracts/988f3e3b/Data_Feed.csv

setwd("./contracts")
x <- read.csv("contracts.csv", nrows=50)
    