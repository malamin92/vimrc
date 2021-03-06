set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Color Schemes
Plugin 'flazz/vim-colorschemes'
"Nerdtree
Plugin 'scrooloose/nerdtree'
"Airline --status line at the bottom
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"ctrlp
Plugin 'ctrlpvim/ctrlp.vim'
"Theme
Plugin 'NLKNguyen/papercolor-theme'
"SYNTAX
Plugin 'scrooloose/syntastic'
"GIT
Plugin 'tpope/vim-fugitive'
"GIT Gutter
Plugin 'airblade/vim-gitgutter'
"Autocomplete
Plugin 'Shougo/neocomplete.vim'
Plugin 'ternjs/tern_for_vim'
"RAILS
Plugin 'tpope/vim-rails'
"Surround
Plugin 'tpope/vim-surround'
"Auto-pairs
Plugin 'jiangmiao/auto-pairs'
"Move
Plugin 'matze/vim-move'
"Slim syntax
Plugin 'slim-template/vim-slim.git'
"Multiple cursors
Plugin 'terryma/vim-multiple-cursors'
"Emmet
Plugin 'mattn/emmet-vim'

"snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Optional:
Plugin 'honza/vim-snippets'
"JS
Plugin 'pangloss/vim-javascript'
"jsx
Plugin 'mxw/vim-jsx'
"Matchtagalways
Plugin 'Valloric/MatchTagAlways'
"Coffee
Plugin 'kchmck/vim-coffee-script'
Plugin 'cakebaker/scss-syntax.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required

"set color scheme"
colo papercolor


"syntax highlight"
set background=dark
syntax on
filetype plugin indent on
autocmd BufNewFile,BufRead *.slim set ft=slim
"Indent Dots
set list listchars=tab:»-,trail:·,extends:»,precedes:«,space:·

"To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

"line numbers
set number

"auto read files
set autoread

"NERDTREE auto open
"au VimEnter *  NERDTree

"Spellcheck
setlocal spell spelllang=en_us

" **** Filetype indents ****

"tab spaces
"general
set softtabstop=4 tabstop=4 shiftwidth=4 expandtab

"for view files"
autocmd Filetype html setlocal sts=4 ts=4 sw=4 expandtab
autocmd Filetype slim setlocal sts=4 ts=4 sw=4 expandtab
autocmd Filetype eruby setlocal sts=4 ts=4 sw=4 expandtab

"case insensitive searches"
set smartcase
set ignorecase
"smart indenting
set smartindent

"display all buffers
let g:airline#extensions#tabline#enabled = 1
"airline theme
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='durant'



"Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_javascript_standard_exec = "semistandard"
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_eruby_checkers = ['ruby']
let g:syntastic_slim_checkers = ['slimrb']
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_coffee_checkers = ['coffee']
let g:syntastic_handlebars_checkers = ['handlebars']
"autocomplete scss
set omnifunc=csscomplete#CompleteCSS
set ft=scss.css

"NO SWAP FILE WARNING
set shortmess+=A

"Show pattern matches
set hlsearch
"Incremental search
set incsearch

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"move key modifier
let g:move_key_modifier = 'C'

set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.


" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" Plug Settings {
" neocomplete {
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  " }

  " CtrlP {
    " Open file menu
    nnoremap <Leader>o :CtrlP<CR>
    " Open buffer menu
    nnoremap <Leader>b :CtrlPBuffer<CR>
    " Open most recently used files
    nnoremap <Leader>f :CtrlPMRUFiles<CR>
  " }
" }

"Font
set encoding=utf-8
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12

"jsx
let g:jsx_ext_required = 0

" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:mta_filetypes = {
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'jinja' : 1,
  \ 'javascript' : 1,
  \ 'jsx' : 1,
\}

"clear conflict when using multiple-cursors with neo-complete
function! Multiple_cursors_before()
    exe 'NeoCompleteLock'
    echo 'Disabled autocomplete'
endfunction

function! Multiple_cursors_after()
    exe 'NeoCompleteUnlock'
    echo 'Enabled autocomplete'
endfunction

let &t_SI = "\<Esc>]12;yellow\x7" 
let &t_SR = "\<Esc>]12;red\x7" 
let &t_EI = "\<Esc>]12;blue\x7"
