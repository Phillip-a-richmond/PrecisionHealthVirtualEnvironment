# install devtools to install CRAN packages
install.packages("devtools")
require("devtools")


devtools:::install_version("fontawesome", version = "0.2.2", repos = "http://cran.us.r-project.org")
devtools:::install_version("gplots", version = "3.1.1", repos = "http://cran.us.r-project.org")
devtools::install_version("ggplot2", version = "3.3.1", repos = "http://cran.us.r-project.org")
devtools::install_version("dplyr", version = "1.0.0", repos = "http://cran.us.r-project.org")
devtools::install_version("knitr", version = "1.33", repos = "http://cran.us.r-project.org")
devtools:::install_version("xaringan", version = "0.25", repos = "http://cran.us.r-project.org")
devtools:::install_version("miniUI", version = "0.1.1", repos = "http://cran.us.r-project.org")
devtools:::install_version("tsne", version = "0.1-3.1", repos = "http://cran.us.r-project.org")
devtools:::install_version("gt", version = "0.6.0", repos = "http://cran.us.r-project.org")
devtools::install_github("hadley/emo")
devtools::install_github("ggobi/ggally")

if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("mixOmics")
