library(openxlsx)
args <- commandArgs(trailingOnly = TRUE)
# NOTE: better to use detox to avoid spaces in file names
# REQUIRED with current version of metascape: sudo chown --recursive $USER:$USER data/
setwd(args[1])
print(paste("Convert all xlsx files in ",getwd(),"to csv"))
FILES=list.files(pattern = ".xlsx$",full.names = T, recursive = T)
#Avoid having the exemple files since can not be used
FILES <- FILES[grep("./example/",x = FILES,fixed=T,invert=T)]
x<-lapply(FILES, function(FILE){
	print(FILE)
	DF<-read.xlsx(FILE)
	NewName=gsub(".xlsx$",".csv",FILE)
	write.csv(DF,NewName,row.names=F,quote=T) #quotes??
	return(FILE)
})



