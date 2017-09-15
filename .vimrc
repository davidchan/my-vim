":colorscheme mustang

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=100

" Set to auto read when a file is changed from the outside
set autoread

let mapleader = ","
let g:mapleader = ","
"set timeoutlen=500

syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set wildignore+=*.o,*.obj,.git,*.pyc,cache/**,log/**,test/**

set nonumber                      " Show line numbers.
set ruler                         " Show cursor position.

set hidden                        " Handle multiple buffers better.

set backspace=indent,eol,start    " Intuitive backspacing.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set splitbelow

set nofoldenable

set linespace=1

set laststatus=2   " Always show the statusline

set synmaxcol=512

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basics 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set noswapfile                    " Use an SCM instead of swap files
" set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noexpandtab
set expandtab                    " Use spaces instead of tabs
set tabstop=4                    " Global tab width.
set shiftwidth=4                 " And again, related.
set softtabstop=4                "Causes backspace to delete 4 spaces = converted <TAB>

"set smarttab                     "Uses shiftwidth instead of tabstop at the start of lines

set smartindent
set autoindent

set shiftround

nmap <leader>2 :set tabstop=2<cr>:set shiftwidth=2<cr>:set softtabstop=2<cr>
nmap <leader>3 :set tabstop=3<cr>:set shiftwidth=3<cr>:set softtabstop=3<cr>
nmap <leader>4 :set tabstop=4<cr>:set shiftwidth=4<cr>:set softtabstop=4<cr>

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MAPPING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"<M-j> est équivalent à ALT+j
"<C-j> est équivalent à CTRL+j
"<D-j> est équivalent à CMD + j

" Map space to / (search) and c-space to ? (backgwards search)
" map <space> /
" map <c-space> ?
map <silent> <leader><cr> :noh<cr>

"map <CR> O<Esc>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use the arrows to something usefull
"map <right> :bn<cr>
"map <left> :bp<cr>

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

"nmap ,server :Nread ftp://user:pwd@serveur/path/to/domain/<cr>

nmap <space> :
" nnoremap ; :

" Bubble single lines
nmap <C-S-Up> [e
nmap <C-S-Down> ]e
" Bubble multiple lines
vmap <C-S-Up> [egv
vmap <C-S-Down> ]egv

cmap w!! w !sudo tee % >/dev/null

" Delete buffer
nmap <leader>d :bd<cr>

" Delete buffer and file
nmap <leader>DEL :!rm %<cr>:bd<cr>

" Use perl regex style
nnoremap / /\v
vnoremap / /\v

imap § ->
imap ± =>


""""""""""""""""""""""""""""""
" => FileType detection
""""""""""""""""""""""""""""""

au BufNewFile,BufRead *.ejs 			setf html
au BufNewFile,BufRead *.less			setf css


""""""""""""""""""""""""""""""
" => Abbrev.
""""""""""""""""""""""""""""""

abbrev ff :! open -a firefox.app %:p<cr>

""""""""""""""""""""""""""""""
" => ctags 
""""""""""""""""""""""""""""""
nmap <leader>ctags :!ctags -h ".php" --PHP-kinds=+cf --recurse --exclude=*/cache/* --exclude=*/logs/* --exclude=*/data/* --exclude="\.git" --exclude="\.svn" --languages=PHP &<cr>:CtrlPClearCache<cr>




""""""""""""""""""""""""""""""
" => neobundle (https://github.com/Shougo/neobundle.vim)
""""""""""""""""""""""""""""""
set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'


" github bundles
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Lokaltog/vim-powerline'     " ignore for now since it's busted, need to specify the right revision
NeoBundle 'majutsushi/tagbar'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'rking/ag.vim'
"NeoBundle 'Shougo/neosnippet'

filetype plugin indent on       " turn filetype back on

NeoBundleCheck

""""""""""""""""""""""""""""""
" => CtrlP
""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

map <C-b> :CtrlPBuffer<cr>

" working path
let g:ctrlp_working_path_mode = 0       "'ra'

" exclude files and directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp|src\/languages',
  \ 'file': '\.exe$\|\.so$\|\.dat$|\.mo$|\.po$'
  \ }

"let g:ctrlp_max_files = 20


""""""""""""""""""""""""""""""
" => vim-powerline
""""""""""""""""""""""""""""""
let g:Powerline_symbols = 'fancy'


""""""""""""""""""""""""""""""
" => tagbar
""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>


""""""""""""""""""""""""""""""
" => indent-guides
""""""""""""""""""""""""""""""
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1
"let g:indent_guides_space_guides = 1


""""""""""""""""""""""""""""""
" => ack (made to use SilverSearcher instead of ack)
""""""""""""""""""""""""""""""
let g:ackprg = 'ag --nogroup --nocolor --column'

" ag
let g:agprg="ag --column -i"

""""""""""""""""""""""""""""""
" => neocomplcache
""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 0
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" highlight first result
"let g:neocomplcache_enable_auto_select = 1
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"




