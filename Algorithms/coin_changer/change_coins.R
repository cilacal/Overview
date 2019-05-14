coin_changer <- function(amount, coins){
  input <- as.character(c(amount,coins))
  input <- gsub("(.*)(\\.)|([0]*$)","",input)
  stopifnot(!any(is.na(input) | is.null(input)))
  
  scale <- 10^max(nchar(input))

  amount_ <- scale * amount
  coins_ <- scale * coins
  
  coin_changer_main <- function(amount, coins, in_recursive){
    if(length(coins) == 1) return(as.numeric(amount%%coins[1] == 0))
    if(amount == 0 & in_recursive) return(1)
    if(amount < 0 | (amount == 0 & !in_recursive)){ 
      return(0)
    } else{
      in_recursive <- TRUE
      return(coin_changer_main(amount, coins[2:length(coins)], in_recursive) + 
                  coin_changer_main(amount - coins[1],coins, in_recursive))
    }
  }
  
  coin_changer_main(amount_, coins_, in_recursive = FALSE)
}

coin_changer(1, c(0.5, 0.25, 0.1, 0.05, 0.01))

