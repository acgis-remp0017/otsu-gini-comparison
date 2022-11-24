otsu <- function(data, bins) {
    histogram <- hist(data, breaks = bins)
    between_class_variance <- function(brk) {
        .NotYetImplemented()
    }
    within_class_variance_side <- function(side) {
        # The weight is the fraction of the dataset that this subset contains
        weight <- length(side) / length(data)
        weight * var(side)
    }
    within_class_variance <- function(brk) {
        left <- data[data <= brk]
        right <- data[data > brk]
        within_class_variance_side(left) + within_class_variance_side(right)
    }
    within_class_variances <- lapply(histogram$breaks, within_class_variance)
    index <- which.min(within_class_variances)
    threshold <- histogram$breaks[index]
    abline(v = threshold)
}


library(datasets)
otsu(faithful$eruptions, bins = 30)
