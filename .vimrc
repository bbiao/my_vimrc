"set fileencodings=gb18030,utf-8
"set fileencodings=gbk,utf-8
set fileencodings=cp936,utf-8
"set termencoding=cp936
set termencoding=utf-8,cp936
set encoding=utf-8
set nu
set hls 
set ai
set si
inoremap # X#
set ci
set ts=4
set sw=4
"set mouse=a
set bs=2
set backupdir=~/.vim/backup
set guifont=Courier_New:h10:cANSI
"set expandtab
set ignorecase smartcase
syntax on
set nocp
filetype plugin on

set viminfo='10,\"100,:20,%,n~/.viminfo
   au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

map <F12> :! ctags *.cpp *.h<CR>
map <F8> :!perltidy -q<CR>

if has("gui_running")
set lines=35
set co=120
endif

autocmd FileType make set noexpandtab
autocmd FileType diff nmap <C-n> /^+\\|^-<CR>
"autocmd FileType diff nmap q :q<CR>
"autocmd FileType svnlog nmap q :q<CR>

set ttymouse=xterm2

set tags=tags;

set foldmethod=syntax
set foldminlines=5

colorscheme desert

highlight TooLong ctermbg=grey
autocmd FileType cpp match TooLong '\%>100v.*'

" Doxygen Settings
let g:DoxygenToolkit_authorName="zhangbiao(zhangbiao@baidu.com)"
let g:DoxygenToolkit_briefTag_funcName = "yes"
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
let g:DoxygenToolkit_licenseTag="Copyright (c) 2011 Baidu.com, Inc. All Rights Reserved"
let g:doxygen_enhanced_color=1
" DoxAuthor Dox DoxBlock三个命令的快捷操作
map <F3>a :DoxAuthor<CR>
map <F3>f :Dox<CR>
map <F3>b :DoxBlock<CR>
map <F3>c O/** */<Left><Left>
map <F3>l :DoxLic<CR>

map <F5>l :Tlist<CR>
