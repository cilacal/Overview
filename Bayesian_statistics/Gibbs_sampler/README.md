# Gibbs sampler

As it was mentioned in the [Introduction to the Bayesian statistics](../README.md) to derive the posterior can be very cumbersome, if not impossible. However, they can be approximated by _simulation-based methods_, such as

* _Discrete approximations_ of the posterior distribution on a grid of parameters $${\theta_1, \dots, \theta_G}$$ by $$\hat{p}(\theta_i|y) = \frac{p(\theta_i|y)}{\sum_{i = 1}^Gp(\theta_i|y)} = \frac{p(y|\theta_i)p(\theta_i)}{\sum_{i = 1}^Gp(y|\theta_i)p(\theta_i)}$$. However, as this solution works only in very few dimensions with well selected grid and analytically available likelihood, I won't describe it more.

* _Gibbs sampler_, which is a very powerful tool to estimate the posterior. This is described in this site through a replication of Section 3 of the paper of Casella and George (1992).

  For a more realistic example, please check my other writing following the link:

{% page-ref page="real_gibbs_sampler.md" %}

## Prerequisite

To apply Gibbs sampler, one needs to be able to decompose the posterior distribution $$p(\theta_1, \dots, \theta_p|y)$$ into the components with full conditional distributions, which are easy to sample from.  In other words, one should be able to write up the following:

$$p(\theta_1|\theta_2, \dots, \theta_p|y)$$

$$p(\theta_2|\theta_1,\theta_3, \dots, \theta_p|y)$$

$$\vdots$$

$$p(\theta_p|\theta_1, \dots, \theta_{p-1}|y)$$,

which are easier to sample from than the original posterior distribution.

## Theory



## Simple example

## Does the Gibbs sampler works always? - An example, how to break it.

## Resources

* Casella, George, and Edward I. George. "Explaining the Gibbs sampler." *The American Statistician* 46.3 (1992): 167-174.