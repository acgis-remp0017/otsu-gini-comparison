# Read in the data from the excel files
library("readxl")
balanced <- read_excel("MA-2/MergedSample.xlsx", sheet = "MergedSample")
unbalanced <- read_excel("unbalanced_points.xls")

# data is the dataset (a vector of numbers), num_bins is
# the number of bins to use for the histogram
otsu <- function(data, num_bins) {
  # Create and plot the histogram
  histogram <- hist(data, breaks = num_bins)
  # Create an array to hold the within-class variances
  results <- numeric(length(histogram$breaks))
  for (i in 2:length(histogram$breaks)) {
    # get the threshold
    threshold <- histogram$breaks[i]
    # split the data into left and right
    ind_left <- which(data <= threshold)
    ind_right <- which(data > threshold)
    # calculate the variances
    varLeft <- var(data[ind_left])
    varRight <- var(data[ind_right])
    # calculate the weights
    weightLeft <- length(ind_left) / length(data)
    weightRight <- length(ind_right) / length(data)
    # calculate the means
    meanLeft <- mean(data[ind_left])
    meanRight <- mean(data[ind_right])
    # calculate the within-class variance
    wcv <- weightLeft * varLeft + weightRight * varRight
    # put it in the array
    results[i] <- wcv
  }

  # Plot the threshold as a vertical line
  abline(v = threshold)
  threshold
}

otsu(data = balanced$HV, num_bins = 40)

unbal_hv <- unbalanced$RS2_FQ19_20120908_HV

otsu(data = unbal_hv, num_bins = 40)
