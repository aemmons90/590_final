install.packages("rlist")
library(rlist)

###Doesn't work yet
cq_norm <- function(df, k, l, x){
  z<-split(df[[k]], df[[l]])
  for(a in z) {
    if(exists(is.element(a[1:2]))==TRUE)
      if((a[1]-a[2]) <= abs(x)) a[1:2]<-NULL
      ifelse(exists(is.element(a[1:3]))==TRUE)
      if((((a[1]|a[2]) - a[3]) <= abs(x)) !=TRUE) a[3]<-NULL
      if((((a[2]|a[3]) - a[1]) <= abs(x)) !=TRUE) a[1]<-NULL
      if((((a[1]|a[3]) - a[2]) <= abs(x)) !=TRUE) a[2]<-NULL
  }
  return(z)
}

#Example
y<- cq_norm(x, "Cq", "Sample", 0.5)
