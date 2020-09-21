#### use source("https://raw.githubusercontent.com/GildasLepennetier/R-stuff/master/correct_dist_matrix_hamming.R") #to load this functions
correct_dist_matrix_hamming=function(dist_mat, replace="auto",quiet=F){
	# This function take a distance matrix using hamming distance and avoid having Infinite distances because of impossible comparison 
	# This happens when the sequeces does not have the same length.
	# Exemple: require(stringdist) ; d_hamming = stringdistmatrix(a = c("AA","AAA","AAB"), b = c("AA","AAA","AAB"), method = "hamming",useNames ="strings") #edit distance
	if(replace=="auto"){
		replace = max( dist_mat[dist_mat!=max(dist_mat)]) + 1 # avoid having giant distances
	}
	if(any(dist_mat==Inf)){
		if(!quiet){print(paste("Infinite detected in dist matrix (hamming?), will crash the hclust, replacing by",replace))}
		dist_mat[ dist_mat==Inf ] <- replace
	}
	return(dist_mat)
}


