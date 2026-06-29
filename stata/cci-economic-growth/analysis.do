import delimited "cci 2019.csv",clear
save "cci"
import delimited "FDI-2019-OECD.csv",clear
rename value_fdi fdi
save "fdi"
import delimited "short term interest rates 2019 OECD.csv", clear
rename value interestrate
save "interest rate"
import delimited "unemployment 2019.csv", clear
rename countrycode location
save "unemployment"
import delimited "GDP, volume – annual growth rates in percentage 2019.csv", clear
save "gdpgrowth"

use "cci", clear
merge 1:1 location using "unemployment"
drop _merge
merge 1:1 location using "gdpgrowth"
drop _merge
merge 1:1 location using "interest rate"
drop _merge
merge 1:1 location using "fdi"

keep countryname location cci gdpgrowth unemployment interestrate fdi
order location countryname gdpgrowth cci fdi interestrate unemployment
destring fdi interestrate, replace dpcomma
save project

//dataset is ready


