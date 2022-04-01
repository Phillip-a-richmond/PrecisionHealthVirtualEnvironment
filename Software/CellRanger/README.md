# CellRanger

> This directory houses a CellRanger belonging to the Precision Health Initiative under agreement with Phillip Richmond

  
## Guide online
Can find guide here: [https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/using/tutorial_in](https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/using/tutorial_in)

Had to sign agreement.

## Install
1) Get the tool. 
``` 
wget -O cellranger-6.1.2.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-6.1.2.tar.gz?Expires=1648881459&Policy=eyJTdGF0ZW1lbnQiOlt7IlJlc291cmNlIjoiaHR0cHM6Ly9jZi4xMHhnZW5vbWljcy5jb20vcmVsZWFzZXMvY2VsbC1leHAvY2VsbHJhbmdlci02LjEuMi50YXIuZ3oiLCJDb25kaXRpb24iOnsiRGF0ZUxlc3NUaGFuIjp7IkFXUzpFcG9jaFRpbWUiOjE2NDg4ODE0NTl9fX1dfQ__&Signature=IloGPHr-8GJr0SYyQknuZkhaboZr9GP8bALR8osSSp1tNK7y6LcCBmuxsGRoPVcvyDzgxnlb1aWs8K562uIbJscBGokx2V22h7HRIJ2t45Al4qh9xzAtCAfyiQ5702ipGIo6qJQ~Ak6sUgulaM1RUVnothiMiLJj6RIgzqhY8NHdsg8UF36SpzONqjdYByLER~-eSN-yD79jwXyyKNfs0es~c314ukaZGynECc-bbPDjZ6aykSZTNlOFNAb7NSDZagfnk-qWOT8h6X~6pHLoz0W~opShag4R9yiFbKJXKY3n9U7XpH4FaT9y4UeAqb-rSanE-KuHr6crclbBVilkgQ__&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA"
```  

If you do this yourself, you may have a different link to copy. This likely expires too. To get this download link simply go to the guide online and go to Downloads Page.

2) Unzip
```
tar -zxvf cellranger-6.1.2.tar.gz
```

3) Get reference data
Human
```
wget https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2020-A.tar.gz
tar -zxvf refdata-gex-GRCh38-2020-A.tar.gz
```

Mouse
```
wget wget https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-mm10-2020-A.tar.gz
tar -zxvf refdata-gex-mm10-2020-A.tar.gz
```

Human+mouse?
```
wget https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-and-mm10-2020-A.tar.gz
tar -zxvf refdata-gex-GRCh38-and-mm10-2020-A.tar.gz
```
