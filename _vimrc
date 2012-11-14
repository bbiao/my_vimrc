"  Modeline and Notes {
    " Original developed by http://robertmelton.com/contact (many forms of communication)
    " Mod by @bbiao http://www.agilephp.net
    " If you have any questions, you can contact one of us
" }

" pathogen {
    call pathogen#infect()
" }

" Encoding {
    set fileencodings=ucs-bom,utf-8,gbk
    set fileencoding=utf-8
    set termencoding=utf-8
    set encoding=utf-8
    "set encoding=gbk
" }

" Basics {
    set nocompatible " explicitly get out of vi-compatible mode
    set noexrc " don't use local version of .(g)vimrc, .exrc
    set t_Co=256
    set background=dark " we plan to use a dark background
    set cpoptions=aABceFsmq
    "             |||||||||
    "             ||||||||+-- When joining lines, leave the cursor 
    "             |||||||      between joined lines
    "             |||||||+-- When a new match is created (showmatch) 
    "             ||||||      pause for .5
    "             ||||||+-- Set buffer options when entering the 
    "             |||||      buffer
    "             |||||+-- :write command updates current file name
    "             ||||+-- Automatically add <CR> to the last line 
    "             |||      when using :@r
    "             |||+-- Searching continues at the end of the match 
    "             ||      at the cursor position
    "             ||+-- A backslash has no special meaning in mappings
    "             |+-- :write updates alternative file name
    "             +-- :read updates alternative file name
    syntax on " syntax highlighting on
    set viminfo='10,\"100,:20,%,n~/.viminfo
    set backupdir=~/.vim/backup
" }

" General {
    filetype plugin indent on " load filetype plugins/indent settings
    "set autochdir " always switch to the current file directory
    colorscheme desert
    set backspace=indent,eol,start " make backspace a more flexible
    set clipboard+=unnamed " share windows clipboard
    set fileformats=unix " support all three, in this order
    set hidden " you can change buffers without saving
    " (XXX: #VIM/tpope warns the line below could break things)
    "set mouse=a " use mouse everywhere
    set noerrorbells " don't make noise
    set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual
    "set wildmenu " turn on command line completion wild style ignore these list file extensions
    "set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.jpg,*.gif,*.png
    "set wildmode=list:longest " turn on wild mode huge list
    set nocompatible
" }

" Vim UI {
    "set cursorcolumn " highlight the current column
    set cursorline " highlight current line
    set incsearch " BUT do highlight as you type you search phrase
    set laststatus=2 " always show the status line
    "set lazyredraw " do not redraw while running macros
    set linespace=0 " don't insert any extra pixel lines betweens rows out of my files
    "set matchtime=5 " how many tenths of a second to blink matching brackets for
    set hlsearch " do not highlight searched for phrases
    set nostartofline " leave my cursor where it was
    set novisualbell " don't blink
    set number " turn on line numbers
    set numberwidth=4 " We are good up to 99999 lines
    set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=10 " Keep 10 lines (top/bottom) for scope
    set shortmess=aOstT " shortens messages to avoid 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    set sidescrolloff=10 " Keep 5 lines at the size
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current 
    "              | | | | |  |   |      |  |     |       column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in 
    "              | | | | |  |   |          square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- rodified flag in square brackets
    "              +-- full path to file in the buffer
    " Green Yellow Blue Red Cyan Black White Gray
    hi CursorLine ctermbg=darkblue ctermfg=white cterm=NONE guibg=darkred guifg=white gui=NONE
    "hi CursorColumn cterm=NONE ctermbg=darkcyan ctermfg=white guibg=darkred guifg=white
    nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

    hi StatusLine ctermbg=cyan ctermfg=black cterm=NONE guibg=cyan guifg=black gui=NONE
    hi StatusLineNC ctermbg=cyan ctermfg=black cterm=REVERSE guibg=cyan guifg=black gui=REVERSE
    hi VertSplit ctermbg=cyan ctermfg=black cterm=NONE guibg=cyan guifg=black gui=NONE
"}

" Text Formatting/Layout {
    "set completeopt= " don't use a pop up menu for completions
    "set noexpandtab " no real tabs please!
    set expandtab
    set formatoptions=rq " Automatically insert comment leader on return, and let gq format comments
    set ignorecase " case insensitive by default
    set infercase " case inferred by default
    "set nowrap " do not wrap line
    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set smartcase " if there are caps, go case-sensitive
    set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
    set tabstop=4 " real tabs should be 8, and they will show with set list on
    set textwidth=100
    set smartindent
    if has("autocmd")
        au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif
    endif
    if $VIM_HATE_SPACE_ERRORS != '0' 
        let c_space_errors=1
    endif
" }

" Folding {
    set foldenable " Turn on folding
    set foldmarker={,} " Fold C style code (only use this as default if you use a high foldlevel)
    set foldmethod=marker " Fold on the marker
    "set foldmethod=syntax
    set foldlevel=100 " Don't autofold anything (but I can still fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds 
    function SimpleFoldText()
        return getline(v:foldstart).' '
    endfunction
    set foldtext=SimpleFoldText() " Custom fold text function (cleaner than default)
    "set foldminlines=5
" }

" FileType Settings {
    highlight TooLong ctermbg=grey

    autocmd FileType cpp match TooLong '\%>100v.*'

    autocmd FileType python match TooLong '\%>80v.*'
    autocmd FileType python inoremap # X#

    autocmd FileType make set noexpandtab
    autocmd FileType diff nmap <C-n> /^+\\|^-<CR>
    autocmd FileType svnlog nmap q :q<CR>
" }

" Plugin Settings {
    " TagList Settings {
        "let Tlist_Auto_Open=1 
        let Tlist_Exit_OnlyWindow=1
        let Tlist_WinWidth=25
    " }
    
    " Doxygen Settings {
        let g:DoxygenToolkit_authorName = "zhangbiao(zhangbiao@baidu.com)"
        let g:DoxygenToolkit_briefTag_funcName = "yes"
        "let g:DoxygenToolkit_blockHeader = "----------------------------------------------------------------------------"
        "let g:DoxygenToolkit_blockFooter = "----------------------------------------------------------------------------" 
        let g:DoxygenToolkit_licenseTag = "Copyright (c) 2012 Baidu.com, Inc. All Rights Reserved"
        let g:doxygen_enhanced_color = 1
    " }
    " WinManager Settings {
        let g:winManagerWindowLayout = 'FileExplorer,TagList,TagsExplorer|BufExplorer'
    " }
" }

" PowerLine {
    let g:Powerline_symbols = 'fancy'
" }

" NERDTree {
    let g:NERDChristmasTree = 1
" }

" Rainbow {
    let g:rainbow_active = 1
    let g:rainbow_operators = 1
" }

" Mappings {
    map <C-]> g]
    """Key mapping
    map <F12> :! ctags -R --fields=+lS .<CR>
    map <F8> :! perltidy -q<CR>
    map <F9> :%s/[ \t]*$//g<CR>

    """Key mapping - Doxygen
    map <F3>a :DoxAuthor<CR>
    map <F3>f :Dox<CR>
    map <F3>b :DoxBlock<CR>
    map <F3>c O/** */<Left><Left>
    map <F3>l :DoxLic<CR>
    """Key mapping -Tlist
    map <F5>l :Tlist<CR>
    map <C-w><C-l> :Tlist<CR>

    """Windows Manager
    map <C-w><C-f> :FirstExplorerWindow<CR>
    map <C-w><C-b> :BottomExplorerWindow<CR>
    map <C-w><C-w> :WMToggle<CR> 

    """NERDTree
    map <C-w><C-n> :NERDTreeToggle<CR>

    """CommandT
    map <C-w><C-t> :CommandT<CR>

    " space / shift-space scroll in normal mode
    "noremap <S-space> <C-b>
    "noremap <space> <C-f>

    " Make Arrow Keys Useful Again {
    " }
" }

" Autocommands {
    " Python {
        "autocmd BufWritePost *.py call Pyflakes()
        "autocmd BufWritePost *.py call Pep8()
        "autocmd FileType python map <buffer> <F7> :call Pyflakes()<CR>
        "autocmd FileType python map <buffer> <F6> :call Pep8()<CR>
    " }
    " Ruby {
        " ruby standard 2 spaces, always
        "au BufRead,BufNewFile *.rb,*.rhtml set shiftwidth=2 
        "au BufRead,BufNewFile *.rb,*.rhtml set softtabstop=2 
    " }
    " Notes {
        " I consider .notes files special, and handle them differently, I
        " should probably put this in another file
        "au BufRead,BufNewFile *.notes set foldlevel=2
        "au BufRead,BufNewFile *.notes set foldmethod=indent
        "au BufRead,BufNewFile *.notes set foldtext=foldtext()
        "au BufRead,BufNewFile *.notes set listchars=tab:\ \ 
        "au BufRead,BufNewFile *.notes set noexpandtab
        "au BufRead,BufNewFile *.notes set shiftwidth=8
        "au BufRead,BufNewFile *.notes set softtabstop=8
        "au BufRead,BufNewFile *.notes set tabstop=8
        "au BufRead,BufNewFile *.notes set syntax=notes
        "au BufRead,BufNewFile *.notes set nocursorcolumn
        "au BufRead,BufNewFile *.notes set nocursorline
        "au BufRead,BufNewFile *.notes set guifont=Consolas:h12
        "au BufRead,BufNewFile *.notes set spell
    " }
    "au BufNewFile,BufRead *.ahk setf ahk 
" }

" GUI Settings {
if has("gui_running") " {
    " Basics {
        colorscheme dejavu " my color scheme (only works in GUI)
        set guioptions=ce 
        "               ||
        "               |+-- use simple dialogs rather than pop-ups
        "               +--- use GUI tabs, not console style tabs
        set guifont=Yahei\ Mono\ for\ Powerline
        set lines=55 " perfect size for me
        set columns=120
        set mousehide " hide the mouse cursor when typing
    " }

    "map <F9> <ESC>:set guifont=Consolas:h10<CR>
    "map <F10> <ESC>:set guifont=Consolas:h12<CR>
    "map <F11> <ESC>:set guifont=Consolas:h16<CR>
    "map <F12> <ESC>:set guifont=Consolas:h20<CR>
" }
endif
" }
