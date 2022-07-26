# install devtools to install CRAN packages
install.packages("devtools")
require("devtools")

devtools::install_version("ggplot2", version = "3.3.1", repos = "http://cran.us.r-project.org")
devtools::install_version("dplyr", version = "1.0.0", repos = "http://cran.us.r-project.org")
devtools::install_version("knitr", version = "1.33", repos = "http://cran.us.r-project.org")

## analysis pipeline diagram
devtools:::install_version("DiagrammeR", version = "1.0.6.1", repos = "http://cran.us.r-project.org")
devtools:::install_version("DiagrammeRsvg", version = "0.1", repos = "http://cran.us.r-project.org")
devtools:::install_version("magrittr", version = "1.5", repos = "http://cran.us.r-project.org")
devtools:::install_version("rsvg", version = "2.1", repos = "http://cran.us.r-project.org")
