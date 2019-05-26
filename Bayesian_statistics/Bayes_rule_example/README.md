# Coin changer

I like this introductory exercise, because it represents several important coding principles in a not very straightforward solution, as you will see.

## The problem to solve

_How many different ways can we make change of a given dollar bill, with a set of coins (e.g. 1 dollar with half-dollars, quarters, dimes, nickels and pennies)?_

The solution for this question represents the following principles:

* recursive function
* a way of checking and cleaning the input of the user
* eliminating floating values from a vector flexibly.

## The solution

 ```R
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
 ```

## Breaking down the solution

For reusability and generality of the solution, it was written in a form of a function, which takes two inputs: the _amount_ to make change and the set of available _coins_ for the task.

### Checking the input

```R
input <- as.character(c(amount,coins))
input <- gsub("(.*)(\\.)|([0]*$)","",input)
stopifnot(!any(is.na(input) | is.null(input)))
```

The first part of the solution is responsible to check and clear the input and if it is not applicable, stop the run of the function. 

It does so, by 

* putting both inputs into a vector and change it to character,
* delete every characters which are not suitable,
* stop the function if the remaining vector includes any NA or NULL values.

### Scaling up the input

```R
scale <- 10^max(nchar(input))

amount_ <- scale * amount
coins_ <- scale * coins
```

This is the first tricky step in the solution: one has to scale up the input to avoid float values (and rounding errors, which could cause errors in the recursive step).

This is done by checking the number of digits after the comma in each input. Note, that the input is already put into a character vector, so the nchar() function does this job. By taking the maximum of them and setting the _scale_ variable to this power of 10, we are going to be able to eliminate the floating values. To do so we just have to multiply with this variable the input parameters.

### The recursive main function

```R
in_recursive <- FALSE
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
```

This part uses the observation that the number of ways to change a given amount a using k kinds of coins with denominations d<sub>1</sub>,..., d<sub>k</sub> is the sum of the number of ways to change _a_ without using the first kind of coin and the number of ways to change a - d using all kinds of coins<sup>[1](#myfootnote1)</sup> . 

Therefore, the main function inside of the solution is responsible for the following steps (each point refers to an _if_ statement in the code):

* if the number of available _coins_ is 1, it checks whether the _amount_ can be divided exactly by the given coin, without remainder. If yes, it returns 1 else 0. 
* If the _amount_ is less than 0 or the _amount_ given by the user is 0, it returns 0.
* If the _amount_ is 0, but it was called in a recursive step (checked by the boolean parameter _in_recursive_), it returns 1.
* In any other cases it implements the logic described above by recursively calling this main function, but with the new parameters (i.e. without using the first kind of coin and with the new amount indicated above by a - d) and summing their returned values.



At the end of the solution, this recursive main function is called to return the required value.

```R
coin_changer_main(amount_, coins_, in_recursive = FALSE)
```

## Example

```R 
coin_changer(1, c(0.5, 0.25, 0.1, 0.05, 0.01))
[1] 292
```

By calling the function with the input values given in the task, we get that there are 292 ways to make change of 1 dollar with half-dollars, quarters, dimes, nickels and pennies.





_<sup><a name="myfootnote1">1</a>: Disclaimer: this hint was given in the task.</sup>_
