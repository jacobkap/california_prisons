context("prisoners-and-parolees")

file1 <- system.file("data/PDF/prisoners_and_parolees_series",
                     "1997-1998-archive.pdf",
                     package = "californiaprisons")
file2 <- system.file("data/PDF/prisoners_and_parolees_series",
                     "2000-archive.pdf",
                     package = "californiaprisons")
file3 <- system.file("data/PDF/prisoners_and_parolees_series",
                     "2002-2003-archive.pdf",
                     package = "californiaprisons")
file4 <- system.file("data/PDF/prisoners_and_parolees_series",
                     "2006-archive.pdf",
                     package = "californiaprisons")
file5 <- system.file("data/PDF/prisoners_and_parolees_series",
                     "2009-archive.pdf",
                     package = "californiaprisons")

file6 <- system.file("data/PDF/prisoners_and_parolees_series",
                     "1993-1994-archive.pdf",
                     package = "californiaprisons")
file7 <- system.file("data/PDF/prisoners_and_parolees_series",
                     "1995-1996-archive.pdf",
                     package = "californiaprisons")

file1 <- clean_prisoners_parole(file1)
file2 <- clean_prisoners_parole(file2)
file3 <- clean_prisoners_parole(file3)
file4 <- clean_prisoners_parole(file4)
file5 <- clean_prisoners_parole(file5)
file6 <- clean_prisoners_parole(file6)
file7 <- clean_prisoners_parole(file7)


test_that("county is correct", {
  expect_equal(head(file1$county), c("alameda county",
                                     "alpine county",
                                     "amador county",
                                     "butte county",
                                     "calaveras county",
                                     "colusa county"))
  expect_equal(tail(file1$county), c("trinity county",
                                     "tulare county",
                                     "tuolumne county",
                                     "ventura county",
                                     "yolo county",
                                     "yuba county"))

  expect_equal(head(file2$county), c("alameda county",
                                     "alpine county",
                                     "amador county",
                                     "butte county",
                                     "calaveras county",
                                     "colusa county"))
  expect_equal(tail(file2$county), c("trinity county",
                                     "tulare county",
                                     "tuolumne county",
                                     "ventura county",
                                     "yolo county",
                                     "yuba county"))

  expect_equal(head(file3$county), c("alameda county",
                                     "alpine county",
                                     "amador county",
                                     "butte county",
                                     "calaveras county",
                                     "colusa county"))
  expect_equal(tail(file3$county), c("trinity county",
                                     "tulare county",
                                     "tuolumne county",
                                     "ventura county",
                                     "yolo county",
                                     "yuba county"))

  expect_equal(head(file4$county), c("alameda county",
                                     "alpine county",
                                     "amador county",
                                     "butte county",
                                     "calaveras county",
                                     "colusa county"))
  expect_equal(tail(file4$county), c("trinity county",
                                     "tulare county",
                                     "tuolumne county",
                                     "ventura county",
                                     "yolo county",
                                     "yuba county"))

  expect_equal(head(file5$county), c("alameda county",
                                     "alpine county",
                                     "amador county",
                                     "butte county",
                                     "calaveras county",
                                     "colusa county"))
  expect_equal(tail(file5$county), c("trinity county",
                                     "tulare county",
                                     "tuolumne county",
                                     "ventura county",
                                     "yolo county",
                                     "yuba county"))

  expect_equal(head(file6$county), c("alameda county",
                                     "alpine county",
                                     "amador county",
                                     "butte county",
                                     "calaveras county",
                                     "colusa county"))
  expect_equal(tail(file6$county), c("trinity county",
                                     "tulare county",
                                     "tuolumne county",
                                     "ventura county",
                                     "yolo county",
                                     "yuba county"))

  expect_equal(head(file7$county), c("alameda county",
                                     "alpine county",
                                     "amador county",
                                     "butte county",
                                     "calaveras county",
                                     "colusa county"))
  expect_equal(tail(file7$county), c("trinity county",
                                     "tulare county",
                                     "tuolumne county",
                                     "ventura county",
                                     "yolo county",
                                     "yuba county"))
})

test_that("year is correct", {
  expect_equal(unique(head(file1$year)), 1997)
  expect_equal(unique(tail(file1$year)), 1998)

  expect_equal(unique(head(file2$year)), 2000)
  expect_equal(unique(tail(file2$year)), 2000)

  expect_equal(unique(head(file3$year)), 2002)
  expect_equal(unique(tail(file3$year)), 2003)

  expect_equal(unique(head(file4$year)), 2006)
  expect_equal(unique(tail(file4$year)), 2006)

  expect_equal(unique(head(file5$year)), 2009)
  expect_equal(unique(tail(file5$year)), 2009)

  expect_equal(unique(head(file6$year)), 1993)
  expect_equal(unique(tail(file6$year)), 1994)

  expect_equal(unique(head(file7$year)), 1995)
  expect_equal(unique(tail(file7$year)), 1996)
})


test_that("total count is correct", {
  expect_equal(head(file1$total_admission_count), c(1724, 2, 42, 368, 46, 53))
  expect_equal(tail(file1$total_admission_count), c(25, 876, 105, 815, 394, 189))

  expect_equal(head(file2$total_admission_count), c(1935, 0, 32, 340, 18, 23))
  expect_equal(tail(file2$total_admission_count), c(14, 668, 74, 709, 391, 138))

  expect_equal(head(file3$total_admission_count), c(1453, 3, 56, 387, 40, 30))
  expect_equal(tail(file3$total_admission_count), c(32, 812, 68, 591, 391, 201))

  expect_equal(head(file4$total_admission_count), c(1437, 1, 76, 554, 76, 29))
  expect_equal(tail(file4$total_admission_count), c(31, 1030, 108, 903, 431, 228))

  expect_equal(head(file5$total_admission_count), c(1213, 1, 69, 437, 49, 33))
  expect_equal(tail(file5$total_admission_count), c(23, 899, 76, 821, 525, 193))

  expect_equal(head(file6$total_admission_count), c(1928, 1, 44, 368, 19, 33))
  expect_equal(tail(file6$total_admission_count), c(23, 631, 58, 644, 224, 151))

  expect_equal(head(file7$total_admission_count), c(1754, 5, 19, 344, 14, 34))
  expect_equal(tail(file7$total_admission_count), c(21, 764, 92, 843, 329, 159))
})

test_that("total percent is correct", {
  expect_equal(head(file1$total_admission_percent), c(2.7, 0, 0.1, 0.6, 0.1, 0.1))
  expect_equal(tail(file1$total_admission_percent), c(0, 1.4, 0.2, 1.3, 0.6, 0.3))

  expect_equal(head(file2$total_admission_percent), c(3.4, 0, 0.1, 0.6, 0, 0))
  expect_equal(tail(file2$total_admission_percent), c(0, 1.2, 0.1, 1.3, 0.7, 0.2))

  expect_equal(head(file3$total_admission_percent), c(2.7, 0, 0.1, 0.7, 0.1, 0.1))
  expect_equal(tail(file3$total_admission_percent), c(0.1, 1.4, 0.1, 1, 0.7, 0.3))

  expect_equal(head(file4$total_admission_percent), c(2.1, 0, 0.1, 0.8, 0.1, 0))
  expect_equal(tail(file4$total_admission_percent), c(0, 1.5, 0.2, 1.3, 0.6, 0.3))

  expect_equal(head(file5$total_admission_percent), c(1.8, 0, 0.1, 0.6, 0.1, 0))
  expect_equal(tail(file5$total_admission_percent), c(0, 1.3, 0.1, 1.2, 0.8, 0.3))

  expect_equal(head(file6$total_admission_percent), c(3.1, 0, 0.1, 0.6, 0, 0.1))
  expect_equal(tail(file6$total_admission_percent), c(0, 1.1, 0.1, 1.1, 0.4, 0.3))

  expect_equal(head(file7$total_admission_percent), c(2.8, 0, 0, 0.5, 0, 0.1))
  expect_equal(tail(file7$total_admission_percent), c(0, 1.2, 0.1, 1.3, 0.5, 0.2))
})

test_that("felon count is correct", {
  expect_equal(head(file1$felon_new_admission_count), c(1159, 2, 36, 315, 38, 49))
  expect_equal(tail(file1$felon_new_admission_count), c(21, 703, 96, 612, 302, 131))

  expect_equal(head(file2$felon_new_admission_count), c(1424, 0, 28, 290, 14, 20))
  expect_equal(tail(file2$felon_new_admission_count), c(10, 519, 65, 545, 284, 109))

  expect_equal(head(file3$felon_new_admission_count), c(1019, 3, 48, 341, 34, 22))
  expect_equal(tail(file3$felon_new_admission_count), c(27, 634, 60, 437, 286, 160))

  expect_equal(head(file4$felon_new_admission_count), c(1029, 1, 66, 452, 63, 24))
  expect_equal(tail(file4$felon_new_admission_count), c(23, 782, 86, 679, 288, 177))

  expect_equal(head(file5$felon_new_admission_count), c(904, 1, 60, 336, 41, 32))
  expect_equal(tail(file5$felon_new_admission_count), c(18, 660, 65, 603, 433, 140))

  expect_equal(head(file6$felon_new_admission_count), c(1286, 1, 37, 305, 17, 26))
  expect_equal(tail(file6$felon_new_admission_count), c(20, 466, 52, 505, 156, 105))

  expect_equal(head(file7$felon_new_admission_count), c(1217, 5, 15, 290, 13, 27))
  expect_equal(tail(file7$felon_new_admission_count), c(17, 610, 78, 676, 236, 116))
})

test_that("felon percent is correct", {
  expect_equal(head(file1$felon_new_admission_percent), c(2.5, 0, 0.1, 0.7, 0.1, 0.1))
  expect_equal(tail(file1$felon_new_admission_percent), c(0, 1.5, 0.2, 1.3, 0.6, 0.3))

  expect_equal(head(file2$felon_new_admission_percent), c(3.5, 0, 0.1, 0.7, 0, 0))
  expect_equal(tail(file2$felon_new_admission_percent), c(0, 1.3, 0.2, 1.4, 0.7, 0.3))

  expect_equal(head(file3$felon_new_admission_percent), c(2.6, 0, 0.1, 0.9, 0.1, 0.1))
  expect_equal(tail(file3$felon_new_admission_percent), c(0.1, 1.5, 0.1, 1.0, 0.7, 0.4))

  expect_equal(head(file4$felon_new_admission_percent), c(2.1, 0, 0.1, 0.9, 0.1, 0))
  expect_equal(tail(file4$felon_new_admission_percent), c(0, 1.6, 0.2, 1.4, 0.6, 0.4))

  expect_equal(head(file5$felon_new_admission_percent), c(1.9, 0, 0.1, 0.7, 0.1, 0.1))
  expect_equal(tail(file5$felon_new_admission_percent), c(0, 1.4, 0.1, 1.3, 0.9, 0.3))

  expect_equal(head(file6$felon_new_admission_percent), c(3, 0, 0.1, 0.7, 0, 0.1))
  expect_equal(tail(file6$felon_new_admission_percent), c(0, 1.1, 0.1, 1.2, 0.4, 0.3))

  expect_equal(head(file7$felon_new_admission_percent), c(2.7, 0, 0, 0.6, 0, 0.1))
  expect_equal(tail(file7$felon_new_admission_percent), c(0, 1.3, 0.2, 1.5, 0.5, 0.2))
})

test_that("parole violator count is correct", {
  expect_equal(head(file1$parole_violator_new_term_count), c(565, 0, 6, 53, 8, 4))
  expect_equal(tail(file1$parole_violator_new_term_count), c(4, 173, 9, 203, 92, 58))

  expect_equal(head(file2$parole_violator_new_term_count), c(511, 0, 4, 50, 4, 3))
  expect_equal(tail(file2$parole_violator_new_term_count), c(4, 149, 9, 164, 107, 29))

  expect_equal(head(file3$parole_violator_new_term_count), c(434, 0, 8, 46, 6, 8))
  expect_equal(tail(file3$parole_violator_new_term_count), c(5, 178, 8, 154, 105, 41))

  expect_equal(head(file4$parole_violator_new_term_count), c(408, 0, 10, 102, 13, 5))
  expect_equal(tail(file4$parole_violator_new_term_count), c(8, 248, 22, 224, 143, 51))

  expect_equal(head(file5$parole_violator_new_term_count), c(309, 0, 9, 101, 8, 1))
  expect_equal(tail(file5$parole_violator_new_term_count), c(5, 239, 11, 218, 92, 53))

  expect_equal(head(file6$parole_violator_new_term_count), c(642, 0, 7, 63, 2, 7))
  expect_equal(tail(file6$parole_violator_new_term_count), c(3, 165, 6, 139, 68, 46))

  expect_equal(head(file7$parole_violator_new_term_count), c(537, 0, 4, 54, 1, 7))
  expect_equal(tail(file7$parole_violator_new_term_count), c(4, 154, 14, 167, 93, 43))


})

test_that("parole violator percent is correct", {
  expect_equal(head(file1$parole_violator_new_term_percent), c(3.2, 0, 0, 0.3, 0, 0))
  expect_equal(tail(file1$parole_violator_new_term_percent), c(0, 1, 0.1, 1.2, 0.5, 0.3))

  expect_equal(head(file2$parole_violator_new_term_percent), c(3.2, 0, 0, 0.3, 0, 0))
  expect_equal(tail(file2$parole_violator_new_term_percent), c(0, 0.9, 0.1, 1, 0.7, 0.2))

  expect_equal(head(file3$parole_violator_new_term_percent), c(3, 0, 0.1, 0.3, 0, 0.1))
  expect_equal(tail(file3$parole_violator_new_term_percent), c(0, 1.1, 0.1, 1, 0.7, 0.3))

  expect_equal(head(file4$parole_violator_new_term_percent), c(2, 0, 0, 0.5, 0.1, 0))
  expect_equal(tail(file4$parole_violator_new_term_percent), c(0, 1.2, 0.1, 1.1, 0.7, 0.2))

  expect_equal(head(file5$parole_violator_new_term_percent), c(1.5, 0, 0, 0.5, 0, 0))
  expect_equal(tail(file5$parole_violator_new_term_percent), c(0, 1.1, 0.1, 1, 0.4, 0.3))

  expect_equal(head(file6$parole_violator_new_term_percent), c(3.4, 0, 0, 0.3, 0, 0))
  expect_equal(tail(file6$parole_violator_new_term_percent), c(0, 1, 0, 0.8, 0.4, 0.3))

  expect_equal(head(file7$parole_violator_new_term_percent), c(3.1, 0, 0, 0.3, 0, 0))
  expect_equal(tail(file7$parole_violator_new_term_percent), c(0, 0.9, 0.1, 1.0, 0.5, 0.2))
})
