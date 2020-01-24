{}:

let
  pkgs = import <nixpkgs> {};
  
  my-vim = with pkgs; (callPackage ../development/vim.nix  { 
  vim_configurable = vim_configurable.override { python = python3; } ; 
  });
                    
  my-python = pkgs.callPackage ../common/python.nix {};  

  git-prompt = pkgs.callPackage ../common/git-prompt.nix {};
  
  # Use Ocaml 4.04
  my-ocaml = pkgs.ocaml-ng.ocamlPackages.ocaml;
  my-ocaml-packages = pkgs.ocaml-ng.ocamlPackages;

in 
  with pkgs; mkShell {
    buildInputs = [
            
      # Basics
      my-python

      ## Vim Stuff
      my-vim
      tmux
            
            
      # OCaml Setup
      my-ocaml
      my-ocaml-packages.findlib
      my-ocaml-packages.ocamlbuild
      my-ocaml-packages.menhir
      my-ocaml-packages.num
      my-ocaml-packages.yojson
      my-ocaml-packages.utop
      my-ocaml-packages.core
      my-ocaml-packages.core_bench
    ];


    GIT_PROMPT_START="\[\033[01;34m\][\W]\[\033[00m\](OCaml)";
    
    shellHook = "source ${git-prompt}/gitprompt.sh";
    
  }
