"-------------------------------------------------------------------------------
" platform check
"-------------------------------------------------------------------------------
let platform = ""
if has("win32")
    let platform = "win"
else
    if has("unix")
        let s:uname = system("uname")
        if s:uname == "Darwin"
            let platform = "mac"
        else
            let platform = "unix"
        endif
    endif
endif

if platform == "win"
    let cz_env_path = "vim"
else
    let cz_env_path = ".vim"
endif


"-------------------------------------------------------------------------------
" Vundle
"-------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
let &rtp .= "," . expand("~/" . cz_env_path . "/bundle/Vundle.vim")

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
let path = "~/" . cz_env_path . "/bundle"
call vundle#begin(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" cz's choose
Plugin 'VisIncr'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'taglist.vim'
Plugin 'ervandew/supertab'
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
"Plugin 'SirVer/ultisnips'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/powerline-fonts'
Plugin 'AutoComplPop'
"Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'mkitt/tabline.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"-------------------------------------------------------------------------------
" cz env
"-------------------------------------------------------------------------------
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
set backup		" keep a backup file
let &backupdir = expand("~/" . cz_env_path . "/backup")
set encoding=utf-8
if platform == "win"
    set guifont=Inconsolata\ for\ Powerline:h12:cANSI
    set guifontwide=NanumGothicCoding:h9:cDEFAULT
    lang mes en_US
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
else
    set term=xterm-256color
endif
set history=1000	" keep 50 lines of command line history
set ruler		" show the cursor position all the time
syntax on
set hlsearch
set t_Co=256
"set autoindent
"set cindent
set smartindent
set nowrap
set lbr
"set visualbell
set shiftwidth=4
set tabstop=4
set expandtab
set number
set incsearch
"set paste!
set showmatch
set title
set laststatus=2
set mouse=a
set diffopt+=iwhite
"call pathogen#infect()
"set dictionary=/usr/share/dict/words


"-------------------------------------------------------------------------------
" env for solarized
"-------------------------------------------------------------------------------
"colorscheme xoria256
colorscheme solarized
let g:solarized_termcolors=256
if has('gui_running')
	set background=light
else
	"set background=dark
    set background=light
endif


"-------------------------------------------------------------------------------
" env for powerline
"-------------------------------------------------------------------------------
"call Pl#Theme#InsertSegment('charcode', 'after', 'filetype')
"let g:Powerline_symbols = 'fancy'


"-------------------------------------------------------------------------------
" env for airline
"-------------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 0


"-------------------------------------------------------------------------------
" env for tags
"-------------------------------------------------------------------------------
set tags=./tags,tags
set tags+=./tags_usr


"-------------------------------------------------------------------------------
" env for taglist
"-------------------------------------------------------------------------------
"let Tlist_Auto_Open = 1
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"let Tlist_Use_Right_Window = 1


"-------------------------------------------------------------------------------
" env for ctrlp
"-------------------------------------------------------------------------------
"let g:ctrlp_match_window_bottom = 0
"let g:ctrlp_match_window_reversed = 0


"-------------------------------------------------------------------------------
" env for nerdtree
"-------------------------------------------------------------------------------
let NERDTreeDirArrows = 0


"-------------------------------------------------------------------------------
" env for syntastic
"-------------------------------------------------------------------------------
"setlocal makeprg=gcc\ -Wall\ -Wextra\ -o\ %<\ %
"let g:syntastic_debug = 1
"let g:syntastic_debug_file = './syntastic.log'


"-------------------------------------------------------------------------------
" env for map
"-------------------------------------------------------------------------------
function b:repeat_num_search()
    let i=strpart(@/,2,len(@/)-4)
    echo i
    while i>0
        normal @a
        let i=i-1
    endwhile
endfunction

function! CursorPing()
    set cursorline cursorcolumn
    redraw
    sleep 200m
    set nocursorline nocursorcolumn
    redraw
    sleep 200m
    set cursorline cursorcolumn
    redraw
    sleep 200m
    set nocursorline nocursorcolumn
    redraw
    sleep 200m
    set cursorline cursorcolumn
    redraw
    sleep 200m
    set nocursorline nocursorcolumn
endfunction

map <F2> :only<CR> :vs<CR> :b1<CR> :diffthis<CR> <C-W><C-W> :b2<CR> :diffthis<CR> <C-W><C-W> :echo 'diff b1 vs b2 - get:do put:dp next:]c prev:[c :)'<CR>
map <F3> :call b:repeat_num_search()<CR>
map <F4> :call AddHeader('//')<CR>
nmap \e :NERDTreeToggle<CR>
nmap \h :set hlsearch!<CR>
nmap \t :Tlist<CR>
nmap <C-j> :bnext<CR>
nmap <C-k> :bprev<CR>
nmap <C-b> :call CursorPing()<CR>

nnoremap <leader>. :CtrlPTag<CR>

"-------------------------------------------------------------------------------
" env for map
"-------------------------------------------------------------------------------
" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

endif

