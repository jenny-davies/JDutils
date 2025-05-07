test_that("generate_temporary_name() creates expected string", {

  actual <- generate_temporary_name()

  expected <- "temp_"

  expect_equal(substr(actual, 1, 5), expected)
})
