#### use source("https://raw.githubusercontent.com/GildasLepennetier/R-stuff/master/human_to_bits.R") #to load this functions
human_to_bits <- function(x){
	#convertion human_to_bits("5G")
	x = gsub(",",".",x)
	ptn <- "(\\d*(.\\d+)*)(.*)"
	num  <- as.numeric(sub(ptn, "\\1", x))
	unit <- sub(ptn, "\\3", x)             
	unit[unit==""] <- "1" 
	mult <- c("1"=1, "K"=1024, "M"=1024^2, "G"=1024^3)
	num * unname(mult[unit])
}
