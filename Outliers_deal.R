outliers_deal <- function(x, s, e, f){
  
  # x = dataframe
  # s = index of first col to take
  # e = index of last column to take
  # f =  method to replace outliers (mean, median, mode)
  
  for(i in s:e){
    
    Q1 <- quantile(x[,i], 0.25, names = FALSE)
    Q3 <- quantile(x[,i], 0.75, names = FALSE)
    iqr <- IQR(x[,i])
    low <- Q1 - iqr*1.5
    up <- Q3 + iqr*1.5
    val <- f(x[,i])
    
    x[,i] <- ifelse((x[,i] < low) | (x[,i] > up), val, x[,i])
  }
  
  return(x)
}

#example
w <- data.frame(col1 = c(1, 2, 3, 4, 5, 90, 6),
                col2 = c(13, 60, 13, 18, 13, 12, 0),
                col3 = c(1, 899, 5, 4, 3, 8, 6))
print(w)
outliers_deal(w, 1, 3, median)