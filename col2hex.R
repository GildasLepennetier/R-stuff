#### use source("/PATH/") #to load this functions
col2hex=function(col,alpha=NULL,warn=T){ 
# Function to convert for colour name like "blue" to hex colors, with possibility to add alpha chanel 
# This function is NOT a clone of: https://rdrr.io/cran/gplots/man/col2hex.html, but carefull since it is the same name.
if(!is.null(alpha)&warn){warning("Carefull, alpha chanel activated, hex will be 9-char length instead of 7.")};return(rgb(col2rgb(col)[1,]/255,col2rgb(col)[2,]/255,col2rgb(col)[3,]/255,alpha=alpha ))}
