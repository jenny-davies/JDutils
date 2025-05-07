test_that("create_filename() creates a valid filepath", {

  actual <- create_filename(export_location = "tests",
                            filepath = "test_file.txt")

  expected <- "tests/teststest_file_1.txt"

  expect_equal(actual, expected)
})
