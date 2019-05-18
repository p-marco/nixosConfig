{ config, pkgs, ... }:
{
    packageOverrides = super: let self = super.pkgs; in
    {

        rEnv = super.rWrapper.override {
            packages = with self.rPackages; [
                bookdown
                devtools
                ggplot2
                knitr
                reshape2
                yaml
                optparse
                udpipe
                yaml
                ];
        };
    };
}

{

    environment.systemPackages = with pkgs; [
        # texlive.combined.scheme-basic
        texlive.combined.scheme-full
        rEnv
    ];
}

