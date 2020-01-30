library(rvest)
library(httr)

extract_links <- function(links_html){
  webpage <- read_html(links_html)
  webpage <- html_nodes(webpage, '#PageContent')
  webpage <- html_nodes(webpage, 'table')
  webpage <- html_nodes(webpage, 'a')
  webpage <- html_attr(webpage, "href")
  webpage
  return (write.table(webpage,  "links3.txt", append = FALSE, quote = FALSE, sep = " ", eol = "\n", na = "NA", dec = ".", row.names = FALSE, col.names = FALSE, qmethod = c("escape", "double")))
}
url <- 'links2.html'
extract_links(url)
