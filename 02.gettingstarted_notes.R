################################################################################
# GETTING STARTED WITH R
################################################################################

################################################################################
# RUNNING R CODE

# problem: software based on a command-line interface
# the prompt '>'

# we start simple: R as a calculator
3 + 2/3

# R 'evaluates' the 'expression' and returns the result, printed in console
# format of the printed results

# you can also run R from a script
# how to open and save a script
# how to run from scripts: Ctrl+R - Ctrl+Enter (also button), highlighting

# newline for multiple expressions
# otherwise, use semi-colon 
sin(3) ; 3^4

# use of functions (more on this later)

# multi-line expressions should be syntactically complete
# continuation prompt '+' (not shown in notes for clarity)
# until the expression is syntactically complete
# run a portion of the line
# indentation

# multi-line expression
(3 + exp(2)
- 2 *
sqrt(5))

# an expression is evaluated as text if it is quoted
"this is just text"

# while unquoted text is used to refer to objects, as we will see later

# comments using the hash, also at the end of the command
# useful for adding comments in scripts
3.6 + 5 # this is an addition

# # messages from R: error (uncomment to run)
# 3 + "elvis"

# # messages from R: warning (uncomment to run)
# log(-2)

# note: errors stop evaluation, while warnings do not

# command history
# arrow keys and History window
# move commands to console or scripts
# re-run and edit commands

################################################################################
# R OBJECTS

# evaluation of expression is limited for complex computing tasks
# the importance of objects in R

# assignment consists of 3 parts: name, operator, expression
x <- 12 - 9

# also:
12 - 9 -> x
x = 12 - 9
# but latter is discouraged

# also strings
singer <- "Eddie Vedder"

# note difference between name (unquoted) and value (quoted) of an object
# name used as a unambiguous reference to the object

# printing an object
x ; singer

# multiple assignment
y <- w <- 6

# re-assignment
x
(x <- 6)

# the old value is erased
# assignment within round brackets: print

# objects used in expressions
z <- 4
x + z

# silly examples but revealing flexible computing process

################################################################################
# R FUNCTIONS

# all the computations in R are carried out through functions
# what is a function: piece of code which performs a specific task
# syntax seen before with sin() or exp(): somefun(arg1,arg2,arg3,...)
# arguments: expressions or names of previously created objects

# example of a function
obs <- seq(from=3, to=5, by=0.2)
obs

# this function call has 3 arguments
# a function returns a value, here assigned to an object

# unnamed arguments:
seq(3, 5, 0.2)

# order, abbreviations
seq(to=5, 3, 0.2)
seq(t=5, 3, b=0.2)

# default values
seq(5, 10)

#########################################
## Exercises
#########################################

################################################################################
# WORKING DIRECTORY, WORKSPACE, AND SCRIPTS

# the working directory
getwd()
# also shown in RStudio at the top of the Console window
# the Files window

# # set the working directory (uncomment to run)
# setwd("H:/Rcourse")
# # note the use of forward slash '/' (or double back slash '\\')

# easier in RStudio: Session menu and More button in Files window

# environments, global environment, workspace
ls()
# this function return the names of the objects as a sequence of strings

# objects in the global environment also shown in the Environment window

# to remove objects:
rm(x, z)
ls()

# remove all the objects
rm(list=ls())
# or using the Clear All button

# all objects in the global environment lost when R is closed

# # save a set of objects in a specific folder (create folder and uncomment to run)
# x <- y <- 1
# save(x, y, file="myfiles/xy.RData")

# note: the selected path/folder must exist (create it if not)
# the path can start from the working directory (as here)
# alternatively, a full path must be defined

# # save and load a workspace (uncomment to run)
# save.image("myfiles/mysession.RData")

# # load data (uncomment to run)
# load("myfiles/mysession.RData")
# # nb: always add file extension

# easier in RStudio: menus in the Environment window or clicking in Files window

# a script: a text file with extension .R

# # run a whole script (create script and uncomment to run)
# source("files/myscript.R")

# provided the file exists in the folder myfiles in the working directory
# more convenient to keep multiple scripts open
# the Source button

# working directory directly set when open R with .R or .RData files

################################################################################
# R PACKAGES

# all functions and data stored in packages
# packages: coherent functional environments extending the global environment
# 'standard' and 'contributed' packages

# # standard packages are pre-loaded (uncomment to run)
# # the search path
# search()

# load an installed package
library(boot)
# or tick the related box in the Package window

# only standard + 'recommended' package are pre-installed

# # install a package from CRAN (uncomment to run)
# install.packages("maps")

# also through a zip file
# easier using menu in Packages window of RStudio

# # remove packages (uncomment to run)
# remove.packages("maps")

# packages installed in libraries, specific directories in your computer

# # list the library folders (uncomment to run)
# .libPaths()

# # update packages (uncomment to run)
# update.packages()
# # or button in Packages window

#########################################
## Exercises
#########################################
