test_that("calculate_working_days works", {
  expected <- 254
  
  df <- calculate_working_days(start = "2024-01-01",
                               end = "2024-12-31")
  
  actual <- unique(df$year_total)
  
  expect_equal(expected, actual)
})
