
/////////////////////Figure 1//////////////////////

use ISSP&HDI, clear
generate Warsaw=0
replace Warsaw = 1 if hdirank ==32 | hdirank ==38 | hdirank ==56 | hdirank ==57 | hdirank ==42 | hdirank ==50

twoway (scatter issp2002 hdi if cty !="AUS" , msize(vsmall) msymbol(diamond) mlabel(cty) mlabsize(vsmall)) (lfit issp2002 hdi, lcolor(green) lwidth(medium) lpattern(solid)) (lfit issp2002 hdi if Warsaw==0, lcolor(orange) lpattern(longdash)) (scatter issp2002 hdi if cty =="AUS", mcolor(maroon) msymbol(square) mlabel(country) mlabsize(medsmall) mlabcolor(maroon) mlabposition(9)), ytitle((1= Completely unhappy to 7=Completely happy)) ytitle(, size(small)) yscale(range(4.6 5.6)) xtitle(UN Human Development Index (0-1)) xtitle(, size(medsmall)) xscale(range(0.75 1)) xmtick(, valuelabel grid glwidth(medthin)) title(Happiness and the Human Development Index, size(medlarge) color(navy)) subtitle(ISSP 2002 Data, size(medsmall) color(black)) caption("Happiness, ISSP 2002", size(medsmall) position(9) orientation(vertical)) legend(on rows(2) title(Regression Line, size(small) color(navy)) position(5) ring(0) label(1 "") label(2 "All Data: Happiness=3.8+1.6*HDI (t=2.3)") label(3 "Excluding former Warsaw Pact countries") label(4 "") order(2 3) ) plegend(on nocolfirst rows(2)) xsize(5) ysize(4) scale(0.855) xlabel(.75 .8 .85 .9 .95 1)

//The relevant country group would be the countries with HDI levels around 0.9 and 0.95. The green regression line predicts Australia’s happiness level to be lower. And there are plenty of countries with near HDI levels of the Australia’s that are corresponding with lower happiness levels. So, it does not seem that there is a paradox. And Australia is happier than the prediction. After excluding the former Warsaw Pact countries, the slope of the regression line changes. And it seems as the lower HDI levels corresponds to more happiness.





/////////////////////Figure 2//////////////////////

use WVS&HDI, clear

twoway (scatter lifesat hdi if cty !="AUS", msize(vsmall) msymbol(diamond) mlabel(cty) mlabsize(vsmall)) (scatter lifesat hdi if cty =="AUS", mcolor(maroon) msymbol(square) mlabel(country) mlabsize(medsmall) mlabcolor(maroon) mlabposition(9)) (lfit lifesat hdi, lcolor(green) lpattern(longdash)), ytitle(Average Score (1='Dissatisfied' to 10='Satisfied')) ytitle(, size(small) margin(esubhead)) yscale(range(4 8)) xtitle(Human Development Index (0-1)) xtitle(, size(medsmall)) xscale(range(0.4 1)) title(Life Satisfaction and the Human Development Index) subtitle(World Values Survey) caption(Life Satisfaction = 1.9 + 5.7 * HDI (t=7.1), size(small) position(11) ring(0)) note("Life Satisfaction, WVS", size(medium) position(9) orientation(vertical) justification(right)) legend(off)


//The correlation coefficient is 0.6352, means that there is moderate positive linear relationship. There is not really a strong or a weak correlation. It can be also seen visually in graph by the distribution of the points and the slope.
 



/////////////////////Figure 3//////////////////////

use WVS&HDI, clear

twoway (scatter happins hdi if cty !="AUS", msize(vsmall) msymbol(diamond) mlabel(cty) mlabsize(vsmall)) (scatter happins hdi if cty =="AUS", mcolor(maroon) msymbol(square) mlabel(country) mlabsize(medsmall) mlabcolor(maroon) mlabposition(9)) (lfit happins hdi, lcolor(green) lwidth(vthin) lpattern(dash)), ytitle(Average Score (1='Not at all happy' to 4='Very happy')) ytitle(, size(small)) xtitle(Human Development Index (0-1)) title(Happiness and the Human Development Index, size(medium)) subtitle(World Values Survey, size(medsmall) color(black)) caption(Happiness = 2.7 + 0.4 * HDI (t=1.4), position(12) ring(0)) note("Happiness, WVS", size(small) position(9) orientation(vertical)) legend(off)



//I don’t think that there is a big difference on figures, considering that the most of the countries stand on near positions by the regression line. It should be considered that the x and y axes have different ranges on both graphs. Figure 3 has more observations and a regression line with lower t-value. Means it could be more to be rely on. I think there is some distinction between the happiness and the life satisfaction, because there are some countries with different results on both figures, but I don’t think the distinction is really high, they gave similar results overall. Tanzania and Nigeria are drawing attention with low HDI levels and highest happiness levels. And there is the “Warsaw quadruple” Ukraine, Russia, Romania and Bulgaria.





/////////////////////Figure 4//////////////////////

use WVS&HDI, clear
merge 1:1 cty using "gdp per capita 1995-2002", keep(match)
gen lngdp=ln(gdp2002)
gen gdp=gdp2002
reg lifesat lngdp
predict lfit
twoway (scatter lifesat gdp if cty !="AUS", msize(vsmall) msymbol(diamond) mlabel(cty) mlabsize(vsmall)  ytitle(Average Score (1='Dissatisfied' to 10='Satisfied')) yscale(range(4 8.5)) xtitle(GDP per capita in US$ at PPP (log scale)) title(Life Satisfaction and GDP Per Capita) subtitle(World Values Survey) caption(Life Satisfaction =-0.9 + 0.8 * Log GDP (t=8.3), position(12) ring(0) linegap(1)) note("Life Satisfaction, WVS", size(medium) position(9) orientation(vertical)) legend(off) scale(0.90)) (line lfit gdp, sort clpat(longdash) lcolor(green) lwidth(thin) lpattern(longdash)) (scatter lifesat gdp if cty =="AUS", mcolor(maroon) msymbol(square) mlabel(countryname) mlabsize(medsmall) mlabcolor(maroon) mlabposition(9)), xscale(log) xlabel(2000 5000 10000 20000 35000 60000) 


//There is a positive moderate correlation between the life satisfaction and the GDP. GDP accords with the "lifesat" in a similar way as the HDI accords. Regression lines and country dots demonstrate similar positions.






/////////////////////Figure 5//////////////////////

use WVS&HDI, clear
merge 1:1 cty using "gdp per capita 1995-2002", keep(match)
gen lngdp=ln(gdp2002)
gen gdp=gdp2002
reg happins lngdp
predict lfit
twoway (scatter happins gdp if cty !="AUS", msize(vsmall) msymbol(diamond) mlabel(cty) mlabsize(vsmall)  ytitle(Average Score (1='Not at all happy' to 4='Very happy')) yscale(range(2.5 3.5)) xtitle(GDP per capita in US$ at PPP (log scale)) title(Happiness and GDP Per Capita) subtitle(World Values Survey) caption(Happiness = 2.3 + 0.08 * Log GDP (t=2.5), position(12) ring(0) linegap(1)) note("Happiness, WVS", size(medium) position(9) orientation(vertical)) legend(off) scale(0.90)) (line lfit gdp, sort clpat(longdash) lcolor(green) lwidth(thin) lpattern(longdash)) (scatter happins gdp if cty =="AUS", mcolor(maroon) msymbol(square) mlabel(countryname) mlabsize(medsmall) mlabcolor(maroon) mlabposition(9)) , xscale(log) xlabel(2000 5000 10000 20000 35000 60000)


//There is a weak positive correlation between the happines and the GDP. GDP accords with the "happins" in a similar way as the HDI accords. Regression lines and country dots demonstrate similar positions.




//General Assesment//

//All graphs demonstrate the Australia as they are happier than the regression line. Australia do not seem to be relatively unhappy, they are relatively happy. Their all happiness scores accord with the other countries that are showing similar scores on both HDI and GDP measurements. And I do not find the relationship between subjective well-being and development in Australia puzzling. The real question would be the Norway's position, they are ahead in both GDP and HDI scores but they have quite lower happiness levels. Australia at least is always above the regression lines.















