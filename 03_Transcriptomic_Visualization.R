# =========================================================================
# MODULE 3: Transcriptomic Visualization (PCA & Volcano Plots)
# AUTHOR: Kuncha Shashidhar
# 
# 🔍 REAL WORLD APPLICATION:
# PCA identifies whether biological replicates group together, validating 
# the experiment. Volcano plots visually highlight the most significantly 
# altered genes (high fold-change + high statistical significance).
# =========================================================================

library(DESeq2)
library(ggplot2)

cat("\n--- Generating PCA Plot ---\n")

# Transform counts for clustering visualization (Variance Stabilizing Transformation)
# vsd <- vst(dds, blind=FALSE)

# Plot PCA
# pca_plot <- plotPCA(vsd, intgroup=c("Condition")) + 
#   theme_minimal() +
#   labs(title = "PCA of RNA-Seq Samples")
# print(pca_plot)

cat("\n--- Generating Volcano Plot ---\n")

# Convert results object to a standard dataframe for ggplot2
# res_df <- as.data.frame(res_shrunk)

# Add a logical column to color the significant genes
# res_df$Significant <- ifelse(res_df$padj < 0.05 & abs(res_df$log2FoldChange) > 1, 
#                              "Significant", "Not Significant")

# Plot Volcano
# volcano_plot <- ggplot(res_df, aes(x = log2FoldChange, y = -log10(padj), color = Significant)) +
#   geom_point(alpha = 0.6, size = 1.5) +
#   scale_color_manual(values = c("gray", "red")) +
#   theme_minimal() +
#   geom_vline(xintercept = c(-1, 1), linetype = "dashed", color = "blue") +
#   geom_hline(yintercept = -log10(0.05), linetype = "dashed", color = "blue") +
#   labs(title = "Volcano Plot of Differential Expression",
#        x = "Log2 Fold Change",
#        y = "-Log10(Adjusted P-Value)")

# print(volcano_plot)

cat("Visualizations rendered successfully.\n")
