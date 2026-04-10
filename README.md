# 🧬 Bulk RNA-Seq Pipeline: Differential Gene Expression

### 📌 About This Repository
Transcriptomics reveals the dynamic state of a cell. By quantifying RNA abundance, we can determine exactly which gene networks are upregulated or downregulated in response to a disease state, genetic mutation, or developmental stage.

This repository provides a complete, production-ready pipeline for Bulk RNA-Sequencing analysis using the industry-standard `DESeq2` package in R. 

### 🎯 Objective
To process raw count matrices, normalize library sizes, estimate data dispersion, and calculate the statistical significance of differentially expressed genes (Log2 Fold Change).

### 🛠️ Core Technologies & Libraries
* **Differential Expression:** `DESeq2`
* **Data Wrangling:** `tidyverse`
* **Visualization:** `ggplot2` (Volcano Plots, PCA)

### 📂 Modules Included
1. **Data Initialization & QC:** Ingesting feature count matrices and clinical metadata to construct the `DESeqDataSet` object, followed by pre-filtering low-count genes.
2. **Differential Expression Analysis:** Running the core `DESeq()` algorithm to estimate size factors and dispersion, and extracting statistically significant targets (p-adj < 0.05).
3. **Transcriptomic Visualization:** Generating Principal Component Analysis (PCA) plots for sample clustering and Volcano plots to visualize the magnitude of gene expression shifts.
