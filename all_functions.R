library(rvest)
library(dplyr)
library(stringr)
library(httr)

scrap_function <- function(argumento){
  report <- xml2::read_html(argumento) %>%
    rvest::html_nodes("table") %>%
    rvest::html_nodes("tr") %>%
    rvest::html_text()
  marks <- list(c("Depends\n\t","LinkingTo\n\t", "Imports\n\t","Suggests\n\t"), #marks[[1]]
                c("Depends On Me\n\t","Suggests Me\n\t","Links To Me\n\t",     # marks[[2]]
                  "Imports Me"), "\\s*\\([^\\)]+\\)", "(")
  
  data1 <- data.frame(to = character(), from = character(), source = character(), stringsAsFactors = FALSE)
  
  for(j in 1:2){ 
    for(k in 1:length(marks[[j]])){ 
      object <-gsub(marks[[j]][k], " ", report[grepl(report, pattern = marks[[j]][k])])  
      object <- unlist(lapply(strsplit(object,","), FUN = function(x){
        str_trim(x, side = "both")
      }))
      if(sum(grepl(marks[[4]][1], object, fixed = TRUE)) > 0 ){
        object <- gsub(marks[[3]][1], "", object)
        
      }
      if("" != object[1]) {
        nome <- data.table::last(stringr::str_split(argumento,pattern = "/")[[1]])
        nome <- gsub(".html", "", nome)
        data1 <- rbind(data1, data.frame(to = (object), from = rep(nome, length(object)), source = rep(gsub("\n\t", "",marks[[j]][k]), length(object)), stringsAsFactors = FALSE))
      }
    }
    if(j == 2){
      return(data1)}
  }
  
}


extract_links <- function(links_html){
  webpage <- read_html(links_html) %>%
    rvest::html_nodes('#PageContent') %>%
    rvest::html_nodes('table') %>%
    rvest::html_nodes('a') %>%
    rvest::html_attr("href")
  return(write.table(webpage,  "links2.txt", append = FALSE, quote = FALSE, sep = " ", eol = "\n", na = "NA", dec = ".", row.names = FALSE, col.names = FALSE, qmethod = c("escape", "double")))
}

download_packages <- function(linksfile){
  i <- 0
  for(link in linksfile){
    if(i == 10){
      t <- runif(1, 1.0, 4.0)
      Sys.sleep(t)
      link2 <- gsub("https://www.bioconductor.org/packages/release/bioc/html/", "" ,link)
      download.file(link, destfile=paste('./pages/', link2), method="libcurl")
      i <- i + 1
    }else{
      i <- i + 1
      link2 <- gsub("https://www.bioconductor.org/packages/release/bioc/html/", "" ,link)
      download.file(link, paste('./pages/', link2), method="libcurl")
    }
  }
}



