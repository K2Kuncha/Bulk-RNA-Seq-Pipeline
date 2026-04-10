# =========================================================================
# MODULE 1: Data Initialization & Pre-Filtering
# AUTHOR: Kuncha Shashidhar
# 
# 🧬 ABOUT THE DATA:
# Format: Raw Count Matrix (.csv or .tsv) and Metadata
# Description: Unlike microarrays which use continuous intensity values, 
#              RNA-Seq uses discrete raw read counts (e.g., from featureCounts 
#              or HTSeq). DESeq2 requires this raw data to build its statistical 
#              model of variance.
# =========================================================================

# BiocManager::install("DESeq2")
library(DESeq2)
library(dplyr)

cat("\n--- Phase 1: Loading Count Data & Metadata ---\n")

# To run locally, point these paths to your count matrix and clinical data
# count_matrix <- read.csv("path/to/raw_counts.csv", row.names = 1)
# col_data <- read.csv("path/to/sample_metadata.csv", row.names = 1)

# Ensure sample names in the metadata perfectly match the column names in the counts
# all(rownames(col_data) == colnames(count_matrix))

# Initialize the DESeqDataSet Object
# The design formula (~ Condition) tells the model what we are testing for
# dds <- DESeqDataSetFromMatrix(countData = count_matrix,
#                               colData = col_data,
#                               design = ~ Condition)

cat("\n--- Phase 2: Pre-Filtering Low-Count Genes ---\n")

# Genes with very few reads across all samples add noise and slow down computation.
# We filter out genes that don't have at least 10 reads total.
# keep <- rowSums(counts(dds)) >= 10
# dds <- dds[keep,]

cat("DESeqDataSet initialized and pre-filtered. Ready for analysis.\n")
