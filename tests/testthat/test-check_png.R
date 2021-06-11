test_that("png output", {
  check_png("test.png")
  expect_snapshot_file("test.png")
})

test_that("png output grid", {
  check_png_grid("test_grid.png")
  expect_snapshot_file("test_grid.png")
})
