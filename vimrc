set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'

call vundle#end()            " required
filetype plugin indent on    " required

set nu
set ai
set showcmd
set tabstop=4
set shiftwidth=4
set laststatus=2
set t_Co=256
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" vvvv-complie and run-vvvv
function CP_R()
	
	if( &ft == 'cpp') 
		let cpl = 'g++ -w -o "%:r" -std=c++11 "%"' | let exf = '"./%:r"'
	elseif( &ft == 'c')
		let cpl = 'gcc -w -o "%:r" "%"' | let exf = '"./%:r"'
	elseif( &ft == 'java')
		let cpl = 'javac "%"' | let exf = 'java "%:r"'
	endif

	let pause = 'printf "Press any key to continue..." && read -n 1 && exit'
	if !exists("cpl")
		echo 'Can''t compile this filetype...'
		return
	endif
	let cp_r = cpl . ' && time ' . exf
	execute '!$COLORTERM -x bash -c ''' . cp_r . ';' . pause . ';exec bash'''
endfunction
map <F9> :w<CR>:call CP_R()<CR><ESC>
" ^^^^-compile and run-^^^^
map <F10> :%y+<CR>
" copy all to system clipboard
