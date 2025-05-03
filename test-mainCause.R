test_that("`mainCause` outputs the major cause of a cancer type in a country",{
  expect_match(mainCause("Australia","Breast"),"Smoking",fixed=TRUE)
})
test_that("`mainCause` stops if cr_type is NA",{
  expect_error(mainCause("India",NA))
})
test_that("`mainCause` stops if country is NA",{
  expect_error(mainCause(NA,"liver"))
})
