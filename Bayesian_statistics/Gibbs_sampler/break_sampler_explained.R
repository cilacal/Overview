# Nr of categories of X and Y
n <- 3
m <- 3

set.seed(2019)
# Create the joint conditional mmatrix
probs <- runif(n*m-1)/(n*m-1)
probs <- c(probs,1 - sum(probs))
probs <- rep(1/(n*m),n*m)
df <- as.data.frame(matrix(probs, n * m, ncol = n, nrow = m))
colnames(df) <- 1:n
rownames(df) <- 1:m
origin_df <- df
origin_df

# Container to keep the iterations needed to check how the choice of the probabilities 
#influence the speed of the convergence
iterations_needed <- c()
nr_run <- 10

for(k in 1:nr_run){
  # Decrease sequentially the given values
  break_df <- df
  break_df[1,1] <- origin_df[1,1] - k*(origin_df[1,1] - 1e-15)/nr_run
  break_df[1,3] <- origin_df[1,3] - k*(origin_df[1,3] - 1e-15)/nr_run
  break_df[2,2] <- origin_df[2,2] - k*(origin_df[2,2] - 1e-15)/nr_run
  break_df[3,1] <- origin_df[3,1] - k*(origin_df[3,1] - 1e-15)/nr_run
  break_df[3,2] <- origin_df[3,2] - k*(origin_df[3,2] - 1e-15)/nr_run
  
  break_df <- break_df/sum(break_df)
  
  df <- break_df
  # Define the translation matrices
  xy <- df/rowSums(df)
  yx <- t(df)/rowSums(t(df))
  
  sample_size <- 2000
  nr_its <- c()
  
  x <- c(sample(1:3, 1))
  y <- c()
  # Do the Gibbs sampling
  for(i in 1:sample_size){
    y <- c(y, sample(rownames(yx), 1, prob = yx[x[length(x)],]))
    x <- c(x, sample(rownames(xy), 1, prob = xy[y[length(y)],]))
    
    # check for convergence
    if(length(x) > 100){
      new_table <- data.frame(as.numeric(x[2:length(x)]),as.numeric(y))
      crit <- max(abs(table(new_table)/i - origin_df)) < 0.05
      if(crit) {
        nr_its <- c(nr_its, i)
        break
      }
    }
    
    if(i == sample_size) nr_its <- c(nr_its, i)
  }
  
  iterations_needed <- c(iterations_needed, nr_its)
  nr_its <- 0
}

plot(iterations_needed, type = "l", xlab = "Nr. of steps in the linear decrease of the probabilities", ylab = "Number of iterations needed for converge")