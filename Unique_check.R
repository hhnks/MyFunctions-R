Unique_check <- function(x){
  # Check how many unique values has dataframe in each column
  
  Unique_val_df <- matrix(ncol=ncol(x), nrow=1)
  
  # Check over columns
  for(i in 1:ncol(x)) {
    Unique_val_df[ , i] <- length(unique((x[ , i])))
  }
  
  Unique_val_df <- data.frame(Unique_val_df)
  colnames(Unique_val_df) <- colnames(x)
  
  Unique_val_df
}