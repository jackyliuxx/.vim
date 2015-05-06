set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required
" general
set nu
set ai
set showcmd
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set t_Co=256
set fileencodings=ucs-bom,utf-8,default,big5,latin1
" for airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
" for YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_key_invoke_completion = '<C-\>' 
set completeopt=menuone
" for NERDtree-tabs
map <F8> :NERDTreeTabsToggle<CR>
" for ctrlp
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" vvvv-complie and run-vvvv
function CP_R()
	
	if( &ft == 'cpp') 
		let cpl = 'g++ -w -O3 -o "%:r" -std=c++11 "%"' | let exc = '"./%:r"'
	elseif( &ft == 'c')
		let cpl = 'gcc -w -o "%:r" -std=c99 "%"' | let exc = '"./%:r"'
	elseif( &ft == 'java')
		let cpl = 'javac "%"' | let exc = 'java "%:r"'
	elseif( &ft == 'python')
		let exc = 'python3 "%"'
	endif

	let pause = 'printf "Press any key to continue..." && read -n 1 && exit'
	if !exists('exc')
		echo 'Can''t compile this filetype...'
		return
	endif
	if exists('cpl')
		let cp_r = cpl . ' && time ' . exc
	else
		let cp_r = 'time ' . exc
	endif
	silent execute '!$COLORTERM -x bash -c ''' . cp_r . ';' . pause . ';exec bash'''
    redraw!
endfunction
map <F9> :w<CR>:call CP_R()<CR><ESC>
" ^^^^-compile and run-^^^^

" copy all to system clipboard
map <F10> :%y+<CR>
