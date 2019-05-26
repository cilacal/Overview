repr_changer <- function(n,base = 2, k=32){
  res <- numeric(0)
  
  if(is.na(n)){
    res <- c(1,rep(0,k-1))
    return(res)
  }
    
  if(abs(n)>(base^(k-1))-1){
    return(print(paste0("It is not possible to represent ",n," with only ",k," bits.")))
  }
  
  if(n==0) res <- rep(0,k)
  
  abs_n <- abs(n)
  while(abs_n > 0){
    new_value <- abs_n%%base
    res <- c(new_value,res)
    abs_n <- abs_n%/%base
  }
  
  res <- c(rep(0,k-length(res)),res)
  if(n < 0) res[1:(max(which(res == 1)) - 1)] <- 1 - res[1:(max(which(res == 1)) - 1)]
  
  return(res)
}
