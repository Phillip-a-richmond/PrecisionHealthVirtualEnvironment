# GRCh38
cd /project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/References/GRCh38/Genome/
mkdir -p CellRanger
cd CellRanger
wget https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-GRCh38-2020-A.tar.gz
tar -zxvf refdata-gex-GRCh38-2020-A.tar.gz

# mm10
cd /project/st-sturvey-1/PrecisionHealthVirtualEnvironment/Databases/References/
mkdir -p mm10/
cd mm10
mkdir -p Genome/
cd Genome/
mkdir -p CellRanger/
cd CellRanger

wget https://cf.10xgenomics.com/supp/cell-exp/refdata-gex-mm10-2020-A.tar.gz
tar -zxvf refdata-gex-mm10-2020-A.tar.gz


