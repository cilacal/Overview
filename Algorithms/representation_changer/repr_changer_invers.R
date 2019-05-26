repr_changer_inv<-function(vals, base){
  
  if(length(vals) == 1) vals <- c(as.numeric(strsplit(as.character(vals),"")[[1]]))
  
  k <-length(vals)
  result <- 0
  
  if(k>1023) return(print("R cannot display that large value."))
  
  if(max(vals)> base | min(vals) < 0) return(print(paste0("Please give a sequence in the ", base, " representation!")))
  
  if(sum(vals) == 1) return(NA)
  
  if(vals[1]==0){
    # The number if positive if the first value of the sequence is 0
    for(i in k:1) result <- result + vals[k+1-i]*base^(i-1)
  } else {
    # Otherwise the result is negative --> applying the same logic as before
    first_index <- max(which(vals==1)) - 1
    vals[1:first_index] <- 1 - vals[1:first_index]
    
    for(i in k:1) result <- result + vals[k+1-i]*base^(i-1)
    result <- -result
  }
  return(result)
}