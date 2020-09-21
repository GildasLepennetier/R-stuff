#### use source("https://raw.githubusercontent.com/GildasLepennetier/R-stuff/master/is.defined.R") #to load this function
is.defined <- function(sym) {
	# find if an object exists, e.g. variable
	sym <- deparse(substitute(sym))
	env <- parent.frame()
	exists(sym, env)
}
