# How to break the Gibbs sampler - explained

To understand better, why it has happened, let us consider an extended version of an other example of [_Section 3_ of Casella (1992)](#resources).

Let's consider a $$2 \text{ x } 2$$ matrix, representing the _joint distribution_ of two Bernoulli random variables $$X$$ and $$Y$$:

![The joint distribution](/home/lachiee/myProjects/Overview/Bayesian_statistics/Gibbs_sampler/casella1.png)

If we apply Gibbs sampler with the given joint distribution, i.e. drawing first $$X$$ based with probabilities given by the state of the previous $$Y$$, then drawing $$Y$$ based on the state of this drawn $$Y$$, the distribution of $$X$$'s and $$Y$$'s should converge to their _joint probabilities_, represented by the previous table. 

To do so, we first need the _conditional probabilities_ of moving to $$Y$$ from $$X$$, which is the following:

![The conditional probabilities](/home/lachiee/myProjects/Overview/Bayesian_statistics/Gibbs_sampler/casella2.png)

This is straightforward to calculate given that the marginal of $$X$$ and $$Y$$ are respectively given by

$$f_x = [f_x(0) \text{    } f_x(1)] = [p_1 + p_3 \text{    } p_2 + p_4]$$

$$f_y = [f_y(0) \text{    } f_y(1)] = [p_1 + p_2 \text{    } p_3 + p_4]$$.

By let's say, having a _joint distribution table_ of 

$$ \begin{bmatrix}
p_1 & p_2\\ p_3 & p_4 \\
\end{bmatrix}  = \begin{bmatrix}
0.43 & 0.05\\\
0.4 & 0.12 \\
\end{bmatrix} $$

we have the joints 

$$A_{y|x} =  \begin{bmatrix}
\frac{p_1}{p_1 + p_3} & \frac{p_2}{p_1 + p_3}\\ \frac{p_2}{p_2 + p_4} & \frac{p_4}{p_2 + p_4}\\
\end{bmatrix}  = \begin{bmatrix}
0.43 & 0.05\\\
0.4 & 0.12 \\
\end{bmatrix} $$

and 

$$A_{y|x} =  \begin{bmatrix}
\frac{p_1}{p_1 + p_3} & \frac{p_2}{p_1 + p_3}\\ \frac{p_2}{p_2 + p_4} & \frac{p_4}{p_2 + p_4}\\
\end{bmatrix}  = \begin{bmatrix}
0.43 & 0.05\\\
0.4 & 0.12 \\
\end{bmatrix} $$.

By implementing this in $$R$$ , we can see that, indeed, the Gibbs sampler works: 

```R

```



## Now, let's break this simple Gibbs sampler.

As an initial matrix, let us consider an $$n \text{ x } m$$ matrix, representing the joint distribution of the $$2$$ Bernoulli variables $$X$$ and $$Y$$ with $$n$$ and $$m$$ states, respectively:

```R
# Nr of categories of X and Y
n <- 3
m <- 3
  
set.seed(2019)
# Create the joint conditional mmatrix
probs <- runif(n*m-1)/(n*m-1)
probs <- c(probs,1 - sum(probs))
probs <- rep(1/(n*m),n*m)
df <- as.data.frame(matrix(probs, n * m, ncol = n, nrow = m))
colnames(df) <- 1:n
rownames(df) <- 1:m
origin_df <- df
```

The code above gives us a uniform matrix with equal probabilities to move from each $$n$$ states of $$X$$ to each $$m$$ states of $$Y$$ and from there moving to each $$n$$ states of $$X$$ with equal probabilities.

![The origin_df](/home/lachiee/myProjects/Overview/Bayesian_statistics/Gibbs_sampler/uniform_table.png)

![broken_gibbs](/home/lachiee/myProjects/Overview/Bayesian_statistics/Gibbs_sampler/broken_gibbs.png)

## Resources

- Casella, George, and Edward I. George. "Explaining the Gibbs sampler." *The American Statistician* 46.3 (1992): 167-174.
- For this section I used heavily our notes and home assignments of the course _Advanced Topics in Financial Econometrics_ hold by [Gregor Kastner](https://www.wu.ac.at/statmath/faculty-staff/faculty/gkastner) during the summer semester of 2019 in the Quantitative Finance Master Program of the Business University of Vienna.