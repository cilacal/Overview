# GARCH and its variations

# Table of contents

- [ARCH & GARCH](#garch)
  - [integrated GARCH - IGARCH](#integrated_garch)
  - [EGARCH, t-GARCH, ARCH-M](#e-garch)
  - [asymmetric GARCH, threshold GARCH, GJR](#asymmetric_garch,_threshold_garch,_gjr)
- [Estimation of GARCH](#estimation_of_garch)
- [Unit root](#unit_root)
- [Hausman-Wu test](#hausman_wu_test)
- [Granger causality](#Granger_causality)

## Conditional heteroscedasticity - GARCH

### The problem

After these fancy abbreviations, it would be nice to know, what the problem is to solve. "It is a stylized fact of stock returns and other financial return series that there are periods of high volatility followed by periods of low volatility. The increase and decrease of this volatility pattern can be captured by $$(G)ARCH$$ models" (note from my [lecture slides](#resources)). 

Ok, let's have an example:

TODO

"The idea is that the approach pf new information increases the uncertainty in the market and so the variance. After some while the market participants find to a new consensus and the variance decreases".

For the sake of the $$GARCH$$ model it is assumed that the (log)returns _r_t_, are white noise, i.e.

$$r_t = \mu + \epsilon_t \text{ with } \epsilon_t \sim N(0, \sigma_t^2)$$

where $$\sigma_t^2 = E[\epsilon_t^2|I_{t-1}]$$.

So in plain english: we assume that the (log)returns are normally distributed with some time-dependent (varying by time) error term $$\epsilon_t$$ and variance $$\sigma_t^2$$. The assumption of the $$GARCH$$ model is that the variance $$\sigma_t^2$$ is **conditional** (hence the name: conditional heteroscedasticity) on the previous information $$I_{t-1} = \{\epsilon_{t-1}^2, \epsilon_{t-2}^2, \dots, \sigma_{t-1}^2, \sigma_{t-2}^2,\dots\}$$, i.e. on the previous error terms $$\epsilon_t^2$$ and the variances $$\sigma_t^2$$ of the error terms.

### What is a GARCH model?

It is the abbreviation of Generalized Autoregressive Conditional Heteroscedasticity. That's it, thank you for your attention! 

Well, in a bit more detail, a $$GARCH(r,s)$$ model has the form:

$$\sigma^2_t = a_0 + \Sigma_{j = 1}^sa_j\epsilon_{t-j}^2 + \Sigma_{j = 1}^rb_j\sigma_{t-j}^2 $$.

So in human language: the variance of the (log)returns is a (linear) function of the previous $$s$$  error terms $$\epsilon_{j}^2 \text{ with } j\in \{1,\dots,s\}$$ and the previous $$r$$ variances $$\sigma_{j}^2 $$ of the error terms with $$j\in \{1,\dots,r\}$$. 

This is an extension of $$ARCH(p)$$ model, i.e. of the model, where the variance of the (log)returns is a (linear) function of the previous $$p$$ error terms only. 



### Estimation of the $$GARCH(r,s)$$ model



## Resources

* For this section I used heavily my notes and home assignments of the course _Financial Econometrics_ hold by [Michael Hauser](<https://www.wu.ac.at/statmath/faculty-staff/faculty/mhauser>) during the winter semester of 2019 in the Quantitative Finance Master Program of the Business University of Vienna.