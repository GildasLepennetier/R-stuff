# usefull to create a data.table from vectors of unequal length
# return a list, that can be easily converted to a data.frame if this list is named

# usage exemple: 
# List<-list( 1:5, 1:2, 1:4 )
# names(List)<-LETTERS[1:3]
# as.data.frame(NA_padding(List))
#  A  B  C
#1 1  1  1
#2 2  2  2
#3 3 NA  3
#4 4 NA  4
#5 5 NA NA
NA_padding<-function(List,MaxLength=NULL){
	MaxLength<-max(lengths(List))
	lapply(List,function(x){return( c( x, rep(NA, MaxLength-length(x) ) ) )})
}

# from: https://stackoverflow.com/questions/7196450/create-a-data-frame-of-unequal-lengths
