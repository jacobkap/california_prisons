# setwd("C:/Users/user/Dropbox/R_project/californiaprisons/data/PDF/weekly_population")
# library(stringr)
# library(dplyr)
# library(lubridate)
# library(readr)
# files <- list.files(full.names = TRUE)
#
# final_data <- data.frame(stringsAsFactors = FALSE)
# for (file in files) {
#   if (file == "./weekly_2014_february_5.pdf") next
#
#   temp <- pdftools::pdf_text(file)
#   temp <- unlist(strsplit(temp, split = "\n"))
#   temp <- trimws(temp)
#   temp <- tolower(temp)
#
#   start <- grep("institutions/camps \\s+ other ", temp)
#   end   <- grep("page\\s+2", temp)
#   end   <- end[1]
#
#
#   temp <- temp[start:end]
#   substr(temp, 46, 55)[trimws(substr(temp, 46, 56)) == ""] <- "   0   "
#
#   temp <- gsub("\\s+\\(", " \\(", temp)
#   temp <- data.frame(stringr::str_split_fixed(temp, "\\s{2,}", 7))
#   temp[] <- sapply(temp, trimws)
#   temp[] <- sapply(temp, function(x) na_if(x, ""))
#   temp[] <- sapply(temp, function(x) na_if(x, "-"))
#   temp[2:7] <- suppressWarnings(sapply(temp[2:7], parse_number))
#
#   temp <- temp[complete.cases(temp), ]
#   names(temp) <- c("institution",
#                    "felon_or_other_count",
#                    "civil_addict_count",
#                    "total_count",
#                    "design_capacity",
#                    "percent_occupied",
#                    "staffed_capacity")
#   temp <- temp[!grepl("total:$", temp$institution), ]
#   #temp$institution <- gsub("\\(.*", "", temp$institution)
#   temp$institution <- trimws(temp$institution)
#
#   year  <- gsub(".*weekly_([0-9]{4}).*", "\\1", file)
#   month <- gsub(".*[0-9]{4}_(.*)_.*", "\\1", file)
#   day   <- gsub(".*_([0-9]+).pdf", "\\1", file)
#   day   <- as.numeric(day)
#   date  <- ymd(paste(year, month, day))
#
#   temp$year  <- year
#   temp$month <- month
#   temp$day   <- day
#   temp$date  <- date
#   temp <-
#     temp %>%
#     dplyr::select(institution,
#                   year,
#                   month,
#                   day,
#                   date,
#                   everything())
#
#   temp$institution[grep("^scc", temp$institution)[2]] <-
#     "scc (sierra conserv ctr) - female"
#   temp$institution[grep("^scc", temp$institution)[1]] <-
#     "scc (sierra conserv ctr) - male"
#   temp$institution[grep("^fol", temp$institution)[2]] <-
#     "fol (folsom sp) - female"
#   temp$institution[grep("^fol", temp$institution)[1]] <-
#     "fol (folsom sp) - male"
#   temp$institution[grep("^crc", temp$institution)[2]] <-
#     "crc (cal rehab center) - female"
#   temp$institution[grep("^crc", temp$institution)[1]] <-
#     "crc (cal rehab center) - male"
#   temp$institution <- gsub("\\*", "", temp$institution)
#   temp$institution <- gsub("larc", "lac", temp$institution)
#
#   final_data <- bind_rows(final_data, temp)
# }
#
# facilities <- data.frame(institution = c(
#                                        "asp",
#                                        "cal",
#                                        "ccc",
#                                        "cci",
#
#                                        "cen",
#                                        "chcf",
#                                        "cim",
#                                        "cmc",
#
#                                        "cmf",
#                                        "cor",
#                                        "crc",
#                                        "ctf",
#
#                                        "cvsp",
#                                        "dvi",
#                                        "fol",
#                                        "hdsp",
#
#                                        "isp",
#                                        "kvsp",
#                                        "lac",
#                                        "mcsp",
#
#                                        "nksp",
#                                        "pbsp",
#                                        "pvsp",
#                                        "rjd",
#
#                                        "sac",
#                                        "satf",
#                                        "scc",
#                                        "sol",
#
#                                        "sq",
#                                        "svsp",
#                                        "vsp",
#                                        "wsp",
#
#                                        "ccwf",
#                                        "ciw",
#                                        "fol"),
#                        real_name   = c("",
#                                        "",
#                                        "",
#                                        "",
#
#                                        "",
#                                        "",
#                                        "",
#                                        "",
#
#                                        "",
#                                        "",
#                                        "",
#                                        "",
#
#                                        "",
#                                        "",
#                                        "",
#                                        "",
#
#                                        "",
#                                        "",
#                                        "",
#                                        "",
#
#                                        "",
#                                        "",
#                                        "",
#                                        "",
#
#                                        "",
#                                        "",
#                                        "",
#                                        "",
#
#                                        "",
#                                        "",
#                                        "",
#                                        "",
#
#                                        "",
#                                        "",
#                                        ""),
#                        stringsAsFactors = FALSE)
