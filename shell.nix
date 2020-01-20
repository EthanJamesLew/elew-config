{}:

let
  pkgs = import <nixpkgs> {};
  sources = import ./nix/sources.nix {}; 
  nur = pkgs.callPackage sources.NUR {};
  
  nix-rls = pkgs.callPackage ./nix/nix-rls.nix {};
  
  my-vim = with pkgs; (callPackage ./development/vim.nix  { 
  vim_configurable = vim_configurable.override { python = python3; } ; 
  });
                    
  my-python = pkgs.callPackage ./common/python.nix {};  
  

  rustVersion = nur.repos.mozilla.latest.rustChannels.stable;

  git-prompt = pkgs.callPackage ./common/git-prompt.nix {};
  
  # Use Ocaml 4.04
  my-ocaml = pkgs.ocaml-ng.ocamlPackages.ocaml;
  
  my-ocaml-packages = pkgs.ocaml-ng.ocamlPackages;

  kind2 =  pkgs.callPackage ./verification/kind2.nix { };

  my-latex = pkgs.callPackage ./common/latex.nix {};
  
  llvmCross = pkgs.llvmPackages_9.llvm;
  
  clangCross = pkgs.llvmPackages_9.clang;
  
  lldCross = pkgs.llvmPackages_9.lld;
in 
  with pkgs; mkShell {
    buildInputs = [
            
      # Basics
      my-python

      ## Vim Stuff
      my-vim
      rustVersion.rust
      rustPackages.rls
      nix-rls
      
      tmux
            
      #Kind2 Setup
      kind2
      z3

      # Build Tools Setup
      automake
      autoconf
      libtool
      pkgconfig
            
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

      # Latex Setup
      zathura
      xdotool
      my-latex

      # Cross Compilation Tools
      llvmCross
      clangCross
      lldCross

      # Rust 
      rustc
      cargo
      rustup


    ];
    
    shellHook = "source ${git-prompt}/gitprompt.sh";
    
  }
