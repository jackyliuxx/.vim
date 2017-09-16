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
Plugin 'easymotion/vim-easymotion'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'python-mode/python-mode'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'

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
colo torte
hi Normal guibg=NONE ctermbg=NONE
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,default,big5,latin1
" for python-mode
let g:pymode_rope = 0
let g:pymode_lint_on_fly = 1
let g:pymode_lint_cwindow = 0
let g:pymode_lint_ignore = "E0602,E712,C901"
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
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules)$'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
" for easy motion
let g:EasyMotion_leader_key = '\'
" for javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete
" for fold
set foldcolumn=0
map <space> zA
autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent loadview
" autocmd BufEnter * loadview
" autocmd BufLeave * mkview

" for CP_R
map <F9> :w<CR>:call jackyliuxx#CP_R(0)<CR><ESC>
map <C-F9> :w<CR>:call jackyliuxx#CP_R(1)<CR><ESC>

" copy all to system clipboard
map <F10> :%y+<CR>
