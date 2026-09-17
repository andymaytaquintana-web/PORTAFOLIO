library(readxl)
datos1 <- read_xlsx("Caso1.xlsx")
View(datos1)
# EJERCICIO 1 - PRUEBA BINOMIAL

iquitos <- datos1 |> filter(Ciudad == "Iquitos") 
iquit <- subset(datos1, Ciudad=="Iquitos")
table(iquit$Instagram)

# para hallar con la distribucion (paquete stats)
binom.test(100,224,0.45,alternative = "l")

# para hallar solo el pvalor
pbinom(100,224,0.45)


# para IC al 95%
binom.test(100,224,conf.level = 0.95)
binom.test(x=100,n=224,conf.level = 0.95)



# EJERCICIO 2 -   PRUEBA DE MC NEMAR
ayacu <- subset(datos1, Ciudad == "Ayacucho")
ad1 <- ifelse(ayacu$Adición1 == "baja",1,0)
ad2 <- ifelse(ayacu$Adición2 == "baja",1,0)
table(ad1,ad2)

# paquete stats -> pvalor ~ chi square
mcnemar.test(table(ad1,ad2))

# paquete exact2x2 ->  pvalor ~ binomial
mcnemar.exact(ad1,ad2)




# EJERCICIO 3 - PRUEBA DE FRECUENCIAS

truj <- subset(datos1, Ciudad == "Trujillo")
tabla <- table(truj$Película)
probs <- c(0.2,0.3,0.4,0.1)

# Metodo aproximado chisq.test
chisq.test(x = table(truj$Película), p = probs)

# Metodo exacto paquete RVAdeMemoire
multinomial.test(as.vector(table(truj$Película)),probs)

'''
H0: p_amor = 0.2 ,  p_violenc = 0.1 , p_sex =   0.4, p_humor = 0.3
H1: Al menos un p_i es diferente a los valores establecidos

alfa = 0.03

pvalor = 000 < 0.03

conclusión: 
A un alfa = 0.03, existe evidencia estadística para afirmar que al menos una
proporcion de los generos de peliculas que ven los jovenes residentes 
en la ciudad de trujillo son diferentes a los valores establecidos.
'''



# EJERCICIO 4 - STUART MAXWELL

tumb <- subset(datos1, Ciudad == "Tumbes")
ad1 <- tumb$Adición1
ad2 <- tumb$Adición2

table(ad1,ad2)

library(DescTools)
StuartMaxwellTest(table(ad1,ad2))
pchisq(1.3617,2,lower.tail = F)

'''
H0: La charla no tuvo un efecto significativo en los jovenes de Tumbes
H1: La charla si tubo un efecto significativo en los jovenes de Tumbes

alfa = 0.03

pvalor = 0.5062 > 0.03

conclusion:
A un alfa = 0.03, No podemos afirmar que la charla tuvo un efecto significativo
para los jovenes de Tumbes
'''



# EJERCICIO 5 Homogeneidad de Subpoblaciones


table(datos1$Ciudad,datos1$Lectura)

resp<-chisq.test(Caso1$Ciudad,Caso1$Lectura)
resp$expected
pchisq(3.0179,4,lower.tail = F)


# EJERCICIO 6 - Fisher

library(DescTools)
table(datos1$Ciudad, datos1$Instagram)

tab <- matrix(c(111,87,100,124), nrow = 2, ncol = 2)

fisher.test(tab, alternative = "g")

'''
H0: Pins_aya = Pins_iqui
H1: Pins_aya > Pins_iqui

alfa = 0.03

pvalor = 0.0124 < 0.03

conclusion: A un alfa = 0.03, existe evidencia estadística para afirmar que
la proporcion de jovenes de la ciudad de ayacucho que usa frecuentemente
instagram es mayor a la propocion de jovenes de Iquitos que usa frecuentemente
instagram.
'''

# EJERCICIO 7 - Mante Haenzel y Cochran

table(datos1$Género, datos1$Lectura, datos1$Ciudad)

mantelhaen.test(datos1$Lectura, datos1$Género, datos1$Ciudad)

'''
HO: pi_FF = pi_FM
H1: pi_FF != pi_FM

alfa = 0.03

pvalor = 0.472 > 0.03

conclusion:
A un alfa = 0.03, No podemos afirmar que la proporcion de hombres que tienen
preferencia por la lectura sea diferente en al menos una de las ciudades en
estudio.
'''


# EJERCICIO 8 - INDEPENDENCIA

table(truj$Género, truj$Película)
chisq.test(truj$Género, truj$Película)
chisq.test(table(truj$Género, truj$Película))
pchisq(172.38,3,lower.tail = F)

'''
H0: El genero del entrevistado y el genero de la pelicula son independientes
H1: El genero del entrevistado y el genero de la pelicula no son independientes

alfa = 0.03

pvalor = 0.00 < 0.03

conclusion: a un alfa = 0.03, podemos afirmar que existe relación entre el
genero del entrevistado y el genero de la pelicula.
'''

# EJERCICIO 9 - V de cramer & Coeficiente de contingencia

library(DescTools)

CramerV(table(truj$Género, truj$Película))

'''
H0: No existe asociacion entre el género del entrevistado y el género de 
película de preferencia de los jóvenes de la ciudad de Trujillo

H1: Existe asociacion entre el género del entrevistado y el género de 
película de preferencia de los jóvenes de la ciudad de Trujillo

interpretacion:
El género del joven de Trujillo está fuertemente relacionado con el tipo 
de película que prefiere ver.
'''















