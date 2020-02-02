source("all_functions.R")
meus_pacotes <- readLines("links2.txt")
newlist3 <- list()
for(i in 1:length(meus_pacotes)){
  newlist3[[i]] <- tryCatch({
    scrap_function(meus_pacotes[i])}, 
    error = function(e){})
}
unique_dataframe <- bind_rows(newlist3)
save(unique_dataframe, file = "unique_df.RData")

