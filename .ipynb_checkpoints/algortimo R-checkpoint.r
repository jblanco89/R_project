algortimo R

Data Mining

	>install.packages("rvest")
	install.packages("tidyr")
	install.packages("dplyr")
	install.packages("magrittr")
	
	library(rvest)
	library(tidyr)
	library(dplyr)
	library(magrittr)


> url <- read_html('http://dataset.gabinetevna.com/')
selector_name <- 'td.xl1524518'
tabla <-
  html_nodes(url, selector_name) %>%
  html_text(trim = TRUE)

head(tabla,20) %>% print()


df <- 
  matrix(tabla, ncol = 8, byrow = TRUE) %>%
  as.data.frame() %>%
  tbl_df()
head(df,20)


## Ordenando data
df2 <- 
  df[order(df$V1),]

df2

## reasignamos valores de encabezado

names(df2) = c("Año", "Ciudad", "Vendidos", "Precio", "Margen", "Ingreso", "coste","Ganancia")
df2

