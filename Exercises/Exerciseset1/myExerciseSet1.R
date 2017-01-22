#Exercise Set 1

#Check and change current working directory
getwd()
setwd("Exercises/ExerciseSet1")
getwd()

#list all files in the working directory
list.files()

#source data - ticker SPY and APPL 
source("helpersSet1.R")
source("dataSet1.R")

#Can you find some interesting finance related R package or github repository?
#loads of finance functions including option pricing / sharpeRatio
# https://cran.r-project.org/web/views/Finance.html

#returns no of rows
nrow(StockReturns)

#Returns dates from 2001 till date, use [] for specific value [1] for first, [4033] for last
rownames(StockReturns)[1772]

#get last 3 rows
tail (rownames(StockReturns),3)

#below command assigns comma seperated row value for column name SPY
SPY = StockReturns[,"SPY"]
pnl_plot(SPY)

AAP = StockReturns[,"AAPL"]
pnl_plot(AAP)


#Questions

# Q1> Notice that the code also downloads the returns of Apple during the same period. Can you explain where this is done in the code (including the .R files used)?
#Downloaded into the Variable StockReturns under column header APPL. File contains Comma seperated values {Date,SPY,AAPL}
#Filename: dataSet1.R / All data seems to be in DataSet1.Rdata file

# Q2> What are the cumulative, average daily returns, and the standard deviation of the daily returns of Apple in the same period?

# Cumulative return of APPL - No 2 suggests column 2 which is AAPL, parameter 1 in round suggests round up to 1 decimal point
round(100*sum(StockReturns[,2]),1)
#or
round(100*sum(StockReturns[,"AAPL"]),1)

#average daily return with round up to 3 decimal points
round(100*mean(StockReturns[,2]),3)
#or
round(100*mean(StockReturns[,"AAPL"]),3)

#standard deviation upto 2 decimal points
round(100*sd(StockReturns[,2]),2)
#or
round(100*sd(StockReturns[,"AAPL"]),2)

# Q3> (Extra points) What if we want to also see the returns of another company, say Yahoo!, in the same period? Can you get that data and report the statistics for Yahoo!'s stock, too?
#Yes YHOO is yahoo symbol
#Changed dataSet1.R library to include YHOO in symbol list

# Cumulative return of YHOO 
round(100*sum(StockReturns[,"YHOO"]),1)

#average daily return with round up to 3 decimal points
round(100*mean(StockReturns[,"YHOO"]),3)

#standard deviation upto 2 decimal points
round(100*sd(StockReturns[,"YHOO"]),2)

YHO = StockReturns[,"YHOO"]
pnl_plot(YHO)


#Part 2 -- Study of M A T R I X ..

#type of variable
class(StockReturns)

# Returns rows and columns
dim(StockReturns)

# Returns no of rows
nrow(StockReturns)

# Returns no of columns
ncol(StockReturns)

#Returns rows from 1 to 4
StockReturns[1:4,]

# Returns top 5 rows
head(StockReturns,5)

# Return last 5 rows
tail(StockReturns,5) 

#apply portfolio
portfolio = apply(StockReturns,1,mean)
names(portfolio) <- rownames(StockReturns)
pnl_plot(portfolio)

#Transposed data
transposedData = t(StockReturns)

dim(transposedData)
nrow(transposedData)
ncol(transposedData)

help(apply)
