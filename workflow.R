
# workflow ----------------------------------------------------------------

library(tidyverse)
library(nycflights13)


# Restyle 
# the following pipelines following the guidelines above.

# Exemplo de como o codigo nao deve ser organizado:

# flights|>filter(dest=="IAH")|>group_by(year,month,day)|>summarize(n=n(),
#                                                                   delay=mean(arr_delay,na.rm=TRUE))|>filter(n>10)
# 
# flights|>filter(carrier=="UA",dest%in%c("IAH","HOU"),sched_dep_time>
#                   0900,sched_arr_time<2000)|>group_by(flight)|>summarize(delay=mean(
#                     arr_delay,na.rm=TRUE),cancelled=sum(is.na(arr_delay)),n=n())|>filter(n>10)


# Exemplo de como  o codigo deve ser organizado:



flights |> filter(dest == "IAH") |>
  group_by(year,month,day) |>
  summarize(n=n(),
            delay=mean(arr_delay,na.rm=TRUE)) |>
  filter(n > 10)


flights |>
  filter(carrier == "UA", 
         dest %in% c("IAH","HOU"),
         sched_dep_time > 0900, 
         sched_arr_time < 2000) |>
  group_by(flight) |>
  summarize(delay = mean(arr_delay, na.rm = TRUE),
            cancelled = sum(is.na(arr_delay)),
            n=n()) |>
  filter(n > 10)






