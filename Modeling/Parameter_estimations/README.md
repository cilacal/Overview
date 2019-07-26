# Parameter estimations

# Table of contents

- [Method of moments](#method_of_moments_(mom))
- [Maximum likelihood](#maximum_likelihood)
- [Bayesian approach](#bayesian_approach)
- [Criteria to accept the estimations](#criteria_to_accept_the_estimations)

_This topic is by far not finalized yet!_

## Method of Moments (MoM)

Method of moments is a method to estimate model parameters by setting the sample and population moments equal. Therefore, we need so many method of moments as many parameters we would like to estimate.

## Maximum Likelihood (ML)

We assume that the the random variables  $$X_1, \dots, X_n$$ have the probability mass function (pms)$$f(x_1, \dots, x_n|\theta)$$.  Given observed values, the pms defines the _likelihood_ function. The ML estimation of $$\theta$$ is the parameter which maximizes the _likelihood_ function.

Fisher information: $$F(\theta) = V(\frac{\partial log p(x|\theta)}{\partial \theta})$$ denoting the information which r.v. $$x$$ gives about the unknown parameter $$\theta$$. It can be seen as the variance of the _score_ (i.e. gradient of the log-likelihood w.r.t. its parameters, i.e. its sensitivity to its parameter changes).

## Criteria to accept the estimations

* Efficiency: the sampling distribution of the selected parameter results a distribution "centered" around the true value. Possible measurements of this "centering" can be the MSE for example.

  * Cramer-Rao Inequailty:

    $$var(T) \geq \frac{1}{nI(\theta)} $$ for $$T$$ which is an unbiased estimate of $$\theta$$.

* Sufficiency:  the following question is answered: "for a sample $$X_1, \dots, X_n$$ from $$f(x|\theta)$$, is there a statistic $$T(X_1, \dots, X_n)$$, which contains all information in the sample about $$\theta$$?" Precisely: a statistic is _sufficient_ for $$\theta$$ if the conditional distribution of  $$X_1, \dots, X_n$$ given $$T = t$$ does not depend on $$\theta$$ for any value $$t$$.

## Resources

* 