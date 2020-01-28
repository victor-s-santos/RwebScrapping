library(rvest)
library(httr)

url <- 'links2.html'
webpage <- read_html(url)
webpage <- html_nodes(webpage, '.dataTable')
webpage <- html_nodes(webpage, 'a')
webpage <- html_attr(webpage, "href")
webpage
write.table(webpage,  "links2.txt", append = FALSE, quote = FALSE, sep = " ", eol = "\n", na = "NA", dec = ".", row.names = FALSE, col.names = FALSE, qmethod = c("escape", "double"))

