# Vasicek model

_Please refer to this [Wikipedia article](https://en.wikipedia.org/wiki/Vasicek_model) for more details. Here, you can find a summary of that page._

It is a one-factor short rate model to describe interest rate (IR) movements. 

Formula: 

$$dr_t = a(b - r_t)dt + \sigma dW_t $$ with

* $$b$$: long term mean of $$r_t$$
* $$a$$: speed of the mean reversion
* $$\sigma$$: volatility of $$r_t$$
* $$\frac{\sigma^2}{2a}$$: long term variance of $$r_t$$

This model captures the _mean reversion_ of the interest rates (which property makes IR special $$\rightarrow$$ if IR large, economy is hampered $$\rightarrow$$ IR gets lower, and vice versa).

## Interpretation of the model

"The parameter *b* represents the [long-run](https://en.wikipedia.org/wiki/Long-run) [equilibrium](https://en.wikipedia.org/wiki/Steady_state) value towards which the interest rate reverts. Indeed, in the absence of shocks ($$dW_(t)=0$$), the interest rate remains constant when *rt = b*. The parameter *a*, governing the speed of adjustment, needs to be positive to ensure [stability](https://en.wikipedia.org/wiki/Stability_theory) around the long term value. For example, when *rt* is below *b*, the drift term $$a(b-r_(t))$$ becomes positive for positive *a*, generating a tendency for the interest rate to move upwards (toward equilibrium)." - From the related wikipedia article.

In other words, the main assumption is, that the IR is affected only by random market movements ($$W_t$$), market shocks.

## Usage of the model

It is often used to valuate interest rate futures or to price bonds, which are hard to value.

## Improvement of the model

The [Cox-Ingersoll-Ross (CIR)](../cir_model/README.md) model deals with the issue of the Vasicek model, that it allows negative interest rates.  Further such models are the Black-Deman-Toy model, Black-Karasinksi model, etc.

## Resources

