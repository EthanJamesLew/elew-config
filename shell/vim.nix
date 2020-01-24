{}:

let
  pkgs = import <nixpkgs> {};
  my-vim = with pkgs; (callPackage ../development/vim.nix  { 
  vim_configurable = vim_configurable.override { python = python3; } ; 
  });
  
  git-prompt = pkgs.callPackage ../common/git-prompt.nix {}; 
in 
  with pkgs; mkShell {
    buildInputs = [

      ## Vim Stuff
      my-vim
      tmux
    ];

    GIT_PROMPT_START="(vim)";
    
    shellHook = ''
      source ${git-prompt}/gitprompt.sh 
      '';
  }
