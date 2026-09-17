Caso1 <- read_xlsx("Caso1.xlsx")
##################
#1. Prueba Binomial
###################
iqui<-subset(Caso1,Ciudad=="Iquitos")
table(iqui$Instagram)
#Mètodo exacto
binom.test(x = 100,p = 0.45,n = 224,alternative = "l")
pbinom(100,224,0.45)
#Mètodo aproximado (corregido y sin corregir)
prop.test(x = 100,p = 0.45,n = 224,alternative = "l",correct = T)
prop.test(x = 100,p = 0.45,n = 224,alternative = "l",correct = F)

#H0: pi=0.45
#H1: pi<0.45

#Intervalo de confianza
binom.test(x = 100,n = 224,conf.level = 0.95)$conf
prop.test(x = 100,p = 0.45,n = 224,conf.level = 0.95)$conf

library(DescTools)
BinomCI(x = 100,n = 224,conf.level = 0.95,method = "wald")
BinomCI(x = 100,n = 224,conf.level = 0.95,method = "agresti-coull")

#####################
#2. Prueba de Mc Nemar
#####################
ayac<-subset(Caso1,Ciudad=="Ayacucho")
med1<-ifelse(ayac$Adición1=="baja",1,0)
ayac$Adición1=="baja"
med2<-ifelse(ayac$Adición2=="baja",1,0)
table(med1,med2)
#Aproximado (corregido y sin corregir)
mcnemar.test(med1,med2,correct = T)
mcnemar.test(med1,med2,correct = F)

library(exact2x2)
mcnemar.exact(med1,med2)

#######################
#3. Prueba de Frecuencias
#######################
truji<-subset(Caso1,Ciudad=="Trujillo")
tabla1<-table(truji$Película)
proba<-c(0.2,0.3,0.4,0.1)
chisq.test(x = tabla1,p = proba)
qchisq(0.03,3,lower.tail=F)
pchisq(340.08,3,lower.tail=F)

library(RVAideMemoire)
multinomial.test(as.vector(tabla1),p=proba)

#Otros ejemplos
rela<-c(4,2,1,3)
chisq.test(x = tabla1,p = rela,rescale.p = T)

tabla2<-c(5,3,8,10)
chisq.test(x = tabla2,p = rela,rescale.p = T)
multinomial.test(as.vector(tabla2),p=rela/10)

puca<-subset(Caso1,Ciudad=="Pucallpa")
tabla3<-table(puca$Película)
res<-chisq.test(x = tabla3,p = proba)
multinomial.test(as.vector(tabla3),p=proba)
res$expected

############################
#4. Prueba de Stuart-Maxwell
############################
tum<-subset(Caso1,Ciudad=="Tumbes")
library(DescTools)
StuartMaxwellTest(tum$Adición1,tum$Adición2)
pchisq(1.3617,2,lower.tail=F)
qchisq(0.03,2,lower.tail=F)

############################################
#5. Prueba de Homogeneidad de Subpoblaciones
############################################
tabla3<-table(Caso1$Ciudad,Caso1$Lectura)
tabla3
res<-chisq.test(Caso1$Ciudad,Caso1$Lectura)
res$expected
qchisq(0.03,4,lower.tail=F)
pchisq(3.0179,4,lower.tail=F)

#############################
#6. Prueba de Exacta de Fisher
#############################
tabla4<-table(Caso1$Instagram,Caso1$Ciudad)
tabla4
tabla<-matrix(c(111,87,100,124),2,2)
tabla
fisher.test(tabla,alternative = "g")

#############################
#7. Prueba de M-H-C
#############################
tabla5<-table(Caso1$Género,Caso1$Lectura,Caso1$Ciudad)
tabla5
mantelhaen.test(Caso1$Género,Caso1$Lectura,Caso1$Ciudad,
                correct=T, exact = T)

#############################
#8. Prueba de Independencia
#############################
tabla6<-table(truji$Género,truji$Película)
chisq.test(truji$Género,truji$Película)
chisq.test(tabla6)
qchisq(0.05,3,lower.tail=F)
pchisq(172.38,3,lower.tail=F)

#############################
#9. Medidas de Asociación
#############################
#a) V de Cramer
library(DescTools)
CramerV(tabla6)
library(vcd)
assocstats(tabla6)
Assocs(tabla6)


#b) Coeficiente de Contingencia de Pearson
ContCoef(tabla6)

#c) Coeficiente Phi
tabla7<-table(iqui$Género,iqui$Lectura)
assocstats(tabla7)
Phi(tabla7)
#Tener cuidado con algunas funciones
Phi(tabla6)

#############################
#10. Medidas de Correlación
#############################
#Spearman
cor.test(tum$Facebook,tum$Tlectura,
         alternative = "t",method = "s")

#Kendall
cor.test(tum$Facebook,tum$Tlectura,
         alternative = "t",method = "k")

#Correlación Parcial
library(ppcor)
pcor.test(puca$Facebook,puca$Tlectura,puca$Tcaminata,
          method = "kendall")
pcor.test(puca$Facebook,puca$Tlectura,puca$Tcaminata,
          method = "s")

#############################
#11. Medidas de Concordancia
#############################
library(vcdExtra)
tabla8<-table(ayac$Opinión1,ayac$Opinión2)
GKgamma(tabla8)
library(DescTools)
Assocs(tabla8)
