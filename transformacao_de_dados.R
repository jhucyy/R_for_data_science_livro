
# Transformacao de dados  -------------------------------------------------

# nessa parte iremos trabalhar, principalmente com o pacote dplyr, que 
# esta insetido no mega pacote tidyverse. 

library(dplyr)
library(nycflights13)

# visualizando um data set
# pode se usar glimpse para olhar o data set no console, 
# que possibilita visualiza todas as colunas, as primeiras
# linhas, e o numero total de colunas e linhas. 

glimpse(flights)


# ou view() que abre uma aba lateral com o data set
view(flights)

# principais funcoes para manipulacao das linhas:

# filter()
# arrange() or arrange(desc())
# distinct()
# distinct encontra os valores unicos em cada coluna. 

# exercise:



# Had an arrival delay of two or more hours


flights |> 
  filter(arr_delay >= 120) |> 
  view()



# Flew to Houston (IAH or HOU)

flights |> 
  filter(dest %in% c("IAH", "HOU")) |> 
  view()

# Were operated by United, American, or Delta

flights |> 
  filter(carrier %in% c("UA", "DL")) |> 
  view()


flights |> 
  distinct(carrier)
# fltra os valores distintos (unicos) das linhas. 

# Departed in summer (July, August, and September)

flights |> 
  filter(month %in% c(7,8,9)) |> 
  view()


# Arrived more than two hours late, but didn’t leave late

flights |> 
  filter(arr_delay > 120 & dep_delay <= 0) |> 
  view()

# Were delayed by at least an hour, 
# but made up over 30 minutes in flight

flights |> 
  filter(dep_delay >= 120 & air_time <= 30) |> 
  view()


# Sort flights to find the flights with longest 
# departure delays. Find the flights
# that left earliest in the morning.

flights |> 
  arrange(desc(dep_delay))

flights |> 
  arrange(dep_time) |> 
  view()


#Sort flights to find the fastest flights. 
# (Hint: Try including 
# a math calculation inside of your function.)


fastest_flights <- mutate(flights, mph = distance / air_time * 60)
fastest_flights <- select(
  fastest_flights, mph, distance, air_time,
  flight, origin, dest, year, month, day
)

# Was there a flight on every day of 2013?

flights |> 
  filter(year == 2013) |> 
  distinct(month, day)

# Which flights traveled the farthest distance? 
#   Which traveled the least distance?

flights |> 
  arrange()

flights |> 
  arrange(distance)
  
# https://r4ds.hadley.nz/data-transform
# parei em coluns 4.3

















































