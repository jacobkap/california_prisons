# download_prisoners_parolees_series()
# download_weekly_population()
# download_monthly_population()


download_prisoners_parolees_series <- function() {
  library(rvest)
  url <- "https://sites.cdcr.ca.gov/research/archived-research/"
  page <- read_html(url)

  links <-
    page %>%
    html_nodes("a") %>%
    html_attr("href")
  links <- links[grepl("archive", links, ignore.case = TRUE)]
  links <- links[!grepl("archived-and-specialized-research",
                       links,
                       ignore.case = TRUE)]

  setwd("C:/Users/user/Dropbox/R_project/californiaprisons/data/PDF/prisoners_and_parolees_series")
  for (link in links) {
    link_name <- gsub("https://sites.cdcr.ca.gov/research/wp-content/uploads/sites/9/2018/04/", "", link)
    download.file(link, destfile = link_name, mode = "wb")

  }
}

download_weekly_population <- function() {
  library(rvest)
  url <- "https://sites.cdcr.ca.gov/research/population-reports/weekly-total-population-report-archive/"
  page <- read_html(url)

  links <-
    page %>%
    html_node("iframe") %>%
    html_attr("src") %>%
    read_html() %>%
    html_nodes("a") %>%
    html_attr("href")
  links <- paste0("https://www.cdcr.ca.gov", links)

  setwd("C:/Users/user/Dropbox/R_project/californiaprisons/data/PDF/weekly_population")
  for (link in links) {
    link_name <- gsub(".*WeeklyWed/TPOP1A/TPOP1Ad", "", link)
    year      <- substr(link_name, 1, 2)
    if (substr(year, 1, 1) == "9") {
      year <- paste0("19", year)
    } else {
      year <- paste0("20", year)
    }
    month      <- as.numeric(substr(link_name, 3, 4))
    month      <- tolower(month.name[month])

    day        <- as.numeric(substr(link_name, 5, 6))
    link_name  <- paste0("weekly_", year, "_", month, "_", day, ".pdf")


    download.file(link, destfile = link_name, mode = "wb")

  }
}

download_monthly_population <- function() {
  library(rvest)
  url <- "https://sites.cdcr.ca.gov/research/population-reports/monthly-total-population-report-archive/"
  page <- read_html(url)

  links <-
    page %>%
    html_node("iframe") %>%
    html_attr("src") %>%
    read_html() %>%
    html_nodes("a") %>%
    html_attr("href")
  links <- paste0("https://www.cdcr.ca.gov", links)

  setwd("C:/Users/user/Dropbox/R_project/californiaprisons/data/PDF/monthly_population")
  for (link in links) {
    link_name <- gsub(".*Monthly/TPOP1A/TPOP1Ad", "", link)
    year      <- substr(link_name, 1, 2)
    if (substr(year, 1, 1) == "9") {
      year <- paste0("19", year)
    } else {
      year <- paste0("20", year)
    }
    month      <- as.numeric(substr(link_name, 3, 4))
    month      <- tolower(month.name[month])
    link_name  <- paste0("monthly_", year, "_", month, ".pdf")

    download.file(link, destfile = link_name, mode = "wb")

  }
}


