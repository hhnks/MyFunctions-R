NA_check <- function(x){
  # Check if dataframe has NAs in each column

  NA_df <- matrix(ncol=ncol(x), nrow=1)
  
  # Check over columns
    for(i in 1:ncol(x)) {
      NA_df[ , i] <- sum(is.na((x[ , i])))
    }

  NA_df <- data.frame(NA_df)
  colnames(NA_df) <- colnames(x)
  
  NA_df
}