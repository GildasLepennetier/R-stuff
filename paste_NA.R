paste_NA <- function(...,sep=",") {
	# This is a better paste function that deal with NA
	L <- list(...)
	L <- lapply(L,function(x) {x[is.na(x)] <- ""; x})
	ret <-gsub(paste0("(^",sep,"|",sep,"$)"),"",gsub(paste0(sep,sep),sep,do.call(paste,c(L,list(sep=sep)))))
	is.na(ret) <- ret==""
	ret
}
