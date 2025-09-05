test_that("correct_filepath_format works as expected", {
  path <- correct_filepath_format(r"(top_directory\folder\sub-folder\file.txt)")
  
  expect_equal(path,
               "top_directory/folder/sub-folder/file.txt")
})
