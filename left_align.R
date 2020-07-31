left_align=function(x, space="."){
	"This function take a vector as input and add spacer (default: .) on the right to right-align characters"
	MAX=max(nchar(x))
	ADD=unlist(lapply(x, function(seq){ paste0( rep( space, MAX-nchar(seq)),collapse = "" ) } ))
	return(paste0( x, ADD ))
}
