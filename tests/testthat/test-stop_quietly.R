test_that("stop_quietly stops execution without an error message", {
  
  expect_error(
    stop_quietly(),
    ""
  )
  
  orig_opt <- getOption("show.error.messages")
  options(show.error.messages = TRUE)
  
  expect_error(
    stop_quietly(),
    ""
  )
  
  expect_identical(getOption("show.error.messages"), TRUE)
  options(show.error.messages = orig_opt)
})
