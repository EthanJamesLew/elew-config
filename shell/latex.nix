{}:

let
  pkgs = import <nixpkgs> {};
  
  my-vim = with pkgs; (callPackage ../development/vim.nix  { 
  vim_configurable = vim_configurable.override { python = python3; } ; 
  });
  
  git-prompt = pkgs.callPackage ../common/git-prompt.nix {}; 

  my-latex = pkgs.callPackage ../common/latex.nix {};
in 
  with pkgs; mkShell {
    buildInputs = [

      ## Vim Stuff
      my-vim
      
      tmux
            
      # Latex Setup
      zathura
      xdotool
      my-latex

    ];

    GIT_PROMPT_START="(LaTeX)";
    
    shellHook = ''
      source ${git-prompt}/gitprompt.sh 
      '';
  }
