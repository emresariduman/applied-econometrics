<p align="center"><a href="README.md"><b>🇬🇧 English</b></a></p>

# Ekonometri Uygulamaları Ders Projeleri

**Marmara Üniversitesi** — İngilizce İktisat Programı (2020–2021)

---

## Öne Çıkan Projeler

### [📄 Tüketici Güven Endeksi ve Ekonomik Büyüme](./stata/cci-economic-growth) — *Araştırma Makalesi*
> **Ortak yazarlı · 17 sayfa · Stata**

Tüketici Güven Endeksi (CCI) GDP büyümesini etkiler mi? OECD ülkeleri (2019) üzerine panel veri analizi. FDI, faiz oranları ve işsizlik kontrol değişkenleri ile OLS regresyonu, RESET testi, Breusch-Pagan testi.

→ **[Makaleyi oku (PDF)](./stata/cci-economic-growth/report/report.pdf)** · [Analiz script'i](./stata/cci-economic-growth/analysis.do) · [Veri](./stata/cci-economic-growth/data)

<br>

### [🇦🇺 Avustralya Mutluluk Paradoksu'na Yeniden Bakış](./stata/australia-happiness-paradox) — *Replikasyon Çalışması*
> **5 grafik · Detaylı yorum · Stata**

Blanchflower & Oswald'ın paradoksunun ISSP ve WVS verileriyle testi. Avustralya HDI ve GDP'nin öngördüğünden *daha mutlu* çıkıyor — paradoks yok. Asıl soru işareti Norveç.

| | |
|:---:|:---:|
| ![Figür 1](./stata/australia-happiness-paradox/Figure1.png) | ![Figür 2](./stata/australia-happiness-paradox/Figure2.png) |
| Mutluluk vs HDI (ISSP 2002) | Yaşam Memnuniyeti vs HDI (WVS) |
| ![Figür 5](./stata/australia-happiness-paradox/Figure5.png) | ![Figür 4](./stata/australia-happiness-paradox/Figure4.png) |
| Mutluluk vs GDP | Yaşam Memnuniyeti vs GDP |

→ **[Rapor (PDF)](./stata/australia-happiness-paradox/report.pdf)** · [Analiz script'i](./stata/australia-happiness-paradox/analysis.do) · [Referans makale](./stata/australia-happiness-paradox/reference.pdf)

<br>

### [🎤 Bölüm 22 Sunumu: Dinamik Raporlar](./r/dynamic-reports-presentation) — *Sınıf Sunumu*
> **Derste sunuldu · Bahar 2021 · ~200 satır özgün kod**

**R in Action (2. Baskı)** kitabının 22. bölümü üzerine genişletilmiş sunum. Dönem sonu ödevi kapsamında hazırlanıp sınıfta sunuldu.

**Kapsanan konular:**

| Konu | Teknoloji |
|---|---|
| Web raporları | `rmarkdown` (HTML) |
| Yayına hazır PDF | `knitr` + LaTeX |
| Interaktif dashboard | `flexdashboard` |
| Reaktif web uygulamaları | `shiny` + `shinydashboard` (3 örnek) |
| Word entegrasyonu | `R2wd` + `RDCOMClient` |

**Kitabın ötesinde:** RDCOMClient kurulum rehberi, flexdashboard vs shinydashboard karşılaştırması, canlı demo linkleri, 3 tam shinydashboard örneği.

→ **[Sunum script'i (205 satır)](./r/dynamic-reports-presentation/presentation.R)** · [Orijinal kitap kodu](https://github.com/kabacoff/RiA2/blob/master/Ch22%20Creating%20dynamic%20Reports.R) · [Tüm dosyalar](./r/dynamic-reports-presentation)

---

## Diğer Projeler

### [GDP Büyümesinin Belirleyicileri](./stata/gdp-growth-determinants) — Stata
Dünya Bankası verileriyle çapraz kesit OLS regresyonu. İki model karşılaştırması — 6 regresör vs 3 — tam diagnostik seti ile.

→ [Script](./stata/gdp-growth-determinants/analysis.do)

### [İngiltere vs ABD: Penn World Table](./r/pwt-country-comparison) — R
PWT 8.0 ile karşılaştırmalı analiz. Betimleyici istatistikler, `ggplot2` zaman serisi grafikleri, interaktif googleVis dünya haritası.

→ [Script](./r/pwt-country-comparison/analysis.R)

### [Ders Notu vs Sınav Performansı](./r/regression-analysis) — R
Doğrusal regresyon ile ders notu-sınav ilişkisi analizi. Tahmin, Breusch-Pagan testi.

→ [Script](./r/regression-analysis/analysis.R)

### [R Markdown ile Dinamik Raporlar](./r/dynamic-reports) — R
Tekrarlanabilir araştırma pipeline'ı: `.Rmd` → PDF via `knitr` + `stargazer`.

→ [Kaynak](./r/dynamic-reports/article.Rmd) · [PDF çıktısı](./r/dynamic-reports/article.pdf)

---

| Dönem | Araç | Konular |
|-------|------|---------|
| Güz 2020 | **Stata** | Panel veri · OLS · Diagnostik · Hipotez testleri |
| Bahar 2021 | **R** | ggplot2 · googleVis · rmarkdown · shiny · flexdashboard · lmtest |
