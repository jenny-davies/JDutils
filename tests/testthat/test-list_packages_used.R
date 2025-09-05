test_that("list_packages_used returns the expected packages works", {
  packages <- list_packages_used()
  
  expect_true("dplyr" %in% packages)
})
