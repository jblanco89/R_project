#algortimo R

#Data Mining

	>install.packages("rvest")
	install.packages("tidyr")
	install.packages("dplyr")
	install.packages("magrittr")
	
	library(rvest)
	library(tidyr)
	library(dplyr)
	library(magrittr)
	





> library(rvest)
> url <- read_html('http://dataset.gabinetevna.com/')
> selector_name <- '.table, .tbody, .tr, td.xl1524518'
> tabla_datos <-
+ html_nodes(url, selector_name)
> head(tabla_datos,5)