{ config, pkgs, ... }:


with pkgs;
let
  R-with-my-packages = rWrapper.override{ packages = with rPackages; [ 
    bookdown
    data.table
    devtools
    dplyr
    ggplot2 
    grid
    gtable
    htmltools
    jsonlite
    kableExtra
    KernSmooth
    Knitr
    labeling
    lazyeval
    magrittr
    markdown
    openssl
    parallel
    Rcpp
    reshape2
    revealjs
    rmarkdown
    tidyr
    tidyselect
    tinytex
    udpipe
    utf8
    utils
    xml2
    xopen
    yaml
  ]; 
};
in 


{

    environment.systemPackages = with pkgs; [
        texlive.combined.scheme-full
        R-with-my-packages
    ];
}

