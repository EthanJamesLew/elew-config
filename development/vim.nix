{ vim_configurable
, vimPlugins
, vimUtils
, fetchFromGitHub
, python3 } :

let  
  vimrc = import ./vimrc.nix {};
  customPlugins.rust-doc = vimUtils.buildVimPlugin {
        name = "rust-doc";
        src = fetchFromGitHub {
          owner = "rhysd";
          repo = "rust-doc.vim";
          rev = "0b56a997c7898104979ec3d3bba975c7974028b0";
          sha256 = "090mnl8p5r99712l1cslzmyd37lsyp5kghpnwvkjf5m9rmnhrjdm";
        };
  };
  customPlugins.lustre-syntax = vimUtils.buildVimPlugin {
        name = "lustre-syntax";
        src = fetchFromGitHub {
          owner = "vim-scripts";
          repo = "lustre-syntax";
          rev = "90cda003a21fa7ea663623b3908e161cad1c2936";
          sha256 = "197n4jww697paxjchw6wz3kk3bhxg836jf054jscwbdkg4wkdhp6";
        };
  };
	vimrcConfig = {
		vam.knownPlugins = vimPlugins // customPlugins;
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
                                        "rust-doc"
					"fugitive"
					"airline"
					"jedi-vim"
                                        "vimtex"
                                        "ultisnips"
                                        "vim-snippets"
                                        "tabular"
                                        "vim-markdown"
                                        "lustre-syntax"
                                        "LanguageClient-neovim"
				];
			}
		];
		customRC = vimrc.config;
	};
in vim_configurable.customize { 
			name = "vim";
			inherit vimrcConfig;
}

