TOL <- 1e-6

# X <- Semidef(2)
Y <- Variable(2, 2)
Fmat <- cbind(c(1,0), c(0,-1))

test_that("SDP in objective and constraint", {
  # SDP in objective
  # obj <- Minimize(SumEntries(Square(X - Fmat)))
  # p <- Problem(obj, list())
  # result <- solve(p)
  # expect_equal(result, 1, tolerance = 1e-4)
  
  # expect_equal(X[1,1], 1, tolerance = 1e-3)
  # expect_equal(x[1,2], 0, tolerance = TOL)
  # expect_equal(x[2,1], 0, tolerance = TOL)
  # expect_equal(x[2,2], 0, tolerance = TOL)
  
  # SDP in constraint
  # obj <- Minimize(SumEntries(Square(Y - Fmat)))
  # p <- Problem(obj, list(Y == Semidef(2)))
  # result <- solve(p)
  # expect_equal(result, 1, tolerance = 1e-2)
  
  # expect_equal(Y[1,1], 1, tolerance = 1e-3)
  # expect_equal(Y[1,2], 0, tolerance = TOL)
  # expect_equal(Y[2,1], 0, tolerance = TOL)
  # expect_equal(Y[2,2], 0, tolerance = 1e-3)
  
  # Index into semidef
  # obj <- Minimize(Square(X[1,1] - 1) + Square(X[2,1] - 2) + Square(X[2,2] - 4))
  # p <- Problem(obj, list())
  # result <- solve(p)
  # print(X)
  # expect_equal(result, 0, tolerance = TOL)
  
  # expect_equal(X[1,1], 1, tolerance = 1e-2)
  # expect_equal(X[1,2], 2, tolerance = 1e-2)
  # expect_equal(X[2,1], 2, tolerance = 1e-2)
  # expect_equal(X[2,2], 4, tolerance = 1e-3)
})
