test_that("`survivalMedian` calculates median survival years",{
  expect_match(survivalMedian("India","liver","stage 1"),"5",all=FALSE,fixed=TRUE)
})
test_that("`survivalMedian` stops if cr_type is NA",{
  expect_error(survivalMedian("India",NA,"stage 1"))
})
test_that("`survivalMedian` stops if cr_stage is NA",{
  expect_error(survivalMedian("India","liver",NA))
})