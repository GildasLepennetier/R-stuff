
#### 
# Function to convert for colour name like "blue" to hex colors, with possibility to add alpha chanel 
# This function is NOT a clone of: https://rdrr.io/cran/gplots/man/col2hex.html, but carefull since it is the same name.
col2hex=function(col,alpha=1){return(rgb(col2rgb(col)[1,]/255,col2rgb(col)[2,]/255,col2rgb(col)[3,]/255,alpha=alpha ))} #col2hex( c("gray40","gray50"))
