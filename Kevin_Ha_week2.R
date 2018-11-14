my_variable <- 10
my_varıable
answer4.4.1 <- "this code does not work because of a misspelling of the variable, variable"

library(tidyverse)

ggplot(data = mpg) + geom_point(mapping <- aes(x <- displ, y = hwy))

filter(mpg, cyl == 8)
filter(diamonds, carat > 3)

answer4.4.3 <- "A keyboard shortcut menu opens. You can get to this through the Tools section on the toolbar" 

library(nycflights13)
(flights <- nycflights13::flights)

delay_over_2 <- filter(flights, arr_delay >= 2) 
flew_to_houston <- filter(flights, dest %in% c("IAH", "HOU"))
operated_by_united_american_delta <- filter(flights, carrier %in% c("UA", "AA", "DL"))
flight_in_summer <- filter(flights, month >= 7, month <= 9)
two_hours_late_but_did_not_leave_late <- filter(flights, dep_delay <= 0, arr_delay >= 120)
were_delayed_but_made_up_30_mins <- filter(flights, dep_delay >= 60, arr_delay < (dep_delay - 30))
departed_between_midnight_and_6am <- filter(flights, dep_time <= 360)

answer5.2.4.2 <- "Between can filter for rows between two specified values. This would be useful to get the summer flights"

no_dep_time <- filter(flights, is.na(dep_time))
answer5.2.4.3 <- "There are 8,255 rows without a dep_time. I would be under the assumption that this flight was canceled because
  there is also no arrival time or air time. There are also other missing columns like departure/arrival delay"

answer5.2.4.4 <- "NA ^ 0 is not missing because that equals 1. NA | TRUE evaluates to TRUE because it is an OR evaluation
  FALSE && NA is not missing because it is an AND evaluation with one side as FALSE, evaluating to FALSE".

answer5.3.1.1 <- arrange(flights, desc(is.na(dep_time)),dep_time)

answer5.3.1.2 <- arrange(flights, desc(dep_delay))
answer5.3.1.2cont <- arrange(flights, dep_delay)

answer5.3.1.3 <- arrange(flights, air_time)

answer5.3.1.4 <- arrange(flights, desc(distance))
answer5.3.1.4cont <- arrange(flights, distance)

answer5.4.1.2 <- "Multiple duplicate variables in a select call get ignored and appear in the order of which they first appear"

answer5.4.1.3 <- "One of allows you to use strings to select from a character vector.
  It helps with this scenario because it makes it easier to make vectors with variable names"

answer5.4.1.4 <- "From using previous search tools, it does not surprise me. Select helpers default 
  to ignore casing which helps when searching for a column name you that you might not be sure of.
  You can change the default by adding a parameter to contains called ignore.case as FALSE"

