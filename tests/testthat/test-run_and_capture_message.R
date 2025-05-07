test_that("run_and_capture_message() works", {

  actual <- run_and_capture_message(
    function_call = {
      message("test")
    }
  )

  expected <- ("test\n")

  expect_equal(actual, expected)
})
