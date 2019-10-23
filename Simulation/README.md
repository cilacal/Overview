# Simulation

The sections is focused on different techniques to simulate random variables. These techniques range from the simple ones, such as _inverse transform_ to the more practical _Monte Carlo (MC) method_, included some ways to decrease the variance of the _MC simulation_. Furthermore, the simulation of _stochastic differential equations (SDE)_ is covered shortly as well.

# A little bit of theory

An important use case of the below described methods is the pricing of derivatives. To see that, it is important to keep in mind the three main principles of derivatives pricing, i.e.:

1. "If a derivative security can be perfectly replicated through trading in other assets, then the price of the derivative is the cost of replication.
2. Discounted asset prices are martingales under a probability measure associated with the choice of discount factor (or numeraire).
3. In a _complete_ market, any payoff can be replicated through a trading strategy, and the martingale measure associated with a numeraire is unique."

These principles lead to the following approaches to derivative pricing:
* "__PDE Approach__: Principle 1) together with the given dynamics of the underlying asset lead to a partial differential equation (PDE) that the price of the derivative satisfies.
* __Risk-Neutral (Martingale) Approach__: Principle 2) gives us a way to express the price of the derivative as the expected present value of the terminal payoff discounted at the risk-free rate."

The connection between these two approaches is provided by the Feynman-Kac formula in the following ways:
* First we calculate the expectation to find a numerical solution to the PDE in (1).
* Or we can solve the PDE in (1) in order to compute the exepctation in (2).

__Feynman Kac formula__

"Suppose that $$V(t,x)$$ solves the terminal value problem (1)

$$\frac{\delta V}{\delta t}(t,x) + \mu(x)\frac{\delta V}{\delta x}(t,x) + \frac{1}{2}\sigma(x)^2\frac{\delta^2 V}{\delta^2 x}(t,x) = r(x)V(t,x),$$

$$V(T,x) = \phi(x).$$"

....

We wouldn't need any simulation if it would be that "easy". However we can have the following possible issues:
  - If the underyling asset price dynamics are complex, a solution may not exist for either approaches. 
  - If the number of underlying assets in the replication strategy is large, numerical solution may be impractical.

And now we arrived to the [Monte Carlo simulation](./monte-carlo_simulation/README.md)...

# Table of contents

- [Monte Carlo simulation](./monte-carlo_simulation/README.md)
- [Generating random variables - Inverse transform, composition method, acceptance-rejection method](./generating_random_variables/README.md)
- [Simulating SDEs](./simulationg_sdes/README.md)


# Disclaimer
This description is based heavily on the study materials provided by [Zehra Eksi-Altay](https://www.wu.ac.at/en/statmath/faculty-staff/faculty/zeksi) for the Financial Engineering class in the summer semester in 2019 within the Quantitative Finance Master Program of the WU University Vienna. The quotes without noting their sources are directly from these materials.
