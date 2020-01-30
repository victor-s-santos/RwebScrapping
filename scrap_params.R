#webscrap of the package params
source("all_functions.R")
scrap_function("http://bioconductor.org/packages/release/bioc/html/zlibbioc.html")
meus_pacotes <- readLines("links2.txt")
package1 <- scrap_function(meus_pacotes[[1]])
class(package1)
