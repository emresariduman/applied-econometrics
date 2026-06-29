# Determinants of GDP Growth

Cross-country OLS regression analysis using **World Bank Development Indicators**.

---

## Question

What factors determine GDP growth across countries? We test six potential determinants:
- Exports of goods & services (% of GDP)
- FDI net inflows (% of GDP)
- Gross national expenditure (% of GDP)
- Gross capital formation (% of GDP)
- Inflation (GDP deflator, annual %)
- Central government debt (% of GDP)

## Approach

Two models are estimated and compared:

| | Model 1 | Model 2 |
|---|---|---|
| **Regressors** | All 6 variables | Exports, inflation, capital formation |
| **Observations** | 12 | 37 |
| **R-squared** | 0.7873 | 0.3769 |
| **Joint significance** | p = 0.021 | p = 0.004 |

Model 2 is preferred due to larger sample size, lower F-statistic p-value, and more individually significant coefficients.

## Diagnostics

- **RESET test** — No omitted variable bias
- **Breusch-Pagan** — Homoscedasticity confirmed
- **Information matrix test** — No heteroscedasticity
- **Coefficient equality F-test** — No significant difference between export and FDI coefficients

## Files

| File | Description |
|------|-------------|
| [analysis.do](analysis.do) | Full Stata script with embedded results and interpretation |
| `data/` | World Bank WDI extract (CSV + metadata) |
