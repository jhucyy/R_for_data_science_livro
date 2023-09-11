
# Pacotes -----------------------------------------------------------------

# foco no pacote tidyr, que faz parte do megapacote tidyverse:

library(tidyverse)


# Principios de tidy ------------------------------------------------------

# cada variavel deve ser uma coluna e cada observação uma linha, cada célula um valor. 
# essa organização facilita a manipulação dos dados com o pacote
# tidyr. 



# operations in table2
# 
# Extract the number of TB cases per country per year.
# Extract the matching population per country per year.
# Divide cases by population, and multiply by 10000.
# Store back in the appropriate place.


# Funções para a organização de datasets bagunçados -----------------------

# pivot_longer
# pivot_wider
# separate
# unite



table2 |> 
  pivot_wider(names_from = type, values_from = count) |> 
  group_by(country, year, population) |> 
  count() |> 
  ungroup()


table2 |> 
  pivot_wider(names_from = type, values_from = count) |> 
  mutate(rate = cases / population * 1000)


table3
?pivot_longer()

table3 |> 
  separate(col = rate, into = c("rate", "population"), 
           sep = "/")
  
  

# 6.3.2 How does pivoting work?
# parei aqui

?separate

who2 |> 
  pivot_longer(cols = !c(country:year),
               names_to = c("diagnosis", "gender", "age"),
               values_to = "count", names_sep = "_",
               values_drop_na = TRUE) 
  






