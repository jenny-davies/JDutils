test_that("get_financial_year() works", {
  
  actual <- get_financial_year("2024-06-01")
  
  expected <- "2024/25"
  
  expect_equal(actual, expected)
})
