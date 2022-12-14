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
set scrolloff=2
set history=1000
set ttyfast
set t_Co=256

set wildmenu
set wildmode=longest:full,full
set wildignore+=*.DS_Store,*.bak,*.tmp

set undolevels=1000
set undofile
set backup
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/bak//
set directory=~/.vim/tmp/swp//
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
  Plug 'pseewald/vim-anyfold'
  Plug 'arecarn/vim-fold-cycle'
  "TODO: Plug 'preservim/nerdcommenter'
  "TODO: Plug 'airblade/vim-gitgutter'
call plug#end()

" skin
let g:airline_theme='bubblegum'
" https://github.com/NLKNguyen/papercolor-theme:
"set t_Co=256
" color13 is used in NERDTree to highlight folders and files 
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'override' : {
  \         'folded_fg' : ['#7F8C8D', ''],
  \         'folded_bg' : ['#616A6B', ''],
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
" use <c-l> (or <C-ww) to re-focus editor
" start NERDTree when Vim is started without file arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" enable Golang / LSP (gopls)
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}"
"TODO: let g:go_doc_popup_window = 1

" anyfold config from https://github.com/pseewald/vim-anyfold:
" use zc to close, left/right arrow to open
filetype plugin indent on
autocmd Filetype * AnyFoldActivate
set foldlevel=99

" vim-fold-cycle config from https://github.com/arecarn/vim-fold-cycle:
let g:fold_cycle_default_mapping = 0 "disable default mappings
nmap <Tab><Tab> <Plug>(fold-cycle-open)
nmap <S-Tab><S-Tab> <Plug>(fold-cycle-close)