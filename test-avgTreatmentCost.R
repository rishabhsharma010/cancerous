test_that("`avgTreatmentCost` calculates average cost",{
  expect_match(avgTreatmentCost("liver","stage 1"),"$53388",all=FALSE,fixed=TRUE)
})
test_that("`avgTreatmentCost` stops if cancer_type is NA",{
  expect_error(avgTreatmentCost(NA,"stage 1"))
})
test_that("`avgTreatmentCost` stops if cancer_stage is NA",{
  expect_error(avgTreatmentCost("liver",NA))
})