
# 1 - camadas -------------------------------------------------------------

library(tidyverse)
mpg
# utilizando o banco de dados mpg, vamos visualizar a eficiencia dos carros 
# hwy com base no tamanho do motor displ em relacao ao modelo do carro class
# para visualizar em um ggplot a relacao comparativa entre esses 3 aspectos. 


ggplot(mpg, aes(x = displ, y = hwy, color = class))+
  geom_point()

# exercise:
# Create a scatterplot of hwy vs. 
# displ where the points are pink filled in triangles.


ggplot(mpg, aes(x = hwy, y = displ))+
  geom_point(shape = 2, colour = "pink", fill = "pink")


ggplot(mpg, aes(x = hwy, y = displ, color = displ > 5))+
  geom_point()

# objetos geometricos:
# parei aqui 10.3 Geometric objects





