balanced <- read_excel("MA-2/MergedSample.xlsx", sheet = "MergedSample")
unbalanced <- read_excel("MA-2/MergedSample.xlsx", sheet = "MergedSampleUnbalanced")
hist_bal <- hist(balanced$HV, breaks = 40)
hist_unbal <- hist(unbalanced$HV, breaks = 40)

hv <- balanced$HV
breaks <- hist_bal$breaks[2:length(hist_bal$breaks)]

results <- numeric(length(breaks))
for (brk in breaks) {
  # indices of foreground and background
  fg_indices <- which(hv <= brk)
  bg_indices <- which(hv > brk)
  fg <- hv[fg_indices]
  bg <- hv[bg_indices]
  mean_fg <- mean(fg)
}