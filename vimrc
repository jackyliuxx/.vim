call plug#begin()

Plug 'preservim/nerdtree', { 'on': [
            \ 'NERDTree',
            \ 'NERDTreeToggle',
            \ 'NERDTreeFind',
            \ 'NERDTreeFocus'
            \ ] }
Plug 'ctrlpvim/ctrlp'
Plug 'vim-airline/vim-airline'
Plug 'ycm-core/YouCompleteMe'

call plug#end()

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
" for airline
set laststatus=2
" let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
" for YouCompleteMe
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_key_invoke_completion = '<C-\>' 
set completeopt=menuone
" for NERDtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" for ctrlp
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules)$'
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
" for fold
set foldcolumn=0
map <space> zA
autocmd BufWinLeave ?* mkview
autocmd BufWinEnter ?* silent loadview
" autocmd BufEnter * loadview
" autocmd BufLeave * mkview

" copy all to system clipboard
map <F10> :%y+<CR>
