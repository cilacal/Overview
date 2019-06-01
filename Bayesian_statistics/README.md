# Bayesian statistics

This repository is intended to summarize the  most important concepts of the mysterious field of Bayesian statistics.

My hope is, that with the help of my explanations and the materials I link here, I will be able to spread the amazing view, how a bayesian statistician sees the world.

The structure of each folder is the following:  

- R or python script with the solution of the given problem, without any explanation
- markdown file with (almost) line by line explanation of the solution in the README.md file. 

Of course, for larger scripts or projects the description is in a seperate markdown file and the README.md serves its original purpose.

# Table of contents

- [Introduction to the Bayesian statistics](#Introduction)
- [Gibbs sampler - Introductory example](Gibbs_sampler/README.md)
- [Realistic example for a Gibbs sampler](Gibbs_sampler/real_gibbs_sampler.R)
  - [Metropolis-Hastings within a Gibbs sampler](MH_within_Gibbs/README.md)
- [Bayesian regression](Bayesian_regression/README.md) 

# Introduction

## Bayes' rule

$$P(A|B) = \frac{P(B|A)P(A)}{P(B)}$$

Yes, this is it. This is the rule on which a whole new kind of statistical thinking is based. Why is that so revolutionary?  To understand this, let's have a quick recap about how frequentist think about statistics.

## Frequentist approach<sup>[1](#myfootnote1)</sup> 

The main weapon of the frequenstist statistics is the Null Hypothesis Significance Testing (NHST). This method of statistical inference is probably known for everybody as this is, even if it is thoroughly criticized, used in many fields, even in the academia. NHST works based on the concepts of significance testing developed by [Fisher (1934, 1955, 1959)](#myfootnote2) and the critical rejection regions introduced by [Neyman & Pearson (1928)]((#myfootnote3)).  Specifically, the probability of the observed, or more extreme result is calculated given that the null hypothesis ($$H_0$$, which often denotes the cases of _"no effect"_, _"mean = 0"_, _"the populations have equal mean"_ etc.) is true. This probability is denoted by the $$p$$-value and calculated with the help of the _t-statistic_ of the given test, which has some kind of distribution (often _t-distribution_). 

Given that the $$p$$-value is smaller than the chosen level of significance_ (usually set to $$0.05$$ or $$0.01$$), we can conclude something like this:

__"The probability of observing this, or more extreme data under the true $$H_0$$ is true, is very small."__

Here, we can already see, that there is nothing about the probability of the _alternative hypothesis_ $$H_A$$ (which is the hypothesis assumed to be true if $$H_0$$ is false, usually the opposite of $$H_0$$).

Hence, the $$p$$-value answers the following question:

__"Given that H_0 is true, what is the probability of these (or more extreme) data?"__

Given that $$H_0$$ is often a hypothesis for a parameter of a distribution (such as _mean_, _variance_, _proportion in the population_, etc. For a nice cheat sheet about, which hypothesis test is when to use with which test-statistic please refer to my [mind map about statistics](), or [here](<https://www.dummies.com/education/math/statistics/handling-statistical-hypothesis-tests/>) or [here](<https://dacg.in/2018/11/17/statistical-test-cheat-sheet/>)), let's denote it with $$\theta$$. Furthermore, denote the data what we have by _D_. Hence, we can write the probability what we have got as $$P(D|\theta)$$. 

## Bayesian approach

But where is the problem with NHST? Nice that we have $$P(D|\theta)$$, but we would like to know the probability of $$\theta$$ given the data _D_, so $$P(\theta|D)$$, right?

Let's recall the Bayes' rule:

$$ P(A|B) = \frac{P(B|A)P(A)}{P(B)} $$,

and let's substitute _A_ by $$\theta$$ and _B_ by _D_. Then we have 

$$ P(\theta|D) = \frac{P(D|\theta)P(\theta)}{P(D)} $$,

which gives the way to calculate the calculate the required probability. Indeed, it is the only way to make statistical inference about the parameter $$\theta$$ conditional on data _D_.  

Let's elaborate more what we can see above by describing each element of the equation:

* $$P(\theta|D)$$: _posterior distribution_, the distribution of the parameter(s) $$\theta$$ given the data $$D$$.
* $$P(D|\theta)$$: _likelihood function_ of the data $$D$$. In case of i.i.d. (independent, identically distributed) observations, the likelihood function can be received by $$\prod_{i = 1}^n f(x)$$, where $$f(x)$$ denotes the distribution function of each $$n$$ observation.
* $$P(\theta)$$: _prior distribution,_ distribution which includes all our prior knowledge/believes about the parameter $$\theta$$. 
* $$P(D)$$: _marginal likelihood_, which is usually considered as a constant, so we can set the _posterior_ proportional to the numerator of the product of the _prior_ and the _likelihood_.

__Important__ that in this case, we got a probability distribution of the parameter(s) $$\theta$$ given the data $$D$$, not a point estimate. Point estimate is, of course, possible by

* posterior mean: the mean of the posterior distribution,
* posterior median: the median of the posterior distribution,
* Maximum A Posteriori (MAP) estimation: maximum of the posterior distribution (asymptotically similar to the maximum-likelihood estimator).

## Comparison

#### Advantages of the Bayesian approach over the frequentist one

* We can answers question like "What is the probability that the parameter $$\theta$$ lies within/outer a given interval/equal to a given value based on the data?"
* We can avoid a bunch of misinterpretation of the _p_-value. Of course, "_p_-hacking" does not come into the play at all.

#### Disadvantages of the Bayesian approach over the frequentist one

* To get the posterior correctly is often cumbersome, if not impossible.

* The selection of the _prior_ distribution(s) matters a lot!! However, one can select noninformative priors, such as:

  * for _location models_, i.e. $$y \sim p(y-\theta)$$ $$\rightarrow$$ flat prior $$p(\theta) \propto 1$$,
  * for _scale models_, i.e. $$y \sim \frac{1}{\theta}p(\frac{y}{\theta})$$ $$\rightarrow$$ log-transform of flat prior $$p(\theta) \propto \frac{1}{\theta}$$,
  * or selection of a translational invariant prior, i.e. Jeffreys prior, defined by $$p(\theta) \propto |F(\theta)|^{\frac{1}{2}}$$with $$F(\theta) = V(\frac{\partial log p(y|\theta)}{\partial \theta})$$ denoting the Fisher Information,

  or some _conjugate prior_ mimicing the likelihood structure within the prior to receive _posteriors_ within the same parameterized distribution family as the _priors_. 

## Example 

Assume that our data $$y$$ consists of $$n$$ i.i.d. normal variables with mean $$\mu$$ and variance $$\sigma^2$$,i.e. $$y_i \sim N(\mu,\sigma^2) $$. Furthermore, let $$ \theta = (\mu,\sigma^2)$$, meaning we assume that both mean and variance are unknown and random.

Thus we have a joint prior distribution, which we can decompose in conditional and marginal:

$$ p(\mu,\sigma^2) = p(\mu|\sigma^2)p(\sigma^2), $$

As priors, we now choose:

* $$p(\mu|\sigma^2) \sim N(0,\sigma^2)$$
* $$p(\sigma^2) = \frac{1}{(\sigma^2)^2}exp\big\{-\frac{1}{\sigma^2}\big\} \sim \mathcal{IG}(1,1)$$ (an exponential $$\mathcal{E}(1)$$ on precision $$\sigma^{-2}$$)

These selection of priors gives us the following joint posterior:

$$ p(\mu,\sigma^2 | y)  \propto p(\mu|\sigma^2,y) \times p(\sigma^2|y)    $$
where $$p(\mu|\sigma^2,y)$$ is the conditional (posterior) distribution, and $$p(\sigma^2|y)$$ the marginal (posterior) distribution.
This, gives:
$$ p(\mu,\sigma^2 | y) \propto \frac{1}{\sigma}\exp\bigg\{-\frac{1}{2\sigma^2/(n+1)}\bigg(\mu - \frac{n\bar{y}}{n+1}\bigg)^2\bigg\} \times (\sigma^2)^{-\frac{n+2}{2}-1}\exp\bigg\{-\frac{1}{2\sigma^2}\bigg(2+s^2+\frac{n}{n+1}\bar{y}^2\bigg)\bigg\}  $$
which is the product of a conditionally normal distribution
$$ p(\mu|\sigma^2,y) \sim N\bigg(\frac{n}{n+1}\bar{y}, \frac{1}{n+1}\sigma^2\bigg),  $$
and an inverse gamma distribution,
$$p(\sigma^2 | y) \sim \mathcal{IG}\bigg(\frac{n+2}{2}, \frac{1}{2}\bigg(2+s^2+\frac{n}{n+1}\bar{y}^2 \bigg)\bigg).$$

Note that the marginal posterior distribution of $$\mu$$ is a non-standardized Student's $$t$$ distribution:
$$ \mu|y \sim \mathcal{T}_{n+2}\bigg(\frac{n}{n+1}\bar{y}, \frac{2+s^2+\frac{n}{n+1}\bar{y}^2}{(n+1)(n+2)}\bigg)$$.

## Conclusion

...seeing the results of this simple example, one can imagine, how cumbersome is to derive these posteriors.

What is more, it is even impossible to derive such close forms of the _posteriors_ in many cases. Here comes the [__Gibbs sampler__](Gibbs_sampler/README.md) into the picture. 



_<sup><a name="myfootnote31">1</a>:Disclaimer: this section is base on the  following website: <https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5635437/> __</sup>_

_<sup><a name="myfootnote2">2</a>: Fisher RA: Statistical Methods for Research Workers. (Vol. 5th Edition). Edinburgh, UK: Oliver and Boyd.1934.__</sup>_

_<sup>Fisher RA: Statistical Methods and Scientific Induction. *Journal of the Royal Statistical Society, Series B.* 1955;17(1):69–78.__</sup>_

_<sup>Fisher RA: Statistical methods and scientific inference. (2nd ed.). NewYork: Hafner Publishing,1959__</sup>_

_<sup><a name="myfootnote3">3</a>: Neyman J, Pearson ES: On the Use and Interpretation of Certain Test Criteria for Purposes of Statistical Inference: Part I. *Biometrika.*1928;20A(1/2):175–240. 10.3389/fpsyg.2015.00245 </sup>_