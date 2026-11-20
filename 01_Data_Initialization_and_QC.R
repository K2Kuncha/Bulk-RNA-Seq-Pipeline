# =========================================================================
# MODULE 1: Data Initialization (Local Files or Direct NCBI GEO Import)
# AUTHOR: Kuncha Shashidhar
# 
# ABOUT THE DATA:
# Format: Raw Count Matrix (.csv/.tsv) + Metadata, OR an NCBI GEO Accession
# Description: Unlike microarrays which use continuous intensity values, 
#              RNA-Seq uses discrete raw read counts (e.g., from featureCounts 
#              or HTSeq). DESeq2 requires this raw data to build its statistical 
#              model of variance.
# =========================================================================

# BiocManager::install(c("DESeq2", "GEOquery"))
library(DESeq2)
library(GEOquery)
library(dplyr)

# =========================================================================
# USER INPUTS (Choose "local" or "geo" and update the matching parameters)
# =========================================================================
data_source <- "local"          # Options: "local" or "geo"
design_col  <- "Condition"      # Metadata column to test (e.g., "Condition" or "characteristics_ch1")

# Option A: Local Files
counts_path   <- "path/to/raw_counts.csv"
metadata_path <- "path/to/sample_metadata.csv"

# Option B: Direct NCBI GEO Download
geo_accession <- "GSE123456"    # Replace with your target GEO Series ID
geo_count_idx <- 1              # Which supplementary file is the raw count matrix

# =========================================================================
# Loading Count Data & Metadata
# =========================================================================
cat("\n--- Loading Count Data & Metadata ---\n")

if (data_source == "local") {
  count_matrix <- read.csv(counts_path, row.names = 1, check.names = FALSE)
  col_data     <- read.csv(metadata_path, row.names = 1)
  
} else if (data_source == "geo") {
  cat("Fetching metadata and supplementary raw counts from GEO:", geo_accession, "\n")
  
  # 1. Fetch sample metadata (phenotype data)
  gse      <- getGEO(geo_accession, GSEMatrix = TRUE)[[1]]
  col_data <- pData(gse)
  
  # 2. Download supplementary files (where GEO stores RNA-Seq raw counts)
  supp_files <- rownames(getGEOSuppFiles(geo_accession))
  count_file <- supp_files[geo_count_idx]
  
  # 3. Read count matrix (handles .csv, .tsv, .txt, and .gz compressed files)
  sep_char     <- ifelse(grepl("\\.csv", count_file, ignore.case = TRUE), ",", "\t")
  count_matrix <- read.table(count_file, header = TRUE, row.names = 1,
                             sep = sep_char, check.names = FALSE)
} else {
  stop("Invalid data_source. Choose either 'local' or 'geo'.")
}

# =========================================================================
# Sanity Checks & DESeqDataSet Initialization
# =========================================================================
# Ensure sample names in metadata perfectly match column names in counts
stopifnot(all(rownames(col_data) == colnames(count_matrix)))

# Ensure the condition column is a factor
col_data[[design_col]] <- as.factor(col_data[[design_col]])

# Initialize the DESeqDataSet Object
dds <- DESeqDataSetFromMatrix(
  countData = count_matrix,
  colData   = col_data,
  design    = as.formula(paste("~", design_col))
)

# Save object so Module 2 can load it directly
saveRDS(dds, file = "dds_initialized.rds")

cat("DESeqDataSet initialized and saved. Ready for Module 2.\n")
