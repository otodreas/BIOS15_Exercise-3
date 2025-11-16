# BIOS15_Exercise-3 Report

This repository contains my work I did for exercise 3 of BIOS15 at Lund
University. This repository hosts the website
<https://otodreas.github.io/BIOS15_Exercise-3> which contains the report. The
repository structure is as follows:

```         
BIOS15_Exercise-3/
├── Data/
|   └── butterflies.csv
├── docs/
|   ├── images/
|   |   └── Fig1.svg
|   ├── index_files/
|   |   └── Various web files ...
|   ├── index.html
|   └── index.qmd
├── Materials/
|   ├── Chapter3_ANOVA.pdf
|   └── Lecture3_ANOVA.pdf
├── Output/
|   ├── anova_aw.csv
|   ├── anova_gr.csv
|   ├── data_summary.csv
|   └── Fig1.svg
├── Script/
|   └── Analysis.R
├── .gitignore
├── BIOS15_Exercise-3.Rproj
└── README.md
```

Where `docs/` contains everything related to the web page. `docs/index.qmd` is
the write-up which is published on the website in quarto format. As you see on
the website, `Script/Analysis.R` contains the R code used to generate the stats
and plot used in the report.

To run the code for yourself, simply download the repository, open it as an R-
Project, and run `Script/Analysis.R`.