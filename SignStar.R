#unsatisfied with: https://www.rdocumentation.org/packages/pander/versions/0.6.3/topics/add.significance.stars

#What this function do:
# Add stars if the value is < cuttoff element 1. Add more stars if the value is < cuttof 2.
# There will be a space between the values and the stars (number of significant values constroled by option Signif)
# Do not ocnvert to scientific format by default (option Scienti = F)
SignStar<-function(x,cutoff=c(0.05,0.01,0.001), Signif=4, Scienti=F){
	STR<-paste0(as.character( format(signif(x,Signif), scientific = Scienti) )," ") #R auto convert to scientific format
	for(lim in cutoff){STR = paste0(STR, ifelse(x<lim,yes="*",no="") ) }
	return(gsub(" $","",STR))
}
