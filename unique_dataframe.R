source("all_functions.R")
meus_pacotes <- readLines("links2.txt")
newlist2 <- list()
for(i in 1:length(meus_pacotes)){
  newlist2[[i]] <- try(scrap_function(meus_pacotes[i]))
  print(paste(meus_pacotes[i],"Success"))
  if(inherits(newlist2[[i]], "Anything")){
    next
  }
}
length(newlist2)
save(newlist2, file = "list_of_all_df.RData")
