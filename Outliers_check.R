outliers <- function(x, s, e){
  
  # x = dataframe
  # s = index of first col to take
  # e = index of last column to take
  
  p <- x
  
  for(i in s:e){
    
    Q1 <- quantile(p[,i], 0.25, names = FALSE)
    Q3 <- quantile(p[,i], 0.75, names = FALSE)
    iqr <- IQR(p[,i])
    low <- Q1 - iqr*1.5
    up <- Q3 + iqr*1.5
    
    p[,i] <- ((p[,i] < low) | (p[,i] > up))
  }
  
  p <- p %>% mutate(outliers_numb = rowSums(p[,s:e]))
  x$outliers_numb <- p$outliers_numb
  
  tot <- sum(x$outliers_numb)
  totr <- nrow(x %>% filter(outliers_numb > 0))
  perc <- (tot*100)/(nrow(x)*ncol(x))
  percr <- (totr*100)/nrow(x)
  
  
  print(paste("Total number of outliers:", round(tot, 0)))
  print(paste("% of outliers:", round(perc, 2)))
  print(paste("Total number of rows with outliers:", round(totr, 0)))
  print(paste("% of rows with outliers:", round(percr, 2)))
  
  print("Rows with outliers:")
  print(x %>% filter(outliers_numb > 0))
  
  return(x)
}


#example
w <- data.frame(col1 = c(1, 2, 3, 4, 5, 90, 6),
                col2 = c(13, 60, 13, 18, 13, 12, 0),
                col3 = c(1, 899, 5, 4, 3, 8, 6))

outliers(w, 1, 3)


