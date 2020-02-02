#scrap from local pages
source("all_functions.R")
getwd()
directory_pages <- list.files(path = "./pages/")
directory_pages
package1 <- scrap_function(paste("./pages/", directory_pages[1], sep = ""))

