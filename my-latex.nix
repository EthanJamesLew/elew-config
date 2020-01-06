{ texlive }:

texlive.combine { inherit (texlive)
  scheme-full 
  amsmath
  amsfonts
  algorithmicx
  xcolor
  bbm
  url
  caption
  listings
  appendix; 
} 

