# Data wrangling template

#IMPORTING DATA 

getwd()
#to check the current working directory

setwd("/users/karthikmudlapur/desktop/R/1.Project/df")
#to set certain folder as your working directory, dataset to be imported should be present here 

df <-read.spss(file = "xxxxx.sav", use.value.labels = T, to.data.frame = T)
# to import SPSS files
#use.value.labels tells R to recognize data labels of categorical data from spss
#to.data.frame tells R that the object being imported is a data file

remove(df) 
# to remove objects from the environment

names(df)
#gives the name of all the variables in the dataframe

str(df)
#gives you all the variables and few values for viewing

summary(df)
summary(df$v1)
# to get summary statistics of df or a single variable

