#### use source("https://raw.githubusercontent.com/GildasLepennetier/R-stuff/master/pastelist.R") #to load this function
pastelist=function(l1,l2,sep=":",collapse=";"){
	# This function paste each elements in lists with each other
	if(length(l1)!=length(l2)){ warning("Error: list are not the same size!") ; return(NA)}
	L_out=list()
	for(index in 1:length(l1)){
		L_out[[index]] = paste( l1[[index]],l2[[index]],sep = sep,collapse = collapse)
	}
	return(L_out)
}
