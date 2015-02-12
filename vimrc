set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/.vim/plugins')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'scrooloose/nerdtree'
" Plugin 'powerline/powerline' , {'rtp': 'powerline/bindings/vim/'}
Plugin 'bling/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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
		let cpl = 'g++ -w -o code -std=c++11 "%"' | let exf = './code'
	elseif( &ft == 'c')
		let cpl='gcc -w -o code "%"' | let exf = './code'
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
