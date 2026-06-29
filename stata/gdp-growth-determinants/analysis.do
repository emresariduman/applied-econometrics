import delimited "data/data.csv", delimiter(comma) varnames(1) encoding(UTF-8) numericcols(9) clear

//I expect exportsofgoodsandservicesofgdp, foreigndirectinvestmentnetinflow, grossnationalexpenditureofgdp, grosscapitalformationofgdp and inflationgdpdeflatorannual to have a positive effect on gdpgrowthannual. And i expect centralgovernmentdebttotalofgdp to have mostly negative effect on gdpgrowthannual, but i have doubts for this one, i am not sure that it has linear effect.

drop time
summarize

 * Variable |        Obs        Mean    Std. Dev.       Min        Max
*-------------+---------------------------------------------------------
* countryname |          0
*gdpgrowtha~l |         37    1.535513    2.179111  -3.241425   8.485817
*exportsofg~p |         37    52.43894    33.54316   13.54452   190.6286
*foreigndir~w |         37     3.92556    8.678453  -5.682227   37.48074
*grossnatio~p |         37    96.51071    6.968364   67.98477   104.9413
*-------------+---------------------------------------------------------
*grosscapit~p |         37    21.54973    4.112724   11.60105   29.88533
*inflationg~l |         37    1.571328    1.410761    -2.3523    6.28011
*centralgov~p |         12    75.62502    52.94753   .0380393   188.8815

//All other variables having 37 observations, centralgovernmentdebttotalofgdp has 12 of them, would be a problem for regression. exportsofgoodsandservicesofgdp and centralgovernmentdebttotalofgdp having biggest standard deviations means they have the most dispersed range of values. Mins and maxes are all seem acceptable.

regress gdpgrowthannual exportsofgoodsandservicesofgdp foreigndirectinvestmentnetinflow grossnationalexpenditureofgdp grosscapitalformationofgdp inflationgdpdeflatorannual centralgovernmentdebttotalofgdp, vce(robust)
estimates save "1", replace
estimates store reg1

//Linear regression                               Number of obs     =         12
//                                                F(6, 5)           =       7.58
//                                                Prob > F          =     0.0210
//                                                R-squared         =     0.7873
//                                                Root MSE          =      1.617
//
//--------------------------------------------------------------------------------------------------
//                                 |               Robust
//                 gdpgrowthannual |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
//---------------------------------+----------------------------------------------------------------
//  exportsofgoodsandservicesofgdp |   .0237294    .051415     0.46   0.664    -.1084371    .1558959
//foreigndirectinvestmentnetinflow |   .0676461   .0825501     0.82   0.450    -.1445557    .2798479
//   grossnationalexpenditureofgdp |     .19745   .2817529     0.70   0.515    -.5268189    .9217189
//      grosscapitalformationofgdp |   .2523114   .1012711     2.49   0.055    -.0080143     .512637
//      inflationgdpdeflatorannual |   .5449172   .2802175     1.94   0.109    -.1754048    1.265239
// centralgovernmentdebttotalofgdp |  -.0024389   .0085945    -0.28   0.788    -.0245317    .0196539
//                           _cons |  -24.23338   29.16895    -0.83   0.444    -99.21455    50.74778
//--------------------------------------------------------------------------------------------------


*Prob > F=0.0210<0.05 means that regressors are jointly statistically significant at %95 level. 
*R-squared=0.7873 Model explains much of the variation
*None of the variables are individiually seem to be statistically significant here except grosscapitalformationofgdp, which is statistically significant at 0.1 level. inflationgdpdeflatorannual is close though.
*Coefficient signs seem as i expected at first.
*grosscapitalformationofgdp, inflationgdpdeflatorannual and grossnationalexpenditureofgdp are respectively associated with 25.3%, 54.5% and 19.8% rises in gdpgrowthannual.


rvfplot
predict uhat, residual
predict yhat, xb
list gdpgrowthannual yhat uhat
//There seem to be an outlier with gdpgrowthannual is around 8. 

estat ovtest
// Prob > F=0.7607 Fail to reject the null hypothesis, model has no omitted variables.

qui regress gdpgrowthannual exportsofgoodsandservicesofgdp foreigndirectinvestmentnetinflow grossnationalexpenditureofgdp grosscapitalformationofgdp grosscapitalformationofgdp grosscapitalformationofgdp inflationgdpdeflatorannual centralgovernmentdebttotalofgdp
estat hettest 
estat imtest
//In "hettest" Prob>chi2=0.5009 fail to reject homoscedasticity. In "imtest" heteroskedasticity has p= 0.3636, means for rejecting heteroskedasticity.

test foreigndirectinvestmentnetinflow = exportsofgoodsandservicesofgdp
//Prob > F =0.6014>0.05, do not reject the null hypothesis of coefficient equality at 5% level. there is no statistically significant difference between the coefficients of two variables. 

regress gdpgrowthannual exportsofgoodsandservicesofgdp inflationgdpdeflatorannual grosscapitalformationofgdp, vce(robust)
estimates save "2", replace
estimates store reg2

//Linear regression                               Number of obs     =         37
//                                                F(3, 33)          =       5.34
//                                                Prob > F          =     0.0041
//                                                R-squared         =     0.3769
//                                                Root MSE          =     1.7966
//
//------------------------------------------------------------------------------------------------
//                               |               Robust
//               gdpgrowthannual |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
//-------------------------------+----------------------------------------------------------------
//exportsofgoodsandservicesofgdp |   .0011091   .0104014     0.11   0.916    -.0200528    .0222709
//    inflationgdpdeflatorannual |   .6458393   .2397666     2.69   0.011     .1580304    1.133648
//    grosscapitalformationofgdp |   .1679467   .0786746     2.13   0.040     .0078821    .3280113
//                         _cons |  -3.156676   1.815455    -1.74   0.091    -6.850247    .5368945
//------------------------------------------------------------------------------------------------

*Prob > F=0.0041<0.01 means that regressors are jointly statistically significant at %99 level. 
*R-squared=0.3796 Model does not explain much of the variation
*inflationgdpdeflatorannual and grosscapitalformationofgdp are individiually statistically significant at 5% level. constant variable is statistically significant at 10% level.
*Coefficient signs seem as i expected at first again.
*inflationgdpdeflatorannual is associated with a 64.6% rise in gdpgrowthannual.
*grosscapitalformationofgdp is associated with a 16.8% rise in gdpgrowthannual.
*exportsofgoodsandservicesofgdp was not statistically significant and its coefficient also shows this.

rvfplot

//There do not seem to be an outlier.

estat ovtest

// Prob > F =0.0810 Fail to reject the null hypothesis, model has no omitted variables.

qui regress gdpgrowthannual exportsofgoodsandservicesofgdp inflationgdpdeflatorannual grosscapitalformationofgdp
estat hettest
estat imtest

// Prob > chi2=0.1764 fail to reject homoscedasticity. In "imtest" heteroskedasticity has p= 0.4094, means for rejecting heteroskedasticity.

estimates table reg1 reg2, stats(N r2 F ll)

//I would choose the second model of regression. Because:
*It has 37 number of observations 
*It has an overall F-stat with lower P than the other. 
*It has in general, more individiually statistically significant variables.
*It does not have the foreigndirectinvestmentnetinflow and exportsofgoodsandservicesofgdp at the same time. Their coefficients have no statistically significant difference inbetween.



