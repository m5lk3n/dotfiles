imap jj <Esc>
syntax on
set number
set relativenumber
set belloff=all
set encoding=UTF-8
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smartcase
set nowrap
set incsearch
set backspace=indent,eol,start
set history=1000
set undolevels=1000
set undofile
set backup
" put undo, backup and swap under /tmp go get free clean-up
set undodir=/tmp/.vim/$USER/undo//
set backupdir=/tmp/.vim/$USER/bak//
set directory=/tmp/.vim/$USER/swp//
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p", 0700)
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p", 0700)
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p", 0700)
endif

" ctrl-[hjkl] to navigate between split screens (split e.g. with :vsp) 
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
  "TODO: Plug 'preservim/nerdcommenter'
  "TODO: Plug 'airblade/vim-gitgutter'
call plug#end()

" skin
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
let NERDTreeShowHidden=1
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Use <c-l> (or <C-ww) to re-focus editor
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Enable Golang / LSP (gopls)
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}"
" let g:go_doc_popup_window = 1