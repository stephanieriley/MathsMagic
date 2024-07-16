

x<- 13

num<- x %/% 2
remainder<- x - (num*2)

bin<- c()
while(x>0){
  num<- x %/% 2
  remainder<- x - (num*2)
  
  bin<- c(bin, remainder)
  
  x<- num
}


int2bin<- function(x, bits = 4, reverse.binary = F) {
  binshort<- c()
  while(x>0){
    num<- x %/% 2
    remainder<- x - (num*2)
    
    binshort<- c(binshort, remainder)
    
    x<- num
  }
  
  #Make sure there are enough bits for the binary number
  if(bits<length(binshort)){stop("Larger number of bits required")}
  
  
  if(reverse.binary){
    #If you want the binary number in reverse order
    #This is done to help calculate the cards
    bin<- c(binshort, rep(0, length.out = (bits - length(binshort))))
  } else {
    #If you want the binary number in its usual order
    #This feels counter-intuitive using rev(), but the algorithm above gives you the binary number in reverse
    bin<- c(rep(0, length.out = (bits - length(binshort))) , rev(binshort))
  }
  
  return(bin)
}

int2bin(20, bits = 5)



### To create a binary matrix
integers<- 1:31

binarymatrix<- t(sapply(integers, int2bin, bits = 6))
colnames(binarymatrix)<- rev(2^(1:ncol(binarymatrix)))
binarymatrix






#Write general function
ncards<- 3
maxvalue<- 2^ncards - 1
integers<- 1:maxvalue

binarymatrix<- t(sapply(integers, int2bin, bits = 6, reverse = T))
colnames(binarymatrix)<- 2^(1:ncol(binarymatrix))
binarymatrix


card1<- matrix(which(binarymatrix[,1] == 1), nrow = 2)
card2<- matrix(which(binarymatrix[,2] == 1), nrow = 2)
card3<- matrix(which(binarymatrix[,3] == 1), nrow = 2)


data.frame(rbind(card1, card2, card3))




#Write general function
ncards<- 3
maxvalue<- 2^ncards - 1
integers<- 1:maxvalue

binarymatrix<- t(sapply(integers, int2bin, bits = 6, reverse = T))
colnames(binarymatrix)<- 2^(1:ncol(binarymatrix))
binarymatrix


card1<- matrix(which(binarymatrix[,1] == 1), nrow = 2)
card2<- matrix(which(binarymatrix[,2] == 1), nrow = 2)
card3<- matrix(which(binarymatrix[,3] == 1), nrow = 2)


data.frame(rbind(card1, card2, card3))




ncards<- 6
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




#Create a function
generate.cards<- function(ncards){
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

cards<-generate.cards(ncards = 4)

write.csv(cards, "cards.csv", row.names = F, col.names = F, na = " ")

