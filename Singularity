# The plinkr R package, with the multiple PLINK versions installed

Bootstrap: docker
From: r-base

%post
    sed -i 's/$/ universe/' /etc/apt/sources.list
    apt-get update
    apt-get -y install libssl-dev libcurl4-openssl-dev libxml2-dev r-cran-stringi
    apt-get clean
    Rscript -e 'install.packages(c("remotes", "devtools"))'
    Rscript -e 'remotes::install_github("richelbilderbeek/plinkr")'
    Rscript -e 'plinkr::install_plinks(plink_optionses = plinkr::create_plink_optionses(plink_folder = "/opt/plinkr"))'

%apprun R
exec R "$@"

%apprun Rscript
exec Rscript "$@"

%runscript
exec R "$@"

%test
    Rscript -e 'plinkr::plinkr_report(plink_optionses = plinkr::create_plink_optionses(plink_folder = "/opt/plinkr"))'

%help

This container has the R package plinkr and multiple versions of PLINK installed.

When using this container, set `plink_folder` to `/opt/plinkr`, for example:

```
library(plinkr)
plink_optionses <- create_plink_optionses(plink_folder = "/opt/plinkr")
assoc(
  assoc_params = create_demo_assoc_params(),
  plink_options = plink_optionses[[2]]
)
```

%labels

    AUTHOR Richel J.C. Bilderbeek

    NAME plinkr
 
    DESCRIPTION The plinkr R package, with the multiple PLINK versions installed

    USAGE simply run the container

    URL https://github.com/richelbilderbeek/plinkr

    VERSION 0.15.2
