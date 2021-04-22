excel_indexes<-function(x){
	"excel_indexes('AA') ; excel_indexes(26)"
	EXCEL<-data.frame(col_letter=c(LETTERS, unlist(lapply(LETTERS, function(x){ paste0(x,LETTERS) } ))))
	EXCEL$col_number=1:nrow(EXCEL)
	if(is.numeric(x)){return( EXCEL[EXCEL$col_number==x,"col_letter"] )}
	if(is.character(x)){return( EXCEL[EXCEL$col_letter==x,"col_number"] )}
	return()
}
