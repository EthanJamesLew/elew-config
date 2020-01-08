{}:
let 
	pkgs = import <nixpkgs> {};
in
	pkgs.callPackage ./common/vim.nix { 
		vim_configurable = with pkgs; vim_configurable.override { 
				python = python; 
			}; 
}
