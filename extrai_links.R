library(rvest)
library(httr)

url <- 'links.html'
webpage <- read_html(url)
webpage <- html_nodes(webpage, '.dataTable')
webpage <- html_nodes(webpage, 'a')
webpage <- html_attr(webpage, "href")
#this way, I can extract all the package links contained in 
#https://www.bioconductor.org/packages/release/bioc/
webpage
write.table(webpage,  "links.txt", append = FALSE, quote = TRUE, sep = " ", eol = "\n", na = "NA", dec = ".", row.names = FALSE, col.names = FALSE, qmethod = c("escape", "double"))


