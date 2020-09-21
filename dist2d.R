#### use source("https://raw.githubusercontent.com/GildasLepennetier/R-stuff/master/dist2d.R") #to load this functions
dist2d = function(x1,y1,x2,y2){
  #this function calculate the distance between two points in 2d (x1 y1 -> x2 y2)
  return(sqrt( (x2-x1)^2 + (y2-y1)^2 ))
}
