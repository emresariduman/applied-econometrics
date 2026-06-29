# Revisiting the Australia Happiness Paradox

A replication analysis of Blanchflower & Oswald's paradox using **ISSP 2002** and **World Values Survey** data.

---

## Question

Is Australia happier or unhappier than its HDI and GDP per capita would predict?

## Approach

Using both ISSP and WVS datasets, we regress happiness and life satisfaction on:
- **Human Development Index (HDI)**
- **GDP per capita (log scale)**

We also test the sensitivity of results by excluding former Warsaw Pact countries and comparing happiness vs. life satisfaction as the dependent variable.

## Key Findings

- Australia consistently appears **above the regression line** — happier than predicted
- No "Australia Paradox" found; Australia is relatively happy
- Norway is the more puzzling case: high HDI/GDP but lower happiness
- Excluding Warsaw Pact countries changes the regression slope significantly
- Life satisfaction correlates more strongly with GDP/HDI than happiness does
- Happiness and life satisfaction produce similar but not identical results

## Files

| File | Description |
|------|-------------|
| [analysis.do](analysis.do) | Stata script with 5 figures and detailed commentary |
| [report.pdf](report.pdf) | Written report |
| [reference.pdf](reference.pdf) | Blanchflower & Oswald (2005), "The Paradox of Australia" |
| `data/` | ISSP 2002, WVS, GDP per capita 1995–2002 |
| Figure 1–5 | Generated graphs (embedded below) |

## Figures

![](Figure1.png)
*Happiness vs HDI (ISSP 2002): Australia above the regression line*

![](Figure2.png)
*Life Satisfaction vs HDI (WVS)*

![](Figure4.png)
*Life Satisfaction vs GDP per capita (log scale)*

![](Figure5.png)
*Happiness vs GDP per capita (log scale)*
