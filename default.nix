{}:
let 
	pkgs = import <nixpkgs> {};
in
	pkgs.callPackage ./my-vim.nix { 
		vim_configurable = with pkgs; vim_configurable.override { 
				python = python; 
			}; 
}
