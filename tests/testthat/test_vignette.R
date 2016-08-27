test_that("Test non-negative least squares", {
  library(MASS)
  
  # Generate problem data
  s <- 1
  m <- 10
  n <- 300
  mu <- rep(0, 9)
  Sigma <- data.frame(c(1.6484, -0.2096, -0.0771, -0.4088, 0.0678, -0.6337, 0.9720, -1.2158, -1.3219),
                      c(-0.2096, 1.9274, 0.7059, 1.3051, 0.4479, 0.7384, -0.6342, 1.4291, -0.4723),
                      c(-0.0771, 0.7059, 2.5503, 0.9047, 0.9280, 0.0566, -2.5292, 0.4776, -0.4552),
                      c(-0.4088, 1.3051, 0.9047, 2.7638, 0.7607, 1.2465, -1.8116, 2.0076, -0.3377),
                      c(0.0678, 0.4479, 0.9280, 0.7607, 3.8453, -0.2098, -2.0078, -0.1715, -0.3952),
                      c(-0.6337, 0.7384, 0.0566, 1.2465, -0.2098, 2.0432, -1.0666,  1.7536, -0.1845),
                      c(0.9720, -0.6342, -2.5292, -1.8116, -2.0078, -1.0666, 4.0882,  -1.3587, 0.7287),
                      c(-1.2158, 1.4291, 0.4776, 2.0076, -0.1715, 1.7536, -1.3587, 2.8789, 0.4094),
                      c(-1.3219, -0.4723, -0.4552, -0.3377, -0.3952, -0.1845, 0.7287, 0.4094, 4.8406))
  
  X <- mvrnorm(n, mu, Sigma)
  X <- cbind(rep(1, n), X)
  b <- c(0, 0.8, 0, 1, 0.2, 0, 0.4, 1, 0, 0.7)
  y <- X %*% b + rnorm(n, 0, s)
  
  # Construct the OLS problem without constraints
  beta <- Variable(m)
  objective <- Minimize(SumSquares(y - X %*% beta))
  prob <- Problem(objective)
  
  # Solve the OLS problem for beta
  system.time(result <- cvxr_solve(prob))
  result$optimal_value
  result$primal_values[[as.character(beta@id)]]
  beta_ols <- result$primal_values[[as.character(beta@id)]]
  
  # Add non-negativity constraint on beta
  constraints <- list(beta >= 0)
  prob2 <- Problem(objective, constraints)
  
  # Solve the NNLS problem for beta
  system.time(result2 <- cvxr_solve(prob2))
  result2$optimal_value
  result2$primal_values[[as.character(beta@id)]]
  beta_nnls <- result2$primal_values[[as.character(beta@id)]]
  all(beta_nnls >= 0)   # All resulting beta should be non-negative
  
  # Calculate the fitted y values
  fit_ols <- X %*% beta_ols
  fit_nnls <- X %*% beta_nnls
  
  # Plot coefficients for OLS and NNLS
  coeff <- cbind(b, beta_ols, beta_nnls)
  colnames(coeff) <- c("Actual", "OLS", "NNLS")
  rownames(coeff) <- paste("beta", 1:length(b)-1, sep = "")
  barplot(t(coeff), ylab = "Coefficients", beside = TRUE, legend = TRUE)
})

test_that("Test catenary problem", {
  # Problem data
  n <- 51
  L <- 2
  h <- L/(n-1)
  
  # Form objective
  x <- Variable(2*n)
  B <- diag(2*n)
  B[1:n, 1:n] <- 0
  objective <- Minimize(SumEntries(B %*% x))
  
  # Form constraints
  A <- matrix(0, nrow = 4, ncol = 2*n)
  A[1, 1] <- A[2, n] <- A[3, n+1] <- A[4, 2*n] <- 1
  b <- matrix(c(0, 1, 1, 1), nrow=4)
  constraints = list(x >= 0, A %*% x == b)
  
  for (i in seq.int(n-1)) {
    A <- matrix(numeric(2*2*n), nrow = 2)
    A[1, i] <- -1; A[1, i+1] <- 1
    A[2, n+i] <- -1; A[2, n+i+1] <- 1
    constraints <- c(constraints, Norm2(A %*% x) <= h)
  }
  
  # Solve the catenary problem
  prob <- Problem(objective, constraints)
  system.time(result <- cvxr_solve(prob))
  
  # Plot results
  x <- result$primal_values[[as.character(x@id)]]
  xs <- x[1:n, 1, drop = TRUE]
  ys <- x[(n+1):(2*n), 1, drop = TRUE]
  plot(c(0, 1), c(0, 1), type = 'n')
  lines(xs, ys, col = "blue", lwd = 2)
  
  points(c(0, 1), c(1, 1))
  curve(0.22964*cosh((x-0.5)/0.22964)-0.02603, 0, 1, col = "red", add = TRUE)
  grid()
})