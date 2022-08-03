## Workshop 2 scProcessing Task

Using scripts 1-3 in the scProcess folder, use the outputs of the PBMCs_X to remove ambient mRNA with SoupX and multiplets with DoubletFinder. Once prepped, we integrate the PBMCs_C and PBMCs_X datasets and begin labeling them by cell type.

<br>

Learning objectives: 
* Use CellRanger mkfastq and count outputs to create a seurat object of scRNAseq data
* Apply two packages (SoupX and DoubletFinder) to help process scRNAseq data
* Perform SCTransform on multiple samples objects at once and integrate them for downstream analysis