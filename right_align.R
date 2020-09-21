# use source("https://raw.githubusercontent.com/GildasLepennetier/R-stuff/master/right_align.R") to load this function
right_align=function(x, space="."){
	"This function take a vector as input and add spacer (default: .) on the left to left-align characters"
	MAX=max(nchar(x))
	ADD=unlist(lapply(x, function(seq){ paste0( rep( space, MAX-nchar(seq)),collapse = "" ) } ))
	return(paste0( ADD, x ))
}
