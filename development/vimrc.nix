{}:

{
	config = ''
		set history=700
		set number
                set encoding=utf-8
                set backspace=indent,eol,start
		
		let g:tex_flavor='latex'
		let g:vimtex_view_method='zathura'
		let g:vimtex_quickfix_mode=0
		set conceallevel=1
                let g:tex_conceal='abdmg'

                " make YCM compatible with UltiSnips (using supertab)
                let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
                let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
                let g:SuperTabDefaultCompletionType = '<C-n>'

                " better key bindings for UltiSnipsExpandTrigger
                let g:UltiSnipsExpandTrigger = "<tab>"
                let g:UltiSnipsJumpForwardTrigger = "<tab>"
                let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

	'';
}
