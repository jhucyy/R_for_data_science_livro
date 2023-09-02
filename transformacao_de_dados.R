
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
  

# Colunas -----------------------------------------------------------------

# As principais funcoes para manipular colunas, sao
# mutate ()
# select ()
# rename () - janitor::clean_names()
# relocate () realoca as colunas para outras posicoes.
# por configucao padrao, relocate move as variaveis para o 
# inicio do dataset.


# Exercicios --------------------------------------------------------------

# Compare dep_time, sched_dep_time, and dep_delay. 
# How would you expect those three numbers to be related?

flights |> 
  select(dep_time, sched_dep_time, dep_delay)

# Brainstorm as many ways as possible to select dep_time, 
# dep_delay, arr_time, and arr_delay from flights.

flights |> 
  select(starts_with(c("dep", "arr")))


flights |> 
  select(ends_with(c("time", "delay")))


flights |> 
  select(contains(c("delay", "time")))


# What happens if you specify the name of the
# same variable multiple times in a select() call?
flights |> 
  select(dep_time, dep_time, dep_time)
# so seleciona uma vez.

# What does the any_of() function do? 
#   Why might it be helpful 
# in conjunction with this vector?


variables <- c("year", "month", "day", "dep_delay", "arr_delay")

flights |> 
  select(any_of(variables))


# Does the result of running the following code surprise you? 
#   How do the select helpers deal with upper and
# lower case by default? How can you change that default?

flights |> select(contains("TIME"))

flights |> select(ends_with("Time"))

# os selecionadores especificos ignoram a regra do r de ser 
# case sensitive. Isto pode ser util na selecao de datasets.







































































