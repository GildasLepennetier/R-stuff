#### use source("/PATH/") #to load this function
is.defined <- function(sym) {
	# find if an object exists, e.g. variable
	sym <- deparse(substitute(sym))
	env <- parent.frame()
	exists(sym, env)
}
