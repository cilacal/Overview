# Stochastic calculus

## What is a stochastic process?

A _continuous-time stochastic process_ $$X = (X_t)_{t\geq0}$$ is a family of _random variables_ on $$(\Omega, F,P)$$.

* $$(\Omega, F,P)$$: probability space

  * $$\Omega$$, sample space: "set of all possible outcomes." (Wikipedia)

  * $$F$$, filtration: "the information that is available at a given point" (Wikipedia)

  * $$P$$, probability measure: "function returning an event's probability. $$P:F \rightarrow [0,1]$$" (WIkipedia) with the following requirements:

    * The probability of a countable union of mutually exclusive events must be equal to the countable sum of the probabilities of each of these events.
    * The probability of the sample space $$\Omega$$ must be equal to one.

    

To understand it better, let's quote what Wikipedia has to say about stochastic processes: "Historically, the random variables were associated with or indexed by a set of numbers, usually viewed as points in time, giving the _interpretation of a stochastic process representing numerical values of some system __randomly changing over time__,_such as the growth of a bacterial population, or the movement of a gas molecule. Stochastic processes are widely used _as mathematical models of systems and phenomena that appear to vary in a random manner._ (...) seemingly random changes in __financial markets__ have motivated the extensive use of stochastic processes in finance."

Well, now it is better. Now we can talk about some important definitions, properties of stochastic processes:

* __Adapted process__: $$X$$ is called __adapted__, if for all $$t>0$$ the rv $$X_t$$ is $$F_t$$-measurable. $$\rightarrow$$ The process cannot "see into the future".

* __Trajectory, sample path__: If we fix some $$\omega \in \Omega$$ the mapping $$X(\omega):[0,\infty] \rightarrow R, t\rightarrow X_t(\omega)$$ is called __trajectory__ or __sample path__ of $$X$$.

* __Submartingale/Supermartingale/Martingale__: if $$\forall t, s$$ with $$t > s$$ we have $$E(X_t|F_s) \geq X_s \ E(X_t|F_s) \leq X_s \ E(X_t|F_s) = X_s$$. In other words, the process is _increasing/decreasing/equal_ __on average__. 
  
* __Markov process__: $$E(f(X_{t+s})|F_t) = E(f(X_{t+s})|\sigma(X_t))$$, i.e. the conditional distribution of future values $$X_{t+s}$$ for $$s \geq 0$$ is completely determined by the present value $$X_t$$. In other words: the process has "no memory", previous elements except the current doesn't influence the coming ones.
  
* __Point process__: processes which assumes that certain relevant "events" (e.g. defaults) occur at random time points $$\tau_0 < \tau_1 < \dots$$. The corresponding point process is given by $$N_t := sup\{n, \Tau_n \leq t\}$$, i.e. $$N_t$$ is the number of events occured up to time $$t$$.
  * Most famous such process is the __Poisson process__ with the following definition:
    * $$\tau_i \sim exp(\lambda), i.e. \tau_i \sim \lambda e^{-\lambda x}$$ with the c.d.f. $$F(x;\lambda) = P(\tau_n < x) = 1 - e^{-\lambda x}$$ for $$x \geq 0$$ otherwise $$0$$, so $$P(\tau_n \geq x) = e^{-\lambda x}$$.
    * $$P(N_t = k) = e^{-\lambda t}\frac{(\lambda t)^k}{k!}$$ (Poisson distributed with parameter $$\lambda t $$)
    * $$N_{t + u} - N_t$$ is independent of $$N_s$$ for $$s \leq t$$.
    * In other words: a poisson process is a counting process, which counts the events occurred until $$t$$. This is denoted by $$N_t$$. The times between two events ($$\tau$$) are exponentially distributed with the parameter $$\lambda$$ which is called the _intensity parameter_.
    * __Compensated poisson process__: $$M_t : = N_t - \lambda t$$, i.e. between each occurrence of events there is a compensation $$-\lambda t$$ (i.e. the process is decreasing between two occurrences of events). Such process is a __martingale__, in particular $$E(M_t) = \lambda t$$.
      
  
* <u>__Brownian motion/Wiener process__</u>: it is a process with the following defining properties:

  * $$W_0 = 0$$

  * $$W$$ has independent __increments__: $$\forall t,s \geq 0 \text{  } W_{t+s}-W_t$$ is independent of $$W_u, \forall u \leq t$$.

  * $$W$$ has __stationary, normally distributed__ increments, i.e. $$W_{t+s}-W_t \sim N(0, s)$$ ($$s$$ denotes here the variance. From here on, the notation $$N(\mu, \sigma^2)$$ is used).

  * $$W$$ has continuous sample paths.

    ![brownianmotion](/home/lachiee/myProjects/Overview/Theory/Stochastic_calculus/brownianmotion.jpg "The picture is from https://images.app.goo.gl/rtT2jJUwoVMxaSGZ9")
  
  ...and with the following further properties which can be derived from the aboves:
  
  * $$Cov(W_t, W_s) = E[W_tW_s] - E[W_t]E[W_s] = E[W_tW_s]=E[(W_t-W_s)W_s] + E[W_s^2] = E[W_t - W_s]E[W_s] + s = s$$ for $$s < t$$.
  * $$W_t = W_t - W_o \sim N(0,t)$$
  * $$(W_t)_{t \geq 0}; (W_t^2-t)_{t \geq 0}; exp(\sigma W_t - \frac{1}{2}\sigma^2t)$$ are martingales w.r.t. 
  * Extra: Donskers invariance principle says, that $$W_t^n = \frac{1}{\sqrt{n}}\sum_{i = 1}^{[nt]}X_i$$ for $$X_i$$ with $$E[X_i] = 0, Var(X_i) = 1$$. Then $$W_t^n$$  converges to a Brownian motion in distribution.

Only two more definitions and its done.

#### Disclaimer

Some of the solutions represented in this repository are the results of teamwork of me and my student or working colleagues. Some of the explanations of the underlying theory was written with the help of the study materials received and learned during the [Quantitative Finance Master Program of the WU University Vienna](https://www.wu.ac.at/studium/master/quantitative-finance/overview).
