# "Representation changer" of a number

This exercise was a simple introductory task as well, but it was helpful to get familiar with the change from one representation of a number to another one. As algorithmically it was not a big challenge, I have created a [shiny app](<https://shiny.rstudio.com/>) around that. 

This description is for the functions behind the R Shiny app. For the description of the (very basic) application, please refer to its [documentation](shiny_descr.md), where beside an overview of the basic building structures of a Shiny Application, the usage of R scripts in other script is also represented.

## The problem to solve

_Write a function which computes the k-bit two's complement representation of a given integer. Also implement the inverse function.$$^1$$_

The solution for this question helps to get familiar with the following principles:

* changing representations of the number,
* think about all possible edge cases.

## The solution

 ```R
repr_changer <- function(n,base = 2, k=32){
  res <- numeric(0)
  
  if(is.na(n)){
    res <- c(1,rep(0,k-1))
    return(res)
  }
    
  if(abs(n)>(base^(k-1))-1){
    print(paste0("It is not possible to represent ",n," with only ",k," bits."))
    return()
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
 ```

## Breaking down the solution

The function takes two parameters:

* _n_: the number for which we would like to see the binary representation,
* _base_: the selected base of the representation which we would like to
* _k_: the number of bits on which we would like to see the binary representation.

### Checking for edge cases

```R
if(is.na(n)){
    res <- c(1,rep(0,k-1))
    return(res)
  }
    
  if(abs(n)>(base^(k-1))-1){
    print(paste0("It is not possible to represent ",n," with only ",k," bits."))
    return()
  }
  
  if(n==0) res <- rep(0,k)
```

First, we check if the given number is NA. If yes, it should return the following $$k$$-length sequence $$1,0,0,\dots,0$$.

Then, it is checked, whether the number can be represented as two's complement. The task can be only done, if $$n < 2^{k-1}-1$$. 

Furthermore, if the given number $$n$$ is equal to $$0$$, the returned sequence should be a $$k$$-length sequence of $$0$$'s.

### The actual algorithm

```R
abs_n <- abs(n)
while(abs_n > 0){
  new_value <- abs_n%%base
  res <- c(new_value,res)
  abs_n <- abs_n%/%base
}

res <- c(rep(0,k-length(res)),res)

if(n < 0) res[1:(max(which(res == 1)) - 1)] <- 1 - res[1:(max(which(res == 1)) - 1)]
```

As for the negative values one needs to modify the sequence belonging to its absolute value, to get that sequence, we work with the absolute value of that.

The following logic is implemented:

* starting from  the right, every new value of  the sequence is the residuals given by dividing the absolute value of the number by the base ([modulus](<https://www.statmethods.net/management/operators.html>)),
* after adding the new value, the absolute value of the number is updated and set to the result derived by the [integer division](<https://www.statmethods.net/management/operators.html>) of the number with the base.
* These steps are done until the updated absolute number is larger than 0.

As it was allowed to set the number of bits $k$, the required number of $0$'s are put in front of the sequence if the given input was positive and $1$'s in case of negative input.

## Doing the calculation in the other way around 

As the logic is very similar to the script presented above, please refer to the [solution](repr_changer_invers.R) without explanation. However, in case of any question, please feel free to ask! 





_<sup><a name="myfootnote1">1</a>: Disclaimer: the exercise was taken one to one from the Computing I homework sheets of the Quantitative Finance master program of the Business University Vienna..</sup>_
