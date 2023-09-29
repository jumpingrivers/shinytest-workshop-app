test_that("extract_unique returns a vector with no duplicates", {
  test_data <- tibble::tibble(
    animal = c("rabbit", "panda", "dog"),
    food = c("carrot", "bamboo", "carrot")
  )
  observed <- extract_unique(test_data, "food")

  expect_equal(
    observed,
    c("bamboo", "carrot")
  )
})
