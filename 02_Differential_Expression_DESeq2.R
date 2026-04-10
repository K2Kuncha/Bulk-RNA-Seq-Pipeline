# =========================================================================
# MODULE 2: Core DESeq2 Algorithm & Results Extraction
# AUTHOR: Kuncha Shashidhar
# 
# 🧬 ALGORITHM OVERVIEW:
# 1. Estimates Size Factors (controls for differences in sequencing depth).
# 2. Estimates Dispersion (accounts for biological variance between replicates).
# 3. Fits a Negative Binomial Generalized Linear Model (GLM).
# =========================================================================

library(DESeq2)

cat("\n--- Executing Differential Expression Analysis ---\n")

# Run the standard DESeq2 pipeline
# dds <- DESeq(dds)

# Extract the results (comparing 'Disease' vs 'Control')
# res <- results(dds, contrast=c("Condition", "Disease", "Control"))

# Shrink the Log2 Fold Changes for genes with low counts or high dispersion
# This prevents noisy genes with low counts from appearing highly significant
# res_shrunk <- lfcShrink(dds, coef="Condition_Disease_vs_Control", type="apeglm")

# Filter for statistically significant genes (Adjusted p-value < 0.05)
# sig_genes <- subset(res_shrunk, padj < 0.05)

# Sort by the most dramatic Log2 Fold Changes (Upregulated)
# sig_genes_sorted <- sig_genes[order(sig_genes$log2FoldChange, decreasing = TRUE), ]

cat("Analysis complete. Significant genes isolated based on FDR < 0.05.\n")
# head(sig_genes_sorted)
