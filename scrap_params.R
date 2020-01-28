#webscrap of the package params
library(rvest)
library(dplyr)
library(stringr)
scrap_function <- function(argumento){
  report <- xml2::read_html(argumento) %>%
    rvest::html_nodes("table") %>%
    rvest::html_nodes("tr") %>%
    rvest::html_text()
  marks <- list(c("Depends\n\t","LinkingTo\n\t", "Imports\n\t","Suggests\n\t"), #marks[[1]]
                c("Depends On Me\n\t","Suggests Me\n\t","Links To Me\n\t",     # marks[[2]]
                  "Imports Me"), "\\s*\\([^\\)]+\\)", "(")
  
  data1 <- data.frame(to = character(), from = character(), source = character(), stringsAsFactors = FALSE)
  
  for(j in 1:2){ # um for sobre os elementos 1 e 2 em marks
    for(k in 1:length(marks[[j]])){ # for do tamano de cada marks
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

scrap_function("http://bioconductor.org/packages/release/bioc/html/zlibbioc.html")

#testando pra arquivo
meus_pacotes <- readLines("links.txt")
scrap_function(meus_pacotes[[2]])
meus_pacotes[[1]]#this link is broken
