
# ggplplot - visualizacao de dados ----------------------------------------
# Carregando os pacotes:

library(tidyverse)
# install.packages("palmerpenguins")
# install.packages("ggthemes")
library(palmerpenguins)
library(ggthemes)


penguins %>% 
  view()
glimpse(penguins)


ggplot(data = penguins, 
       mapping = aes(x = flipper_length_mm, y = body_mass_g))+
  geom_point()


# testando a relacao do tamanho da nadeira com a massa corporal 
#junto a variavel especie:

ggplot(data = penguins, 
       mapping = aes(x  = flipper_length_mm, y = body_mass_g, color = species))+
  geom_point() + geom_smooth(method = "lm")



# Scatterplot (geom_point) sao bons para demonstrar a relacao entre duas
#variaveis numericas. 

#Entretanto, e importante nao se deixar levar de primeira por uma relacao aparente
#e fazer combinacoes com outras variaveis para observar se esta primeira
#impressao permanece ou muda. 


#Quando definimos o argumento estetico (aes) no nivel global, cada nova 
#camada adicionada reflete para todo o grafico, entretanto, agora queremos
#diferenciar as cores apenas pela variavel species, mas nao queremos que o 
#geom_smoth seja afetado, entao devemos defirnir a cor no nivel local, ou seja,
#apenas no objeto geometrico que lhe diz respeito, o geom_point:

ggplot(data = penguins, 
       mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm", color = "black")


# adicionando uma legenda com o argumento labd:


ggplot(data = penguins, 
       mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species)) +
  geom_smooth(method = "lm", color = "black")+
  labs(
    title = "Massa corporal e Comprimento da nadadeira",
    subtitle = "Dimensões para as espécies de penguins: Adelie, Chinstrap, e Gentoo",
    x = "Comprimento da nadadeira (mm)",
    y = "Massa corporal (g)",
    color = "Species", shape = "Species"
  )+
  scale_color_colorblind()



#scale_color_colorblind adiciona uma camada de cores segura para pessoas
#que nao enxergam determinadas cores. 




# Exercicios --------------------------------------------------------------

# 1 - How many rows are in penguins? How many columns?

glimpse(penguins)

# 344 linhas - observacoes
# 8 colunas - variaveis

# 2 - What does the bill_depth_mm variable in the penguins data frame describe? 
# Read the help for ?penguins to find out.

?penguins
# a number denoting bill depth (millimeters)


# 3 - Make a scatterplot of bill_depth_mm vs. bill_length_mm. 
# That is, make a scatterplot with bill_depth_mm on the y-axis and bill_length_mm on the x-axis. 
# Describe the relationship between these two variables.

ggplot(data = penguins, 
       mapping = aes(x = bill_length_mm, y =  bill_depth_mm))+
  geom_point()
#a relacao parece ser de contraposicao, quanto ,maior bill_depth, menor
#sera bill length


#  4 - What happens if you make a scatterplot of species vs. bill_depth_mm? 
# What might be a better choice of geom?

# um grafico de barras representa bem a relacao entre uma variavel 
#categorica e uma variavel numerica. 


ggplot(data = penguins, 
       mapping = aes(x = bill_depth_mm, y = species))+
  geom_col()


# consertando a relacao de proporcao:

penguins %>% 
  mutate(species = fct_reorder(species, -bill_depth_mm)) %>% 
  ggplot()+
  geom_col(aes(x = bill_depth_mm, y = species))

#nao deu certo??


# 5 - Why does the following give an error and how would you fix it?


 ggplot(data = penguins) + 
geom_point()

# esta faltando os argumentos esteticos (aes) x e y
# para resolver e necessario adicionar os valores de x e y em aes.
 

# What does the na.rm argument do in geom_point()? What is the default value of the argument? 
 # Create a scatterplot where you successfully use this argument set to TRUE.
 
 ggplot( data = penguins, 
         mapping = aes(x = flipper_length_mm, y = body_mass_g))+
   geom_point(na.rm = T)
 
 # na.rm = T silencia as mensagens de aviso de valores nao encontrados.
 

# Add the following caption to the plot you made in the previous exercise: “Data come from the palmerpenguins package.” 
 # Hint: Take a look at the documentation for labs().


 ggplot(data = penguins, 
        mapping = aes(x = flipper_length_mm, y = body_mass_g)) +
   geom_point(aes(color = species, shape = species)) +
   geom_smooth(method = "lm", color = "black")+
   labs(
     title = "Massa corporal e Comprimento da nadadeira",
     subtitle = "Dimensões para as espécies de penguins: Adelie, Chinstrap, e Gentoo",
     x = "Comprimento da nadadeira (mm)",
     y = "Massa corporal (g)",
     color = "Species", shape = "Species",
     caption = "Data come from the palmerpenguins package."
   )+
   scale_color_colorblind()

# Recreate the following visualization. What aesthetic should bill_depth_mm be mapped to? 
 # And should it be mapped at the global level or at the geom level?

 # deve ser mapeado no nivel do geom:
 
 ggplot(data = penguins,
        aes(x = flipper_length_mm, y = body_mass_g))+
   geom_point(aes(color = bill_depth_mm))+
   geom_smooth()

 
 
 
  #
 
 ggplot(
   data = penguins,
   mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
 ) +
   geom_point() +
   geom_smooth(se = FALSE)
 

# Escrevendo de forma mais concisa: ---------------------------------------
#ocultando alguns argumentos:
 
 ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) + 
   geom_point()

 

# Visualizacao das variaveis ----------------------------------------------

# Como voce visualiza os dados depende do tipo de variavel
 #se categorica ou numerica. 
 
 
 # A variavel e categorica se agrupa apenas um pequeno conjunto de dados
 # por exemplo no dataset palmerpenguins a variavel species
 # e categorica
 # para a visualizacao de variaveis categoricas recomenda-se o uso de 
 # graficos de barra.
 
 
 ggplot(penguins, aes(x = species)) +
   geom_bar()

 
# para representar variaveis categoricas e recomendavel o ordenamento, o 
 # R faz isso transformando as variaveis em fatores:
 
 ggplot(penguins, aes(x = fct_infreq(species))) +
   geom_bar()


 ggplot(penguins, aes(x = fct_infreq(species)))+
   geom_bar()

 
# uma variavel e numerica se ela reune um enorme conjunto de valores
 # numericos, com os quais e possivel fazer operacoes como a media
 # entre outras operacoes matematicas. As variaveis numericas podem
 # ser continuas ou discretas.
 
 
 # O histogram e usado para fazer a distribuicao de variaveis continuas:
 
# density plot tambem servem para variaveis numericas.
 
 # https://r4ds.hadley.nz/data-visualize
 # 2.4.3 Exercises - parei aqui
 
 
# Exercise 
 
 # Make a bar plot of species of penguins, 
 # where you assign species to the y aesthetic. How is this plot different?
 
 
 ggplot(penguins, aes(y = fct_infreq(species)))+
   geom_bar()
 
 
 
 ggplot(penguins, aes(x = fct_infreq(species)))+
   geom_bar()
 
 
 
 
# A diferenca e que com y o grafico de colunas fica na posicao horizontal.
 
 
 
 # 2 - How are the following two plots different? 
   # Which aesthetic, color or fill, is more useful for changing the color of bars?
 
 
 ggplot(penguins, aes(x = species)) +
   geom_bar(color = "red")
 
 ggplot(penguins, aes(x = fct_infreq(species))) +
   geom_bar(fill = "red")
 
 
# para grafico de barras o argumento fill e mais recomendado que o color, pois fill ira
 # colorir toda a parte interna da barra, enquanto color so pinta as bordas do grafico.
 
 
 # 3 -What does the bins argument in geom_histogram() do?
 
 # bindwith demonstra a distribuicao do valor de x, ao selecionar o intervalo de bin
 # devemos ter em mente a distribuicao mais proporcional do valor e a representacao
 # que demonstre isso
 
 
 # Make a histogram of the carat variable in
 # the diamonds dataset that is available when you load the tidyverse package. 
 # Experiment with different binwidths. What binwidth reveals the most interesting patterns?
 
 
 ggplot(diamonds, aes(x = carat))+
   geom_histogram(binwidth = 0.2)

 
 
 # Parei aqui - visualizatin relationships.
 
 # Para visualizar relacoes precisamos ter pelo menos duas variaveis
 # mapeadas em um mesmo plot. 
 
 
 # um boxplot pode ser usado entre uma variavel categorica e uma
 # numerica.
 
 # tambem geom_density pode ser usado:
 
 ggplot(penguins, aes(x = body_mass_g, color = species, fill = species)) +
   geom_density(alpha = 0.5)

  #o argumento shadow e um argumento estetico e coloca a cor 
 # em efeito de sombra.
 
 
 #grafico de barras representam bem a relacao entre duas variaveis
 # categoricas.
 
 
 ggplot(penguins, aes(x = island, fill = species)) +
   geom_bar(position = "fill")
 
 
 # position = "fill" coloca a representatividade dos penguins
 #  nas ilhas conforme a proporcionalidade.
 
 
 
 # Scarterplot e o tipo mais comum utilizado para representar 
 # a relacao entre duas variaveis numericas. 
 
 
 # incorpor mais variaveis ao grafico ao utilizar os 
 # argumentos esteticos, cores e formas, color or fill e shape
 
 
 ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
   geom_point(aes(color = species, shape = island))
 
 # facet_wrap subdivide a representacao dos dados em pequenos plots
 # a variavel utilizada em facet_wrap deve ser categorica.
 
 
 # The mpg data frame that is bundled with the ggplot2
 # package contains 234 observations collected by the US
 # Environmental Protection Agency on 38 car models.
 # Which variables in mpg are categorical? 
 #   Which variables are numerical? 
 #   (Hint: Type ?mpg to read the documentation for the dataset.) 
 # How can you see this information when you run mpg?
 # 
 ?mpg
glimpse(mpg) 
 

# Make a scatterplot of hwy vs. displ using the mpg data frame. 
# Next, map a third, numerical variable to color,
# then size, then both color and size, then shape. 
# How do these aesthetics behave 
# differently for categorical vs. numerical variables?
 
ggplot(mpg, aes(x = hwy, y = displ))+
  geom_point(aes(color = cty, size = cyl, shape = class))


 #In the scatterplot of hwy vs. displ, 
# what happens if you map a third variable to linewidth? 
 
 ggplot(mpg, aes(x = hwy, y = displ))+
   geom_point(linewidth = class)

 # What happens if you map the 
 # same variable to multiple aesthetics? 
 
 ggplot(mpg, aes(x = hwy, y = displ))+
   geom_point(aes(shape = class, fill = class, color = class))

 
 # Make a scatterplot of bill_depth_mm vs. bill_length_mm and 
 # color the points by species. What does adding coloring by 
 # species reveal about the relationship between
 # these two variables? What about faceting by species?
 # 
 
 
 ggplot(penguins, aes(x = bill_depth_mm, y = bill_length_mm))+
   geom_point(aes(color = species))+
   facet_wrap(~ species)

 # Why does the following yield two separate legends? 
 #   How would you fix it to combine the two legends? 
 
 
 ggplot(
   data = penguins,
   mapping = aes(
     x = bill_length_mm, y = bill_depth_mm, 
     color = species, shape = species
   )
 ) +
   geom_point() +
   labs(color = "species")

 
 # Create the two following stacked bar plots. 
 # Which question can you answer with the first one? 
 #   Which question can you answer with the second one?
 
 
 ggplot(penguins, aes(x = island, fill = species)) +
   geom_bar(position = "fill")

 
  ggplot(penguins, aes(x = species, fill = island)) +
   geom_bar(position = "fill")


# Salvando o plot ---------------------------------------------------------

  ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
    geom_point()
  ggsave(filename = "penguin-plot.png")   

  
  

  
  
   
  
 
 
 































