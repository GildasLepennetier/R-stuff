#use source("https://raw.githubusercontent.com/GildasLepennetier/R-stuff/master/standard_error.R") to load this function
standard_error <- function(x) sd(x) / sqrt(length(x))
