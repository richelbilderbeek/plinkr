Bootstrap: docker
From: r-base

%runscript
    Rscript -e 'plinkr::plinkr_report.R'

%post
    sed -i 's/$/ universe/' /etc/apt/sources.list
    apt-get update
    apt-get clean
    Rscript -e 'install.packages("remotes")'
    Rscript -e 'remotes::install_github("richelbilderbeek/plinkr")'
    Rscript -e 'plinkr::install_plinks()'
