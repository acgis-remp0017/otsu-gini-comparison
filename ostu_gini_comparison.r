otsu <- function(data, bins) {
    # Set right = FALSE because we are using [closed, open) intervals
    # (as Dr. Greensted does).
    histogram <- hist(data, breaks = bins, right = FALSE)
    # I'll try to implement this approach later.
    between_class_variance <- function(brk) {
        .NotYetImplemented()
    }
    within_class_variance_side <- function(side) {
        # The weight is the fraction of the dataset that this subset contains
        weight <- length(side) / length(data)
        weight * var(side)
    }
    within_class_variance <- function(brk) {
        # Again, intervals are [closed, open).
        left <- data[data < brk]
        right <- data[data >= brk]
        within_class_variance_side(left) + within_class_variance_side(right)
    }
    within_class_variances <- lapply(histogram$breaks, within_class_variance)
    index <- which.min(within_class_variances)
    threshold <- histogram$breaks[index]
    abline(v = threshold)
    threshold
}


test.otsu.faithful <- function() {
    library(datasets)
    print(otsu(faithful$eruptions, bins = 30))
}

test.otsu.simpleimage <- function() {
    image <- c(rep(0, 8), rep(1, 7), rep(2, 2), rep(3, 6), rep(4, 9), rep(5, 4))
    threshold <- otsu(image, bins = 6)
    stopifnot(threshold == 3)
}

test.otsu.simpleimage()