test_that("colVar works", {
  mat <- rbind(
    c(1, 2, 7),
    c(3, 5, 9),
    c(5, 6, 1)
  )

  expect_equal(colVars(mat), c(var(c(1, 3, 5)), var(c(2, 5, 6)), var(c(7, 9, 1))))
  expect_equal(rowVars(mat), c(var(c(1, 2, 7)), var(c(3, 5, 9)), var(c(5, 6, 1))))
})
