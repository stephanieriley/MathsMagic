###### Function to creates cards for the magic trick
generateCards<- function(ncards, altogether = F){
  #altogether:  this argument is used for the purpose of presenting the cards
  #             as separate tables within the app, or as one data frame for
  #             export to csv
  
  maxvalue<- 2^ncards - 1
  integers<- 1:maxvalue
  
  binarymatrix<- t(sapply(integers, int2bin, bits = 6, reverse = T))
  colnames(binarymatrix)<- 2^(1:ncol(binarymatrix))
  
  if(altogether){
    cards<- data.frame()
    for (i in 1:ncards) {
      #Want to print the card number in the row above the card, but don't want
      #it to be repeated in each column
      cardname<- c(paste0("Card ", i),
                   rep("", length(which(binarymatrix[,i] == 1)) / 2))
      cards<- data.frame(rbind(cards,
                               cardname,
                               #Extract only the numbers that have 1 in column i
                               matrix(which(binarymatrix[,i] == 1), nrow = 2, byrow = T),
                               #Include a row of NA to separate the cards
                               ""))
    }
  }
  
  if(!altogether){
    cards<- list()
    for (i in 1:ncards) {
      cards[[i]]<- matrix(which(binarymatrix[,i] == 1), nrow = 2, byrow = T)
    }
  }
  
  return(cards)
}