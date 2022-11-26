library("readxl")
balanced <- read_excel("MA-2/MergedSample.xlsx", sheet = "MergedSample")
unbalanced <- read_excel("unbalanced_points.xls")
hist_bal <- hist(balanced$HV, breaks = 40)


hv <- balanced$HV

bal_results <- numeric(length(hist_bal$breaks))
for (i in 2:length(hist_bal$breaks)) {
  # get the threshold
  threshold <- hist_bal$breaks[i]
  # split the data into left and right
  ind_left=which(hv <= hist_bal$breaks[i])
  ind_right=which(hv > hist_bal$breaks[i])
  varLeft = var(hv[ind_left])
  varRight = var(hv[ind_right])
  weightLeft = length(ind_left) / length(hv)
  weightRight = length(ind_right) / length(hv)
  meanLeft = mean(hv[ind_left])
  meanRight = mean(hv[ind_right])
  wcv = weightLeft * varLeft + weightRight * varRight
  bal_results[i] = wcv
}

bal_threshold <- min(na.omit(bal_results[2:length(bal_results)]))
abline(v = bal_threshold)

hist_unbal <- hist(unbalanced$RS2_FQ19_20120908_HV, breaks = 40)
unbal_hv <- unbalanced$RS2_FQ19_20120908_HV

unbal_results <- numeric(length(hist_unbal$breaks))
for (i in 2:length(hist_unbal$breaks)) {
  # get the threshold
  threshold <- hist_unbal$breaks[i]
  # split the data into left and right
  ind_left=which(unbal_hv <= hist_unbal$breaks[i])
  ind_right=which(unbal_hv > hist_unbal$breaks[i])
  varLeft = var(unbal_hv[ind_left])
  varRight = var(unbal_hv[ind_right])
  weightLeft = length(ind_left) / length(unbal_hv)
  weightRight = length(ind_right) / length(unbal_hv)
  meanLeft = mean(unbal_hv[ind_left])
  meanRight = mean(unbal_hv[ind_right])
  wcv = weightLeft * varLeft + weightRight * varRight
  unbal_results[i] = wcv
}

unbal_threshold <- min(na.omit(unbal_results[2:length(unbal_results)]))
abline(v = unbal_threshold)
