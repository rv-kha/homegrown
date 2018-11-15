answer20.3.5.1 <- "is.finite will not evaluate anything that is empty or not a number, while !is.infinite
  will return true for anything that is Inf"


answer20.3.5.2 <- "Instead of looking for an exact value, near looks in a span of values specified by tolerance"

answer20.3.5.3 <- "Ints at a default are 32 bit which maxes out at 2147483648 but one bit is used to 
  allocate the negative or plus sign, which makes the max value of an int vector 2147483648. A double is
  64 bit. double that number right? wrong. 2^64 maxes out with a total of 53 digits"

answer20.3.5.4 <- "towards zero, away from zero, even, odd. 
  Towards zero rounds down (or up) depending if you're a positive number or a negative number
  away from zero rounds up (or down) depending if you're a positive number or a negative number
  even rounds to the nearest even number. If the number is even, it will floor, if it is odd, it will round up
  odd rounds to the nearest odd number. If the number is even, it will floor, if it is odd, it will round up"

answer20.4.6.1 <- "mean(is.na(x)) tells you the proportion of missing alues in a vector (NA)
  sum(!is.finite(x)) will calculate the number of elements that are NA, NaN or Inf"

answer20.4.6.2 <- "is.vector checks whether the object has keys or not. is.atomic will check for atomic
  types like logical, integer, numeric, complex, character”, raw, and NULL."

answer20.4.6.3 <- "purrr allows you to modify the values with functions while setting the names"

answer20.4.6.4.1 <- last_value <- function(x) {
  x[[length(x)]]
}

answer20.4.6.4.2 <- even_number_pos <- function(x) {
  x[seq_along(x) %% 2 == 0]
}

answer20.4.6.4.3 <- not_last <- function(x) {
  x[-length(x)]
}

answer20.4.6.4.4 <- even_numbers <- function(x) {
  x[x %% 2 == 0]
}

answer20.4.6.5 <- "x[-which(1 > 0)] returns a NaN while x[1<=0] evaluates to NA. This is because the
  which expression returns a -1 which results in a NaN when trying to match it with x"

answer20.4.6.6 <- "Named vectors return NA for any value it cannot find in it's name values"








