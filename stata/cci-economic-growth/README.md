# Does CCI Have an Impact on Economic Growth?

**The OECD Experience for the Year 2019**

*Co-authored research paper · Fall 2020*

---

## Abstract

This study investigates whether the **Consumer Confidence Index (CCI)** has a measurable impact on **GDP growth** across OECD countries in 2019. Using a cross-sectional panel dataset compiled from OECD sources, we control for foreign direct investment (FDI), short-term interest rates, and unemployment. The analysis employs OLS regression with robust standard errors and full diagnostic testing — including the RESET specification test, Breusch-Pagan heteroscedasticity test, and information matrix test.

## Key Findings

- CCI demonstrates a statistically significant relationship with GDP growth
- FDI and interest rates serve as effective control variables
- No evidence of omitted variable bias or heteroscedasticity
- Model passes all robustness checks

## Files

| File | Description |
|------|-------------|
| [report.pdf](report/report.pdf) | Full 17-page research paper |
| [analysis.do](analysis.do) | Stata script — data import, merging, cleaning, regression |
| `data/` | OECD datasets (CCI, GDP growth, FDI, interest rates, unemployment) |

## Data Sources

All data obtained from the **OECD Data Portal**:
- Consumer Confidence Index (CCI)
- GDP volume annual growth rates
- FDI net inflows (% of GDP)
- Short-term interest rates
- Unemployment rates

## Methodology

```stata
OLS regression with robust standard errors
Diagnostics: RESET test · BP test · Information matrix test
```
