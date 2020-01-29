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
meus_pacotes <- readLines("links2.txt")



#this way, i can have a list with every created dataframes by the scrap_function
#there are many link broken packages, therefore maybe is a good idea to scrap the links from the website.
#in this list, I am receiving the linkage, I don't care about the params, only the amount of linkages
newlist2 <- list()
for(i in 1:length(meus_pacotes)){
  newlist2[[i]] <- scrap_function(meus_pacotes[i])
  print(paste(meus_pacotes[i],"Success"))
}
length(newlist2)

