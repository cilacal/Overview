# Gibbs sampler - Bayesian statistics basics

I start the description of the Gibbs sampler from the very beginning, i.e. from Bayes' rule so one can understand why the Gibbs sampler is so extremely useful.

If you would like to skip the _blabla_ part, then click [here](#The Gibbs sampler) to jump to a simply example of the Gibbs sampler, which helps to understand how it works, or [here](#real_gibbs_sampler.R) to check a real life example of that.

## Bayes' rule

$$ P(A|B) = \frac{P(B|A)P(A)}{P(B)} $$

Yes, that is it. Why is that so revolutionary?  To understand this, let's have a quick recap about how frequentist think about statistics.

### Frequentist approach<sup>[1](#myfootnote1)</sup> 

The main weapon of the frequenstist statistics is the Null Hypothesis Significance Testing (NHST). This method of statistical inference is probably known for everybody as this is, even if it is thoroughly criticized, used in many fields, even in the academia. NHST works based on the concepts of significance testing developed by [Fisher (1934, 1955, 1959)](#myfootnote2) and the critical rejection regions introduced by [Neyman & Pearson (1928)]((#myfootnote3)).  have a null hypothesis ($H_0$) and an alternative hypothesis ($H_A$) 



## The Gibbs sampler





_<sup><a name="myfootnote31">1</a>:Disclaimer: this section is base on the  following website: <https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5635437/> __</sup>_

_<sup><a name="myfootnote2">2</a>: Fisher RA: Statistical Methods for Research Workers. (Vol. 5th Edition). Edinburgh, UK: Oliver and Boyd.1934.__</sup>_

_<sup>Fisher RA: Statistical Methods and Scientific Induction. *Journal of the Royal Statistical Society, Series B.* 1955;17(1):69–78.__</sup>_

_<sup>Fisher RA: Statistical methods and scientific inference. (2nd ed.). NewYork: Hafner Publishing,1959__</sup>_

_<sup><a name="myfootnote3">3</a>: Neyman J, Pearson ES: On the Use and Interpretation of Certain Test Criteria for Purposes of Statistical Inference: Part I. *Biometrika.*1928;20A(1/2):175–240. 10.3389/fpsyg.2015.00245 </sup>_