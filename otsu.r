library("readxl")
balanced <- read_excel("MA-2/MergedSample.xlsx", sheet = "MergedSample")
unbalanced <- read_excel("unbalanced_points.xls")


otsu <- function(data, num_bins) {
  histogram <- hist(data, breaks = 40)
  results <- numeric(length(histogram$breaks))
  for (i in 2:length(histogram$breaks)) {
    # get the threshold
    threshold <- histogram$breaks[i]
    # split the data into left and right
    ind_left <- which(data <= threshold)
    ind_right <- which(data > threshold)
    varLeft <- var(data[ind_left])
    varRight <- var(data[ind_right])
    weightLeft <- length(ind_left) / length(data)
    weightRight <- length(ind_right) / length(data)
    meanLeft <- mean(data[ind_left])
    meanRight <- mean(data[ind_right])
    wcv <- weightLeft * varLeft + weightRight * varRight
    results[i] <- wcv
  }

  threshold <- min(na.omit(results[2:length(results)]))
  abline(v = threshold)
  threshold
}

otsu(data = balanced$HV, num_bins = 40)

hist_unbal <- hist(unbalanced$RS2_FQ19_20120908_HV, breaks = 40)
unbal_hv <- unbalanced$RS2_FQ19_20120908_HV

otsu(data = unbal_hv, num_bins = 40)
