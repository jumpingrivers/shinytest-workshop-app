test_that("invert_names swaps names with values", {
  test_data <- c("a" = "x", "b" = "y")

  observed <- invert_names(test_data)

  expect_equal(
    observed,
    c("x" = "a", "y" = "b")
  )
})
