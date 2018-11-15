library(tidyverse)
library(nycflights13)


answer5.5.2.1 <- flight_dep_in_mins <- mutate(flights, dep_mins = ((dep_time %/% 100) * 60 + (dep_time %% 100)),
  sched_dep_mins = (sched_dep_time %/% 100 * 60 + sched_dep_time %% 100))

answer5.5.2.2 <- airtime <- mutate(flights, dep_min = (dep_time %/% 100 * 60 + dep_time %% 100),
  arr_min = (arr_time %/% 100 * 60 + arr_time %% 100), airtime = air_time - arr_time + dep_time)

answer5.5.2.2cont <- "I expected to see the same values but instead saw negative numbers and lots on inconsistencies.
  To fix this, I need to adjust values based on time zones and across different days"

answer5.5.2.3 <- flights_deptime <- mutate(flights, dep_mins = (dep_time %/% 100 * 60 + dep_time %% 100),
  sched_dep_mins = (sched_dep_time %/% 100 * 60 + sched_dep_time %% 100),
  dep_diff = dep_delay - dep_mins + sched_dep_mins)

answer5.5.2.3cont <- "I'd expect these values to be zero too. Some of them are 1400 and I believe that 
  is because of the landing being on a different day."

answer5.5.2.4 <- flight_ranks <- mutate(flights, dep_delay, dep_delay_rank = min_rank(-dep_delay))
top_10_delayed_flights <- filter(flight_ranks, dep_delay_rank <= 10)
arrange(top_10_delayed_flights, dep_delay_rank)

answer5.5.2.4cont <- "Ties are handled by giving the highest rank value to the tied rows"

not_canceled <- flights %>% filter(!is.na(dep_delay), !is.na(arr_delay))

answer5.6.7.2 <- not_canceled %>% group_by(dest) %>% summarise(n = length(dest))
answer5.6.7.2cont <- not_canceled %>% group_by(tailnum) %>% summarise(n = sum(distance))

answer5.6.7.3 <- "It does not account for flights that do not land. arr_delay gives an accurate depiction
  if the flight made it to it's destination or not"

answer5.6.7.4 <- canceled <- flights %>% mutate(canceled = (is.na(arr_delay) | is.na(dep_delay))) %>%
  group_by(year, month, day) %>%
  summarise(prop_canceled = mean(canceled), avg_dep_delay = mean(dep_delay, na.rm = TRUE))

answer5.6.7.4cont <- "Looking at the dataset, yes, the anceled flights are related to the average delay"

answer5.6.7.5 <- flights %>% group_by(carrier) %>% 
  summarise(arr_delay = mean(arr_delay, na.rm = TRUE)) %>%
  arrange(desc(arr_delay))

answer5.6.7.5cont <- "Looks as though Frontier Airlines has the worst delays"

answer5.7.1.1 <- "Operations change when you group because they apply to the dataset of which you've grouped the data"

answer5.7.1.2 <- flights %>% group_by(tailnum) %>%
  summarise(arr_delay = mean(arr_delay)) %>%
  filter(min_rank(desc(arr_delay)) <= 1)

answer5.7.1.3 <- flights %>% group_by(hour) %>%
  summarise(arr_delay = mean(arr_delay, na.rm = TRUE)) %>%
  arrange(arr_delay)

answer5.7.1.4 <- flights %>% filter(!is.na(arr_delay), arr_delay > 0) %>%  
  group_by(dest) %>%
  mutate(delay_total = sum(arr_delay), delay_proportion = arr_delay / arr_delay_total)

answer5.7.1.5 <- lag_ <- flights %>% arrange(origin, year, month, day, dep_time) %>%
  group_by(origin) %>%
  mutate(dep_delay_lag = lag(dep_delay)) %>%
  filter(!is.na(dep_delay), !is.na(dep_delay_lag))

answer5.7.1.5cont <- lag_ %>% summarise(delay_diff = mean(dep_delay - dep_delay_lag), na.rm = TRUE)

answer5.7.1.6 <- flight_mean_airtime <- flights %>%
  filter(!is.na(air_time)) %>%
  group_by(dest, origin) %>%
  mutate(air_time_mean = mean(air_time),
         air_time_sd = sd(air_time),
         n = n()) %>%
  arrange(desc(air_time_mean))

answer5.7.1.6cont <- "Taking a look at the data, there are pretty big outliers, concluding that there
  are either some strange large delays in the air or data was incorrect"

answer5.7.1.7 <- destinations_with_2_carriers <- flights %>% select(dest, carrier) %>%
  group_by(dest, carrier) %>%
  filter(row_number() == 1) %>%
  group_by(dest) %>%
  mutate(n_carrier = n_distinct(carrier)) %>%
  filter(n_carrier >= 2)

answer5.7.1.7cont <- carriers_ranked <- destinations_with_2_carriers %>%
  group_by(carrier) %>%
  summarise(n_dest = n()) %>%
  arrange(desc(n_dest))
head(carriers_by_dest)

answer5.7.1.8 <- flights %>%
  arrange(tailnum, year, month, day) %>%
  group_by(tailnum) %>%
  mutate(more_hour_delay = dep_delay > 60) %>%
  mutate(delay = cumsum(more_hour_delay)) %>%
  filter(delay < 1) %>%
  count(sort = TRUE)

has_prefix <- function(string, prefix) {
  substr(string, 1, nchar(prefix)) == prefix
}

pop <- function(x) {
  if (length(x) <= 1) return(NULL)
  x[-length(x)]
}

repeat_ <- function(x, y) {
  rep(y, length.out = length(x))
}
answer19.3.1.2 <- "
factor_of <- function(x, y){
  if(y %% x == 0) return(TRUE)
  return(FALSE)
}"

answer19.3.1.3 <- "rnorm applies to a univariate normal distribution while MASS::mvrnorm applies to 
  multivariate normal distributions. You make them more consistent by using rmvnorm"

answer19.3.1.4 <- "Norm first when to group functions by distribution while function first is to 
  group by the function action"

answer19.4.4.1 <- "If makes one comparison while ifelse runs through whatever comparisons follow
  x <- 4
  if(x = 5) would not evaluate

  if(x = 5) { would not evaluate, go to next

  }else if(x < 5){ evaluates and executes whatever code is contained here

  }
"

answer19.4.4.2 <- greet <- function(time = lubridate::now()) {
  hour <- lubridate::hour(time)
  if (hour < 12) {
    print("good morning")
  } else if (hour < 17) {
    print("good afternoon")
  } else {
    print("good evening")
  }
}
greet()

answer19.4.4.3 <- fizzbuzz <- function(x) {
  if (!(x %% 3) && !(x %% 5)) {
    "fizzbuzz"
  } else if (!(x %% 3)) {
    "fizz"
  } else if (!(x %% 5)) {
    "buzz"
  } else {
    x
  }
}
fizzbuzz(3)

answer19.4.4.4 <- temp <- seq(-10, 50, by = 5)
cut(temp, c(-Inf, 0, 10, 20, 30, Inf), right = TRUE, labels = c("freezing", "cold", "cool", "warm", "hot"))

answer19.4.4.4cont <- "cut is useful because it makes writing the code shorter but also allows for scalability"

answer19.4.4.5 <- "Switch with numeric values evaluates to the int position of the values. I.E. 1 returns the first value"

answer19.4.4.6 <- "The switch call goes through each case and evaluates for the value that is passed in.
  if the switch does not have a value defined for the variable passed in, it by default does nothing"


