# Monte-Carlo simulation

# Table of contents

* [Basics](#basics)
* [Monte Carlo error](#monte carlo error)
* [Ways to decrease MC error](#decreasing the monte carlo error)

# Basics

Goal is to have the solution $$\theta$$ of the following integral:

$$\theta = \int_0^1g(x)dx.$$

Well, for some (a lot) $$g(x)$$ it may not be even possible to compute that analytically. 

Here comes to the picture the following observation:

$$\theta = E(g(U)) \text{ with } U\sim U(0,1).$$

Which leads us to the following algorithm:

1. First let's have i.i.d. samples $$U_1, U_2, \dots, U_n$$ from $$U(0,1)$$.

2. Then we have our estimator $$\hat{\theta}_n$$ of $$\theta$$ by calculating their mean by $$\hat{\theta}_n = \frac{g(U_1) + g(U_2) + \dots + g(U_n)}{n}.$$

If our wished $$\theta$$ is an integral not bounded to $$0$$ and $$1$$, we just need to recall the following transformation:

$$X_i \leftarrow (b-a)U_i + a$$ for $$U_i \sim U(0,1)$$ to have the $$X$$s distributed on $$U(a,b)$$.  

So the algorithm to generate $$\theta = \int_a^bg(x)dx$$ is

1. We generate $$i \in 1,\dots,n$$ $$U_i \sim U(0,1)$$, transform them to $$X_i \leftarrow (b-a)U_i + a$$ and let $$Y_i \leftarrow g(X_i)$$.

2. We calculate their mean by $$\hat{\theta} \leftarrow \frac{(b-a)\sum_i^n Y_i}{n}.$$

That's it. However, it is easier to imagine by looking at this picture (in this example $$g(x)$$ is referred to as $$f(x)$$): 

![MCIntegration](./MCIntegration.png)7

# Monte Carlo error



# Decreasing the Monte Carlo error

## Antithetic Variates

## Control Variates

## Conditional Monte Carlo

## Importance Sampling



# Disclaimer

This description is based heavily on the study materials provided by [Zehra Eksi-Altay](https://www.wu.ac.at/en/statmath/faculty-staff/faculty/zeksi) for the Financial Engineering class in the summer semester in 2019 within the Quantitative Finance Master Program of the WU University Vienna. The quotes without noting their sources are directly from these materials.