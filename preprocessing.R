# Data wrangling template

# IMPORTING DATA 

getwd()
# to check the current working directory

setwd("/users/karthikmudlapur/desktop/R/1.Project/df")
# to set certain folder as your working directory, dataset to be imported should be present here 

df <- read.csv(file = "xxxxx.csv", header = TRUE, stringsAsFactors = TRUE, na.strings=c(""," ", "NA"))
# to csv file into R

df <- read.spss(file = "xxxxx.sav", use.value.labels = T, to.data.frame = T)
# to import SPSS files
# use.value.labels tells R to recognize data labels of categorical data from spss
# to.data.frame tells R that the object being imported is a data file

remove(df) 
# to remove objects from the environment

head(df)
# first few samples from data

names(df)
# gives the name of all the variables in the dataframe

str(df)
# gives you all the variables and few values for viewing

summary(df)
summary(df$v1)
# to get summary statistics of df or a single variable

df$v10 <- NULL
# to make a variable void and delete the variable

dataset = dataset[4:14]
# to sselect only few varables to continue to modelling

df <- select(df, v1, v2, v3)
# use only a few variables from a dataframe and delete the rest

df <- select(df, -Name, -Gender, -Jobtype)
# to remove only these cols from a huge number of others

df <- rename(df, "Naaaaame" - Name)
# to rename the variable name if at all required

colSums(is.na(df))
# to check for missing values in any of the columns

sapply (df [,sapply(df, is.factor)], nlevels)
# to check the levels of different categorical variables

df [is.na(df$v4), "v4"]
# to check the number of missing records

sapply (df [,sapply(df, is.factor)], nlevels)
# to check the levels of different categorical variables

unique(df$v4)
# to check the unique values in the variables

prop.table(table(df$v4))*100
# to check the %age of both the classes 

prop.table(table(is.na(df$ind_cat_vari),df$tar_var),1)*100
# to check if it is NA in one variable then what will be the prediction

cross.tab <- table(df$cat_var, df$tar_var)
cross.tab
# view in console the table 

df <- df [!duplicated(df), ]
# to remove duplicated rows from the df considering all the columns

df_dup <- nrow(df) - nrow(unique(df))
# to check the number of duplicate values are present in redc dataset. Should be 0.

df <- filter(df, v4 == "1", v10 > 10 )
# to filter according to some category 

df.first10 <- slice(df, 1:10)
# in case we want only a few samples or top 10 among the variables

df <- mutate(df, new_var = ( var4 / var10 ) *100)
# to create a new variable using mutate function in dplyr

df <- mutate (df, new_var_binned = if_else( v4 == 0 , "XXXX", 
                                    if_else( v4 > 0.1 & v4 < 10, "YYYYY", 
                                    if_else( v4 > 10.1 & v4 < 20, "ZZZZZ", 
                                    if_else( v4 >= 20, "AAAA", "N/A" ) ) ) ) ) 
# if-else function to recode the variables into bins - continuous variable into categorical 

df_new <- rbind( df1, df2 )
# to combine df1 and df2 rowwise

df$v4 <- factor(df$v4)
# to convert a variable into a factor

df$v4 = factor(df$v4,levels = c('France', 'Spain', 'Germany'),
                      labels = c(1,2,3)) 
# to assign numerical value to categorical variables

colnames(df)[4] <- "Class_Number"
# change the variable name 

df <- merge(x = df1, y = df2, by = "Common_variable_name", all.x = TRUE)
# merge the two tables to get an overall picture

write.csv(solution, file = 'xxxxx.csv', row.names = F)
# to write file in csv format

df$v4<- gsub("[%]", "", df$v4)
# to remove %age sysmbol from a variable

df$v4 = as.numeric(factor(df$v4,
                          levels = c('France', 'Spain', 'Germany'),
                          labels = c(1,2,3)))
# Encoding the categorical variables as factors

df$tar_var = factor(df$tar_var, levels = c(0, 1))
# Encoding the target feature as factor











