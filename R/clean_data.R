#
# california_county_prison_admissions <- get_clean_prison_parolee()
# setwd("C:/Users/user/Dropbox/R_project/californiaprisons/data/clean")
# summary(california_county_prison_admissions)
# table(california_county_prison_admissions$county)
# table(california_county_prison_admissions$year)
# head(california_county_prison_admissions)
# names(california_county_prison_admissions)
# table(nchar(names(california_county_prison_admissions)))
#
# save_files(california_county_prison_admissions,
#            "_1993_2010",
#            file_name = "california_county_prison_admissions",
#            save_name = "california_county_prison_admissions")
#

get_clean_prison_parolee <- function() {
  source('C:/Users/user/Dropbox/R_project/californiaprisons/R/utils.R')
  setwd("C:/Users/user/Dropbox/R_project/californiaprisons/data/PDF/prisoners_and_parolees_series")

  files <- list.files(full.names = TRUE)
  files <- files[substr(files, 3, 6) %in% 1993:2010]

  final_data <- data.frame(stringsAsFactors = FALSE)
  for (file in files) {
    data <- clean_prisoners_parole(file)
    message(file)
    final_data <- dplyr::bind_rows(final_data, data)
  }
  final_data <-
    final_data %>%
    dplyr::distinct() %>%
    dplyr::arrange(desc(year),
                   county)
  return(final_data)
}

clean_prisoners_parole <- function(file) {
  txt <- pdftools::pdf_text(file)
  txt <- unlist(strsplit(txt, split = "\n"))
  txt <- gsub("171.2 11,813", "171.2   11,813", txt)
  txt <- trimws(txt)

  total_table_start <-
    grep("^TOTAL FELON NEW ADMISSIONS AND PAROLE VIOLATORS RETURNED WITH A NEW TERM",
         txt, ignore.case = TRUE)
  total_table_start <- total_table_start[total_table_start > 150]
  male_table_start  <-
    grep("^MALE FELON NEW ADMISSIONS AND PAROLE VIOLATORS RETURNED WITH A NEW TERM",
         txt, ignore.case = TRUE)

  for (i in 1:length(total_table_start)) {
    if (grepl("continued", txt[total_table_start[i] - 1], ignore.case = TRUE)) {
      total_table_start <- total_table_start[-i]
    }
  }
  for (i in 1:length(male_table_start)) {
    if (grepl("continued", txt[male_table_start[i] - 1], ignore.case = TRUE)) {
      male_table_start <- male_table_start[-i]
    }
  }

  data <- data.frame(stringsAsFactors = FALSE)
  for (i in 1:length(total_table_start)) {
    temp <- txt[total_table_start[i]:male_table_start[i]]
    temp <- temp[grep("^county of$", temp, ignore.case = TRUE):length(temp)]
    temp <- data.frame(stringr::str_split_fixed(temp, "\\s{2,}", 8),
                       stringsAsFactors = FALSE)
    temp[] <- sapply(temp, function(x) dplyr::na_if(x, ""))
    temp <- temp[complete.cases(temp), ]
    names(temp) <- c("county",
                     "total_admission_count",
                     "total_admission_percent",
                     "total_rate_per_100k_county_pop",
                     "felon_new_admission_count",
                     "felon_new_admission_percent",
                     "parole_violator_new_term_count",
                     "parole_violator_new_term_percent")
    temp[2:8] <- sapply(temp[2:8], readr::parse_number)
    year <- txt[total_table_start[i] + 3]
    year <- readr::parse_number(year)
    temp$year <- year

    if (year == 2009) {
      ventura_2009 <- data.frame(county                               = "Ventura",
                                 year                                 = 2009,
                                 total_admission_count                = 821,
                                 total_admission_percent              = 1.2,
                                 total_rate_per_100k_county_pop       = 97.0,
                                 felon_new_admission_count            = 603,
                                 felon_new_admission_percent          = 1.3,
                                 parole_violator_new_term_count  = 218,
                                 parole_violator_new_term_percent     = 1.0,
                                 stringsAsFactors = FALSE)
      temp <- dplyr::bind_rows(temp, ventura_2009)
    }
    if (year == 2002) {
      temp$felon_new_admission_percent[temp$county == "Merced"] <- 0.8
      temp$total_admission_percent[temp$county == "Merced"] <- 0.7
    }

    temp <-
      temp %>%
      dplyr::mutate(county = tolower(county),
                    county = paste(county, "county")) %>%
      dplyr::filter(county != "total county") %>%
      dplyr::left_join(county_fips) %>%
      dplyr::arrange(county,
                     year) %>%
      dplyr::select(county,
                    year,
                    state_county_fips,
                    state_fips_code,
                    county_fips_code,
                    tidyselect::everything())
     data <- dplyr::bind_rows(data, temp)
  }
  return(data)
}
