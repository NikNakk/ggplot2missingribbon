test_that("png output", {
  check_png("test.png")
  expect_snapshot_file("test.png")
})
