###### Function to creates cards for the magic trick
generateCards<- function(ncards){
  maxvalue<- 2^ncards - 1
  integers<- 1:maxvalue
  
  binarymatrix<- t(sapply(integers, int2bin, bits = 6, reverse = T))
  colnames(binarymatrix)<- 2^(1:ncol(binarymatrix))
  
  cards<- data.frame()
  for (i in 1:ncards) {
    cards<- data.frame(rbind(cards,
                             matrix(which(binarymatrix[,i] == 1), nrow = 2, byrow = T),
                             #Include 2 rows of NA to separate the cards
                             NA,
                             NA))
  }
  
  return(cards)
}