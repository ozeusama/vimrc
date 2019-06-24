" use vim settings instead of vi settings  by default
set nocompatible

" ======================================
" PLUGINS:
" ======================================
" update plugins with ':PluginUpdate'
filetype off

" set runtime path to include vundle and initialize
set rtp+=$HOME/bundle/Vundle.vim
call vundle#begin('$HOME/bundle/')

" let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" plugins go here
Plugin 'alx741/vim-hindent'
Plugin 'ervandew/supertab'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'majutsushi/tagbar'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tikhomirov/vim-glsl'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/CRefVim'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'roxma/nvim-yarp'
Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/deoplete-clangx'
Plugin 'deoplete-plugins/deoplete-jedi'
Plugin 'tbodt/deoplete-tabnine'
Plugin 'lervag/vimtex'
" end plugins

call vundle#end()
filetype plugin indent on

" ======================================
" GENERAL:
" ======================================
set encoding=utf-8
language English_United States

" disable japanese ime
set iminsert=0
set imsearch=-1

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

" search for all subdirectories when searching files
set path+=**

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

" ======================================
" GUI:
" ======================================
if has('gui_running')
    colorscheme molokai
    syntax enable

    " highlight current line
    " set cursorline

    " set font
    set guifont=Source_Code_Pro:h12:cANSI:qCLEARTYPE
    " set guifont=Terminus-ja:h12:cSHIFTJIS:qDRAFT

    " enables viewing of invisible characters
    set list listchars=tab:\|\ ,trail:·

    " darker color for trailing characters
    highlight NonText guifg=#2b3334

    " disable menu bars
    set guioptions-=m
    set guioptions-=T

    " disable scrollbars
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L

    " make window larger
    set lines=40
    set columns=90
else
    set list listchars=tab:\|\
endif

" highlights characters past column 80
highlight OverLength ctermbg=darkred ctermfg=white guibg=#374648
match OverLength /\%>80v.\+/

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

" ======================================
" REMAPS:
" ======================================
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
noremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

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

" yank to clipboard
nnoremap <leader>y "*y
vnoremap <leader>y "*y

" zoom in and out
let g:fnt_sizes = [12, 24]
let g:fnt_index = 0
let g:fnt_size  = g:fnt_sizes[g:fnt_index]

" ======================================
" PLUGINS:
" ======================================
set pyxversion=3
let g:python3_host_prog='C:\Program Files\Python37\python.exe'

let g:airline_theme='molokai'

" enable bar at top that shows all buffers
let g:airline#extensions#tabline#enabled=1

" c++ highlighting options
let g:cpp_class_scope_highlight=1
let g:cpp_member_variable_highlight=1
let g:cpp_experimental_template_highlight=1
let g:cpp_concepts_highlight=1

" enable indent guides
let g:indent_guides_enable_on_vim_startup=1

" disable indent guides for tabbed files
let g:indent_guides_tab_guides=0

" darken indent guides
let g:indent_guides_color_change_percent=2

" default to latex instaed of plaintex
let g:tex_flavor="latex"

" haskell indentation
let g:hindent_on_save=1
let g:hindent_line_length=80

" easy align settings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" open/close tagbar
nnoremap <F4> :TagbarToggle<CR>

" change tagbar fold icons
let g:tagbar_iconchars=['▶', '▼']

" deoplete
let g:deoplete#enable_at_startup=1
call deoplete#custom#var('clangx', 'clang_binary', 'C:\Program Files\LLVM\bin\clang.exe')

" rainbow parentheses files
augroup rainbow_lisp
    autocmd!
    autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" vimtex
let g:vimtex_view_general_viewer='SumatraPDF'
let g:vimtex_view_general_options='-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_compiler_latexmk = { 'backend' : 'jobs', 'background' : 1, 'build_dir' : '', 'callback' : 1, 'continuous' : 1, 'executable' : 'latexmk', 'options' : [ '-verbose', '-file-line-error', '-synctex=1', '-interaction=nonstopmode', ], }
let g:vimtex_compiler_latexmk_engines = { '_' : '-pdf', 'pdflatex' : '-pdf', 'dvipdfex' : '-pdfdvi', 'lualatex' : '-lualatex', 'xelatex' : '-xelatex', 'context (pdftex)' : '-pdf -pdflatex=texexec', 'context (luatex)' : '-pdf -pdflatex=context', 'context (xetex)' : '-pdf -pdflatex=''texexec --xtx''', 'platex' : '-pdfdvi -latex=platex -e "$dvipdf=''dvipdfmx %O %S'';$bibtex=''pbibtex'';$makeindex=''mendex'';"', }

" IF YOU WANT THIS BACK USE NEOSNIPPET PLEASE
" " ======================================
" " MACROS:
" " ======================================
" " guide navigation
" inoremap <Tab><Space> <Esc>/<++><CR>"_c4l
" vnoremap <Tab><Space> <Esc>/<++><CR>"_c4l
" nnoremap <Tab><Space> <Esc>/<++><CR>"_c4l
" inoremap <Leader>gui <++>

" " c, c++
" " include files
" au filetype c,cpp,cxx,cc,h,hpp inoremap <Leader>inc< #include<Space><><CR><++><Esc>kf>i
" au filetype c,cpp,cxx,cc,h,hpp inoremap <Leader>inc" #include<Space>""<CR><++><Esc>kf"a
" " function
" au filetype c,cpp,cxx,cc,h,hpp inoremap <Leader>fun (<++>)<CR>{<CR>}<CR><++><Esc>kO<++><Esc>kk0i
" " if
" au filetype c,cpp,cxx,cc,h,hpp inoremap <Leader>if if<Space>()<Space>{<CR>}<Space><++><Esc>O<++><Esc>k0f)i
" " elif
" au filetype c,cpp,cxx,cc,h,hpp inoremap <Leader>elif else<Space>if<Space>()<Space>{<CR>}<Space><++><Esc>O<++><Esc>k0f)i
" " else
" au filetype c,cpp,cxx,cc,h,hpp inoremap <Leader>else else<Space>{<CR>}<CR><++><Esc>kO
" " switch
" au filetype c,cpp,cxx,cc,h,hpp inoremap <Leader>swi switch<Space>()<Space>{<CR>}<CR><++><Esc>kOcase<Space><++>:<CR><++><Esc>odefault:<CR><++><Esc><<4k0f)i
" " for
" au filetype c,cpp,cxx,cc,h,hpp inoremap <Leader>for for<Space>(;<Space><++>;<Space><++>)<Space>{<CR>}<CR><++><Esc>kO<++><Esc>k0f(a
" " while
" au filetype c,cpp,cxx,cc,h,hpp inoremap <Leader>whi while<Space>()<Space>{<CR>}<CR><++><Esc>kO<++><Esc>k0f)i
" " do while
" au filetype c,cpp,cxx,cc,h,hpp inoremap <Leader>dowhi do<Space>{<CR>}<Space>while<Space>(<++>);<CR><++><Esc>kO
