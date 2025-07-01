test_that("not_in returns the expected results", {
  df <- data.frame(ref = c("A", "B", "C", "D", "E"),
                   num = c(1, 2, 3, 4, 5))
  
  filtered <- df |> 
    dplyr::filter(ref %notin% c("A", "B"))
  
  expected <- c("C", "D", "E")
  actual <- filtered$ref
  
  expect_equal(actual, expected)
  
})
