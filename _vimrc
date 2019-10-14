" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-syntax-extra'
Plug 'lervag/vimtex'
Plug 'let-def/vimbufsync'
Plug 'majutsushi/tagbar'
Plug 'sbdchd/neoformat'
Plug 'thaerkh/vim-indentguides'
Plug 'tikhomirov/vim-glsl'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" ==========================
" GENERAL:
" ==========================
set encoding=utf-8
language English_United States

" allow backspacing in more situations
set backspace=indent,eol,start

" reload files changed outside of vim
set autoread

" scart scrolling when the cursor approaches margins
set scrolloff=2

" 4 wide tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" turn on automatic indentation
set autoindent

" wrap lines at whitespace
set linebreak

" highlight search terms
set hlsearch

" show search matches as you type
set incsearch
"
" ignore case when searching
set ignorecase

" ignore case when all lowercase but not when using capital letters
set smartcase

" remember more commands and search history
set history=100

" remember more undo
set undolevels=100

" allow switching buffer on unsaved
set hidden

" preview window appears at bottom
set splitbelow splitright

" html specific indentation
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" ==========================
" GUI:
" ==========================
syntax enable
colorscheme molokai

" highlights characters past column 80
highlight OverLength ctermbg=darkred ctermfg=white guibg=#374648
match OverLength /\%>120v.\+/

" disable this for .tex and .txt files
au filetype tex,text match OverLength /\b\B/
" disable for other files
au BufNewFile,BufRead *.log,*.md,*.html,*.ini match OverLength /\b\B/

" show relative line numbers with line number at 0
set number
set relativenumber

" disable cursor blinking
set gcr=a:blinkon0

" disable sounds
set visualbell

" display status bar at bottom
set laststatus=2

" display options on tab
set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class,*.exe,*.o,.gitignore

" netrw tree view
let g:netrw_liststyle=3
let g:netrw_banner=0

" enable highlighting for .def files
au filetype def set syn=c

" ==========================
" REMAPS:
" ==========================
" use colon commands with semicolon instead
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

" map <leader> key to ,
let mapleader=","
let maplocalleader="\\"

" let jj exit insert mode
imap jj <Esc>

" double <Esc> turns off search highlights
noremap <C-n> <Esc>:nohlsearch<CR><Esc>

" map <C-s> to save
nnoremap <C-s> :update<CR>
vnoremap <C-s> <C-c>:update<CR>
inoremap <C-s> <C-o>:update<CR>

" generate ctags for current directory
nnoremap <leader>ct :silent !ctags -R .<CR>

" switch splits
nnoremap <C-H> :wincmd h<CR>
nnoremap <C-J> :wincmd j<CR>
nnoremap <C-K> :wincmd k<CR>
nnoremap <C-L> :wincmd l<CR>
nnoremap <leader>= :wincmd =<CR>

" switch buffers faster
nnoremap <leader>bs :ls<CR>:b

" delete buffer
nnoremap <C-w> :bd<CR>

" switch buffers with <C-Tab>
nnoremap <C-Tab> :bn<CR>

" delete trailing whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

nnoremap <leader>ws :call TrimWhitespace()<CR>

" set spell check to F6
nnoremap <F6> :setlocal spell! spelllang=en_us<CR>

" " Copy to clipboard
vnoremap <leader>y  "+y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y
nnoremap <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" ==========================
" PLUGINS:
" ==========================
let g:airline_theme='molokai'

" enable bar at top that shows all buffers
let g:airline#extensions#tabline#enabled=1

" camelcase motion
let g:camelcasemotion_key = '<leader>'

" default to latex instaed of plaintex
let g:tex_flavor="latex"

" easy align settings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" open/close tagbar
nnoremap <F8> :TagbarToggle<CR>

" change tagbar fold icons
let g:tagbar_iconchars=['▶', '▼']

" rainbow parentheses files
augroup rainbow_lisp
    autocmd!
    autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" format code
nnoremap <leader>f :Neoformat<CR>
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END

" vimtex
let g:vimtex_view_general_viewer='C:/Program Files (x86)/SumatraPDF/SumatraPDF'
let g:vimtex_view_general_options='-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_compiler_latexmk = { 'backend' : 'jobs', 'background' : 1, 'build_dir' : '', 'callback' : 1, 'continuous' : 1, 'executable' : 'latexmk', 'options' : [ '-verbose', '-file-line-error', '-synctex=1', '-interaction=nonstopmode', ], }
let g:vimtex_compiler_latexmk_engines = { '_' : '-pdf', 'pdflatex' : '-pdf', 'dvipdfex' : '-pdfdvi', 'lualatex' : '-lualatex', 'xelatex' : '-xelatex', 'context (pdftex)' : '-pdf -pdflatex=texexec', 'context (luatex)' : '-pdf -pdflatex=context', 'context (xetex)' : '-pdf -pdflatex=''texexec --xtx''', 'platex' : '-pdfdvi -latex=platex -e "$dvipdf=''dvipdfmx %O %S'';$bibtex=''pbibtex'';$makeindex=''mendex'';"', }
