# How to break the Gibbs sampler

Let us consider the previous example, but without having the constant _B_ as "filter", i.e. drawing _x_ and _y_ using the following code:

```R
set.seed(2019)
for(i in 1:n){
  # Draw from y conditional x
  curr_y <- rexp(1, rate = tail(x, 1))
  # Update y
  y <- c(y, curr_y)
  # Draw from x conditional y
  curr_x <- rexp(1, rate = tail(y, 1))
  # Update x
  x <- c(x, curr_x)
}
```

![broken_gibbs](/home/lachiee/myProjects/Overview/Bayesian_statistics/Gibbs_sampler/densities2.png)

Well, from this plot we don't know much. 

![converge_report_x](/home/lachiee/myProjects/Overview/Bayesian_statistics/Gibbs_sampler/converge_report_x2.png)

![converge_report_y](/home/lachiee/myProjects/Overview/Bayesian_statistics/Gibbs_sampler/converge_report_y2.png)

From the analysis of the convergence it is clear, that something went wrong. The series are not stationary at all, meaning that the drawings "didn't find their distribution". Looking at the ACF graphs, it is no wonder. There is enormous autocorrelation, leading to a series of drawings which converge very, very, very sloooowly to their "right" distribution. But why? Why was the constant _B_ so important in the convergence?

Everything is clarified in the next [example](./break_sampler_explained.md).



## Resources

- Casella, George, and Edward I. George. "Explaining the Gibbs sampler." *The American Statistician* 46.3 (1992): 167-174.
- For this section I used heavily our notes and home assignments of the course _Advanced Topics in Financial Econometrics_ hold by [Gregor Kastner](https://www.wu.ac.at/statmath/faculty-staff/faculty/gkastner) during the summer semester of 2019 in the Quantitative Finance Master Program of the Business University of Vienna.