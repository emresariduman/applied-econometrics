# Creating Dynamic Reports — Chapter 22 Presentation

**Presented in class · Spring 2021**

Expanded presentation of Chapter 22 from **R in Action (2nd Edition)** by Robert Kabacoff. Prepared and delivered as the end-of-semester chapter presentation assignment.

---

## Topics Covered

| Topic | Technology | File |
|---|---|---|
| R Markdown → HTML | `rmarkdown` | [women.Rmd](women.Rmd) |
| LaTeX → Publication PDF | `knitr` + `knit2pdf` | [drugs.Rnw](drugs.Rnw) |
| 3D Interactive Plots | `rgl` | [3dplot.Rmd](3dplot.Rmd) |
| Flexdashboard | `flexdashboard` | [dashboard.Rmd](dashboard.Rmd) |
| Shinydashboard | `shiny` + `shinydashboard` | *(inline in script)* |
| Microsoft Word Integration | `R2wd` + `RDCOMClient` | *(inline in script)* |

## Additions Beyond the Book

- **RDCOMClient installation guide** — troubleshooting the notoriously tricky Windows COM setup
- **3 complete shinydashboard examples** — blank, basic, and advanced (with message menus)
- **Flexdashboard vs Shinydashboard comparison table**
- **Curated links** to live dashboard examples and LaTeX documentation
- **browseURL demos** for interactive walkthrough

## Source

Based on [R in Action (2nd Ed.) — Chapter 22](https://github.com/kabacoff/RiA2/blob/master/Ch22%20Creating%20dynamic%20Reports.R) by Robert Kabacoff, extended and presented for Applied Econometrics (Spring 2021).

## Files

| File | Description |
|------|-------------|
| [presentation.R](presentation.R) | Main presentation script (205 lines) |
| [women.Rmd](women.Rmd) | R Markdown example — regression report |
| [drugs.Rnw](drugs.Rnw) | Sweave/LaTeX example — ANOVA with xtable |
| [dashboard.Rmd](dashboard.Rmd) | Flexdashboard template |
| [3dplot.Rmd](3dplot.Rmd) | Interactive 3D plot with rgl |
