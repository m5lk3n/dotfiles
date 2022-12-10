imap jj <Esc>
syntax on
set number
set relativenumber
"set laststatus=2
set belloff=all
set encoding=UTF-8
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smartcase
set nowrap
set incsearch

" ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tribela/vim-transparent'
  Plug 'justinmk/vim-sneak'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'maralla/completor.vim'
  Plug 'ap/vim-css-color'
  "TODO 1:  Plug 'preservim/nerdcommenter'
  "TODO 2:  Plug 'airblade/vim-gitgutter'
call plug#end()

let g:airline_theme='bubblegum'

" https://github.com/NLKNguyen/papercolor-theme:

"set t_Co=256

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'override' : {
  \         'color13' : ['#FFFAFA', ''],
  \       }
  \     }
  \   }
  \ }

set background=dark
colorscheme PaperColor

" NERDTree config from https://github.com/preservim/nerdtree:

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Use built-in <C-w-w> to re-focus editor
" (https://stackoverflow.com/questions/1656591/how-to-jump-back-to-nerdtree-from-file-in-tab) 

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

let NERDTreeShowHidden=1

" https://medium.com/pragmatic-programmers/configuring-vim-to-develop-go-programs-e839641da4ac:

let g:go_doc_popup_window = 1

" Enable lsp for go by using gopls
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}"
