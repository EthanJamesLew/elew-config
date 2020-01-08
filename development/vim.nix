{ vim_configurable, vimPlugins, python3 } :

let  
	vimrc = import ./vimrc.nix {};
	vimrcConfig = {
		vam.knownPlugins = vimPlugins;
		vam.pluginDictionaries = [
			{
				names = [
					"ctrlp"
					"gitgutter"
					"youcompleteme"
					"vundle"
					"supertab"
					"vim-nix"
					"rust-vim"
					"fugitive"
					"airline"
					"jedi-vim"
                                        "vimtex"
                                        "ultisnips"
                                        "vim-snippets"
                                        "tabular"
                                        "vim-markdown"
				];
			}
		];
		customRC = vimrc.config;
	};
in vim_configurable.customize { 
			name = "vim";
			inherit vimrcConfig;
}

