# Dynamic Reports with R Markdown

Reproducible research using R Markdown — knitting analysis to PDF.

---

## Output

The document produces a PDF with:

- **Scatterplot** of coursework vs. exam marks
- **Regression table** via `stargazer`
- Full LaTeX formatting (Times New Roman, custom margins)

## Files

| File | Description |
|------|-------------|
| [article.Rmd](article.Rmd) | R Markdown source (editable) |
| [article.pdf](article.pdf) | Knitted PDF output |
| [render.R](render.R) | R script to render via `rmarkdown::render()` |

## Tools

`rmarkdown` · `knitr` · `stargazer` · `tinytex`
