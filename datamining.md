```R
---
title: "Payless"
output:
  word_document: default
  html_document:
    df_print: paged
  pdf_document: default
---

```{r message=FALSE, warning=FALSE}
#Instalaremos los paquetes necesarios
#install.packages("rvest")
#install.packages("tidyr")
#install.packages("dplyr")
#install.packages("magrittr")
#install.packages("ggplot2")
```

```{r message=FALSE, warning=FALSE}
#llamaremos las librerías correspondientes
library(tidyr)
library(dplyr)
library(magrittr)
library(rvest)
library(ggplot2)

#Efectuamos la extracción de los datos

url <- read_html('http://dataset.gabinetevna.com/')
selector_name <- 'td.xl1524518' #Especificamos selector css
tabla <-
  html_nodes(url, selector_name) %>% #establecemos los nodos
  html_text(trim = TRUE)%>% #convvertimos a texto
  .[-c(length(.), length(.))]  

head(tabla,20) %>% print() #Observamos resultados

```


```{r message=FALSE, warning=FALSE}
#Convertimos el vector en una matriz
df <- 
  matrix(tabla, ncol = 8, byrow = TRUE) %>%
  as.data.frame() %>%
  tbl_df()
head(df,20) #vemos los resultados

```
```{r message=FALSE, warning=FALSE}
#Removemos la primera fila
df2 <-
  df[c(-1),] #la coma nos dice que se removera la misma fila en todas las columnas
df2
```


```{r message=FALSE, warning=FALSE}
# procedemos a ordenar los datos desde el año 2010
df3 <- 
  df2[order(df2$V1),]

df3
```
```{r message=FALSE, warning=FALSE}
## Renombramos encabezado

names(df3) = c("Año", "Ciudad", "Vendidos", "Precio", "Margen", "Ingreso", "Coste","Ganancia")

head(df3, 10)

```

```{r message=FALSE, warning=FALSE}
#Filtramos algunos datos de interés, como Alicante y 2015
df4 <- 
  filter(df3, Año == 2015, Ciudad == "Alicante")

df4

```


```{r message=FALSE, warning=FALSE}
#Aplicamos otro filtrado, mismo año ciudad Vigo
filter(df3, Año == 2015, Ciudad =="Vigo" )
```
```{r message=FALSE, warning=FALSE}
#separamos algunos datos para observarlos de manera aislada
select(df3, Año, Vendidos, Ingreso)
```


```{r message=FALSE, warning=FALSE}
#Ahora visualizamos algunos datos para observar algun patrón de comportamiento
#--------------
#ventas por año
#--------------
ggplot(df3) + aes(x= Año, y = Vendidos) + geom_col(fill="skyblue")+ scale_x_discrete() + scale_y_discrete(breaks = c(0,100, 500,1000))

#--------------
#ventas por sucursal
#--------------
ggplot(df3) + aes(x= Ciudad, y = Vendidos) + geom_col( fill="red") + scale_x_discrete() + scale_y_discrete(breaks = c(0,100, 500,1000)) 

#--------------
#Relación Ventas y precio
#--------------
ggplot(df3, aes(Vendidos, Precio)) + geom_point(alpha = 0.8) + scale_x_discrete(breaks = c(0,100, 500,1000)) + scale_y_discrete(breaks = c(0,10,50,100))

#--------------
#Relación Ventas y Coste
#--------------
ggplot(df3, aes(Vendidos, Coste)) + geom_point(alpha =0.2) + scale_x_discrete(breaks = c(0,100, 500,1000)) + scale_y_discrete(breaks = c(0,10,50,100))
```


```


```R

```
