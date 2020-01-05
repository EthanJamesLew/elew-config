{}:

let
	pkgs = import <nixpkgs> {};
	my-vim = with pkgs; (callPackage ./development/my-vim.nix  { 
			vim_configurable = vim_configurable.override { python = python3; } ; 
                      });
                    
        my-python = pkgs.callPackage ./my-python.nix {};  
        git-prompt = with pkgs; fetchFromGitHub {
          "owner" = "magicmonty";
          "repo" = "bash-git-prompt";
          "rev" = "148d502b666a0d62ecc83680817596b097a70f2a";
          "sha256" = "0xdyyc0lvfrxg9bgmiy4h22y0wp6x3yn6md6jy2f7kcw8dww9pyz";
        };
        # Use Ocaml 4.04
        my-ocaml = pkgs.ocaml-ng.ocamlPackages_4_04.ocaml;
       my-ocaml-packages = pkgs.ocaml-ng.ocamlPackages_4_04; 
        kind2 =  pkgs.callPackage ./verification/kind2.nix { };
in 
	with pkgs; mkShell {
          buildInputs = [
            
		# Basics
		my-python
            my-vim
            tmux
            
		# Kind2 Setup
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

		# Latex Setup
	    zathura
	    xdotool
	    texlive.combined.scheme-medium
          ];
          shellHook = "source ${git-prompt}/gitprompt.sh";
        }
