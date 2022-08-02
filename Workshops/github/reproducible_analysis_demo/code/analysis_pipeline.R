library(DiagrammeR)
library(DiagrammeRsvg)
library(magrittr)
library(rsvg)

graph <- grViz("
  digraph boxes_and_circles {

  # Get data
  get_data
  [label='get_data.sh\n\
        Get data scRNAseq data from github']

  scrnaseq
  [label='tasic_training_b2.txt\n\
        scRNAseq data']

  cell_labels
  [label='tasic_labels.tsv\n\
        cell-type labels']

  get_data -> scrnaseq
  get_data -> cell_labels

  # Run analysis
  run_analysis
  [label='run_analysis.py\n\
        Apply PHATE to scRNAseq data']

  phate
  [label='phate.csv\n\
        PHATE results']

  scrnaseq -> run_analysis
  run_analysis -> phate

  # Plot results
  visualize_results
  [label='visualize_results.r\n\
        Visualize PHATE results']

  dim_plot
  [label='phate_plot.png\n\
        PHATE plot']

  phate -> visualize_results
  cell_labels -> visualize_results
  visualize_results -> dim_plot

  # Write paper
  manuscript_rmd
  [label='manuscript.Rmd\n\
        Manuscript']
  manuscript_doc
  [label='manuscript.doc\n\
        Word document']

  cell_labels -> manuscript_rmd
  dim_plot -> manuscript_rmd
  manuscript_rmd -> manuscript_doc

  }
")

graph %>%
  export_svg %>% charToRaw %>% rsvg_pdf("analysis_pipeline.pdf")