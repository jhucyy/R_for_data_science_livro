
# importacao de dados -----------------------------------------------------
# pacote readr - dentro do tidyverse
library(tidyverse)

# importando arquivos csv -------------------------------------------------

# funcoes:
read_csv()

# carregando dados de uma url
students <- read_csv("https://raw.githubusercontent.com/hadley/r4ds/main/data/students.csv")

students <- read_csv("https://raw.githubusercontent.com/hadley/r4ds/main/data/students.csv",
                     na = c("N/A", " "))

students <- read_csv("data/students.csv", na = c("N/A", ""))

# padronizacao dos nomes das variaveis/colunas
students <- janitor::clean_names(students)



# padronizado os valores nas linhas, para que cada coluna seja uma classe

students <- students %>% 
  mutate(meal_plan = factor(meal_plan),
         age = if_else(age == "five", "5", age)) 



# ler varias tabelas ao mesmo tempo:

# salvar primeiro o data.frame:
sales_file <- c("https://pos.it/r4ds-01-sales", "https://pos.it/r4ds-02-sales",
         "https://pos.it/r4ds-03-sales")



sales <- read_csv(sales_file, id = "file")

# adiciona a origem do arquivo id = "file"



# reposionar o local da variavel
# aqui reposicionei a coluna file para o final da tabela
# funcao relocate 
sales %>% 
  relocate(file, .after = last_col())




# salvando o data frame no desktot ----------------------------------------

write_csv(dataframe, "dataframe.csv")

writexl::write_xlsx(sales, "sales.xls")

write_rds(sales, "sales.rds")

getwd()















