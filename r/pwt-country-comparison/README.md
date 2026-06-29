# UK vs USA: A Penn World Table Comparison

Comparative analysis of the United Kingdom and the United States using **Penn World Table 8.0**.

---

## Variables

- **`rgdpe`** — Expenditure-side real GDP at chained PPPs (living standards comparison)
- **`hc`** — Human capital index per person

## Approach

1. Descriptive statistics by country (using `psych::describeBy`)
2. Time-series line charts with economist-themed ggplot2 styling
3. Interactive world map of human capital distribution (googleVis)

## Key Findings

- USA has significantly higher GDP and human capital than the UK
- Both countries follow similar human capital growth trajectories
- USA diverges substantially in GDP growth over the period (1950–2011)
- USA shows higher variability on both measures (higher standard deviation)

## Files

| File | Description |
|------|-------------|
| [analysis.R](analysis.R) | R script — descriptive stats, ggplot2 charts, googleVis map |

## Tools

`pwt8` · `psych` · `ggplot2` · `ggthemes` · `googleVis`
