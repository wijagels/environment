set nocompatible "disable ancient compatibility, better overall
set shell=/usr/bin/zsh

"Key controls
"nmap s :w <enter>
nmap q :q <enter>
imap <Tab> <C-P>
map j gj
map k gk
command W w
command Q q

"Move between splits faster
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Clobber trailing spaces
command Trsp :%s/\s\+$//|:noh|:w

"Basics
set cursorline "highlight current line of cursor
set exrc "use directory specific vimrc if there
set secure " No hax allowed
set notimeout "waiting for keys
set ttimeout "waiting for keys
set timeoutlen=50 "wait time for combos
set smartindent "smart auto indenting
set tabstop=4 "tabs = 4 spaces
set scrolloff=10 "keep 10 lines visible at top and bottom when scrolling
set shiftwidth=4 "spaces for each level of autoindent
set expandtab "use the above #spaces to insert a tab
set ttyfast "assume terminal is fast, improves visuals
set lazyredraw
set noswapfile "chris advice. no annoying swapfile on disk; pure in memory
set nobackup "no backup when overwriting a file
set wrap "wrap long lines
syntax on "syntax highlighting automatically
set undofile "save your undos on disk and always have them!
set undodir=$HOME/.vim/undo "will be saved here
set laststatus=2 "always have status bar
set ai "copy indent from current line when starting a new line
set number "line numbers
set hlsearch "highlight search matches previous search pattern
set ignorecase "ignore case in searches
set smartcase "override ignore case if the search has Captials
set showcmd "show the command in progress on last line of screen
set hidden "keep unloaded buffers?
set guioptions=agi
set incsearch "show search results as you type
set t_co=256
set showmatch "when bracket inserted, briefly jump to matching one if visible
" set autochdir "auto change the folder when you change files
set mouse=a "mouse enabled just in case
set clipboard=unnamed "copy paste with the system clipboard
set ruler
autocmd FileType c,objc,cpp set commentstring=//\ %s "c comments
autocmd FileType cmake set commentstring=#\ %s "c comments
set backspace=2 "Sometimes backspace works weirdly, this fixes it
set history=200
set wildmenu
set wildignorecase
set wildignore="*.o,*.out,*.pyc"

call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim' "color schemes
" Plug 'vim-airline/vim-airline' "airline
" Plug 'vim-airline/vim-airline-themes'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'} "writing html, sick
" Plug 'tpope/vim-surround' "pair plugin, brackets etc
Plug 'tpope/vim-commentary' "comment stuff out
" Plug 'tpope/vim-fugitive' "Git wrapper
" Plug 'scrooloose/syntastic' "syntax checking
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "file browser
" Plug 'Valloric/YouCompleteMe',
"{ 'do': './install.py --tern-completer --gocode-completer --clang-completer --system-libclang' } "autocomplete
Plug 'pangloss/vim-javascript', { 'for': 'javascript' } "better js indentation/highlighting
Plug 'terryma/vim-multiple-cursors' "Multiple cursors like in sublime
Plug 'airblade/vim-gitgutter' "Git gutter
Plug 'lervag/vimtex', { 'for': 'tex' } " LaTeX plugin, auto compiles
Plug 'wakatime/vim-wakatime'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
"" Plug 'jeaye/color_coded', { 'do': 'mkdir build && cd build && cmake .. && make && make install && make clean && make clean_clang' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'Valloric/MatchTagAlways'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'rhysd/committia.vim'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'Shougo/vimshell.vim'
Plug 'tpope/vim-dispatch'
Plug 'pmsorhaindo/syntastic-local-eslint.vim'
Plug 'lyuts/vim-rtags'
Plug 'sbdchd/neoformat'
call plug#end()

filetype plugin indent on
set autoread "if file changed outside of vim, just read it again
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 13 "set the font to a better looking mono font
au FileType python setlocal softtabstop=4 | setlocal shiftwidth=4
au FileType ruby setlocal tabstop=2 | setlocal shiftwidth=2
au FileType javascript setlocal tabstop=2 | setlocal shiftwidth=2
au FileType json setlocal tabstop=2 | setlocal shiftwidth=2
au FileType html setlocal tabstop=2 | setlocal shiftwidth=2
au FileType css setlocal tabstop=2 | setlocal shiftwidth=2
au FileType tex setlocal tabstop=2 | setlocal shiftwidth=2
au FileType cpp setlocal tabstop=2 | setlocal shiftwidth=2
au FileType yaml setlocal tabstop=2 | setlocal shiftwidth=2
au FileType go setlocal expandtab! | setlocal noexpandtab | setlocal tabstop=4 | setlocal shiftwidth=4
au FileType proto setlocal tabstop=2 | setlocal shiftwidth=2

let g:airline_theme='base16'

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

"Turn on spell check
setlocal spell spelllang=en_us

"YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_register_as_syntastic_checker = 1
" let g:ycm_show_diagnostics_ui = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:vimtex_fold_preamble = 0

let g:color_coded_enabled = 1

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_c_checkers = ['oclint', 'clang_check', 'gcc', 'make']
" let g:syntastic_cpp_checkers=['gcc', 'make', 'clang_tidy']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_aggregate_errors = 1

map <C-U> :ClangFormat<CR>
let g:clang_format#auto_formatexpr = 1
" autocmd FileType c,cpp ClangFormatAutoEnable

nnoremap <F5> :GundoToggle<CR>

noremap <C-y> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let g:ycm_server_python_interpreter = '/usr/bin/python2'

let g:neoformat_enabled_python = ['clangformat']
