###### Function to change number to its binary form
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