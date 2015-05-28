# The following code was used to sample 400k contracts into a usable number
#library(dplyr)
#df <- read.csv("./data/contracts.csv", header=TRUE)
#df2 <- sample_n(df, 5000)
#write.csv(df2, file="./data/sample_contracts.csv")
library(markdown)
fname <- "./data/sample_contracts.csv"
#fname <- "./data/contracts.csv"


# The percent_map function in helpers.R takes five arguments:
#     Argument     Input
# var     a column vector from the counties.rds dataset
# color 	any character string you see in the output of colors()
# legend.title 	A character string to use as the title of the plot's legend
# max 	A parameter for controlling shade range (defaults to 100)
# min 	A parameter for controlling shade range (defaults to 0)


df <- read.csv(fname, nrows=-1)

keepers <- c("dollarsobligated",
             "typeofcontractpricing",
             "vendorname",
             "state",
             "placeofperformancecity",
             "pop_state_code",
             "numberofemployees",
             "annualrevenue",
             "womenownedflag",
             "veteranownedflag",
             "minorityownedbusinessflag",
             "nonprofitorganizationflag"
             )
org_flags <- c("All",
           "Minority Owned",
           "Women Owned",
           "Veteran Owned",
           "Non-Profit Organization")


####################################################################

#data cleanup
df <- subset(df, select=keepers)
df$ks <- df$dollarsobligated / 1000 #dollarsobligated in Thousands
df$state<-as.character(df$state)
df <- df[df$dollarsobligated > 0, ] #gets out negative values
df$veteranownedflag <- df$veteranownedflag == "Y"
df$womenownedflag <- df$womenownedflag == "Y"
df$minorityownedbusinessflag <- df$minorityownedbusinessflag == "Y"
df$nonprofitorganizationflag <- df$nonprofitorganizationflag == "Y"
df$all <- TRUE

####################################################################


rm(keepers, fname)