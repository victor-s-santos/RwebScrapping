source("all_functions.R")
meus_pacotes <- readLines("links2.txt")
newlist2 <- list()
for(i in 1:length(meus_pacotes)){
  newlist3[[i]] <- try(scrap_function(meus_pacotes[i]))
  print(paste(meus_pacotes[i],"Success"))
  if(inherits(newlist3[[i]], "Anything")){
    next
  }
}
length(newlist2)
print(newlist2[89])
print(newlist2[1364])
print(newlist2[1477])
print(newlist2[1521])
#these are the broken packages
#save(newlist2, file = "list_of_all_df.RData")
unique_dataframe <- bind_rows(newlist2)
