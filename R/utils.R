library(stringr)
library(dplyr)
library(readr)
library(haven)
library(lubridate)

save_files <- function(data, year, file_name, save_name, rda_only = FALSE) {
  data <-
    data %>%
    dplyr::mutate_if(is.Date, as.character)

  if (any(nchar(names(data)) > 30)) {
    print(names(data)[nchar(names(data)) > 30])
  }

  assign(paste0(file_name, year), data) # Change name
  save( list = paste0(file_name, year),
        file = paste0(save_name, year, ".rda"))

  if (rda_only == FALSE) {
    codebook_name <- paste0(file_name, "_codebook_", year, ".txt")
    codebook_name <- gsub("__", "_", codebook_name)
    codebook_name <- gsub("_\\.", "\\.", codebook_name)
    memisc::Write(memisc::codebook(data),
                  file = codebook_name)
    convert_codebook_to_pdf(codebook_name)

    do.call("write_dta", list(as.name(paste0(file_name, year)),
                              path = paste0(save_name,
                                            year, ".dta")))

    do.call("write_csv", list(as.name(paste0(file_name, year)),
                              path = paste0(save_name,
                                            year, ".csv")))

    do.call("rm", list(as.name(paste0(file_name, year))))
  }
}

save_as_zip <- function(file_name, pattern = NULL) {
  file_ext <- c("rda", "dta", "csv")
  all_files <- list.files()
  if (!is.null(pattern)) {
    sps_files <- all_files[grep("maltz|manual|sps$|record description", all_files, ignore.case = TRUE)]
    all_files <- list.files(pattern = pattern)
    all_files <- c(sps_files, all_files)
  }

  codebooks <- all_files[grep("maltz|manual|codebook|pdf$|sps$",
                              all_files,
                              ignore.case = TRUE)]
  for (i in seq_along(file_ext)) {
    zip_files <- all_files[grep(file_ext[i], all_files)]
    zip_files <- c(zip_files, codebooks)
    zip_files <- sort(zip_files)

    zip::zip(zipfile = paste0(file_name,
                              file_ext[i], ".zip"),
             files = zip_files)
  }
}

convert_codebook_to_pdf <- function(file_name) {
  temp      <- readLines(file_name)
  old_name  <- file_name
  file_name <- gsub(".txt", ".Rmd", file_name)
  cat(temp, sep = "  \n", file = file_name)
  suppressMessages(rmarkdown::render(file_name,
                                     rmarkdown::pdf_document(), quiet = TRUE))
  file.remove(old_name)
  file.remove(file_name)
}


setwd("C:/Users/user/Dropbox/R_project/californiaprisons/data")
county_fips  <- readr::read_lines("california_census_county_fips.txt")
county_fips  <- stringr::str_split_fixed(county_fips, ",", 5)
county_fips  <- data.frame(county_fips, stringsAsFactors = FALSE)
county_fips  <-
  county_fips %>%
  dplyr::select(2:4) %>%
  dplyr::rename(state_fips_code = X2,
                county_fips_code = X3,
                county = X4) %>%
  dplyr::mutate(state_county_fips = paste0(state_fips_code, county_fips_code),
                county            = tolower(county))
county_fips  <- as.data.frame(county_fips)
