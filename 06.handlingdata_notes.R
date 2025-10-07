################################################################################
# HANDLING DATA IN R
################################################################################

################################################################################
# LOADING DATA

# Practical session: managing real data

# # many datasets already stored in R packages
# data()

# packages available to use without loading them in the global environment
# to load a package and make it visible:
data(esoph)

# check the Environment window
# the concept of lazy loading

# # install a contributed package (uncomment if needed)
# install.packages("Epi")

# now load the package and data
library("Epi")
data(births)

# # help page for data objects
# help(births)

# dataset can be stored also in different objects
data(Titanic)
class(Titanic)

# coercion to a data frame
Titanic <- as.data.frame(Titanic)
class(Titanic)

# dataset can be created directly with data.frame() or other functions
# data can also be inputed manually with functions such as scan() or readline()
# luckily, datasets are rarely created manually

################################################################################
# DISPLAYING AND SUMMARISING DATA

# # visualizing a dataset (or other R objects)
# View(births)

# simpler with RStudio: click on the object in the Environment window

# display only the first n lines
head(mtcars, 3)

# or the last n lines
tail(mtcars, 4)

# the structure of an object
str(esoph)

# summarising a variable
summary(births$gestwks)

# summarising the entire object
summary(sleep)

################################################################################
# EXPORTING/IMPORTING DATA IN R FORMATS

# create a mydata sub-folder (if not already existent)
if(!dir.exists("mydata")) dir.create("mydata")

# exporting data in Rdata files
save(births, file="mydata/births.RData")

# note that multiple objects can be added in save()
# alternatively, save the whole session
save.image(file="mydata/mysession.RData")

# a better option: export single objects in RDS format
saveRDS(mtcars, file="mydata/mtcars.RDS")

# import by loading an RData file
load("mydata/births.RData")

# risk of overwriting existing files
# a better option: import explicitly from an RDS file
mtcars <- readRDS("mydata/mtcars.RDS")

# easier in RStudio: use the menu and click on files for exporting/importing

################################################################################
# EXPORTING/IMPORTING DATA IN DIFFERENT FORMATS

# save as text files
write.table(esoph, "mydata/esoph.txt", sep=",", row.names=FALSE)

# the arguments sep and row.names

# alternatively, wrapper functions:
write.csv(esoph, "mydata/esoph.csv", row.names=F)
# or write.delim() for tab-separate files

# basic function for importing tabular data
esoph <- read.table("mydata/esoph.txt", header=TRUE, sep=",")

# argument header and a long list of other arguments (see help)

# export data in Stata format
library(foreign)
write.dta(sleep, "mydata/sleep.dta")

# read.dta for reading Stata files
# also functions for SAS, SPSS, etc

# as usual, simpler in RStudio by using the Import Dataset menu

# note the use of the function read_dta from the package haven
# this provides improved functionalities and works with recent Stata file versions

################################################################################
# DEDICATED EXPORT/IMPORT

# many available packages/functions for importing specific data formats
# here we focus on the package rio

# install the package rio (uncomment if needed)
#install.packages("rio")

# two main advantages:
# single export()/import() functions
# data format inferred by the file extension

# load the package rio
library(rio)

# example: RDS file
mtcars <- import("mydata/mtcars.RDS")

# example: CSV and Stata files
esoph <- import("mydata/esoph.csv")
sleep <- import("mydata/sleep.dta")

# export in SAS format
export(mtcars, "mydata/mtcars.sav")

# convert across formats
convert("mydata/sleep.dta", "mydata/sleep.txt")

# erase the mydata sub-folder
unlink("mydata", recursive=T)
