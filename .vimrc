" VIMRC
" Written by D.Sánchez 2025
"
"
" Set colorscheme
colorscheme unokai
" Set new not compatible mode
set nocompatible
" Activate line numbers
set number
" Visualize courso line
set cursorline
" Activate mouse support
set mouse=a
" Syntax coloration
syntax on
"Enable auto completion menu after pressing TAB.
set wildmenu
" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest
" Enable plugins and load plugin for the detected file type.
filetype plugin indent on
" Show file stats.
set ruler
" Blink cursor on error instead of beeping.
set visualbell
" Encoding.
set encoding=utf-8
" Security.
set modelines=0
" Show color column at 80 characters width, visual reminder of keepingcode line within a popular line width.
"set colorcolumn=80
"Wraps text instead of forcing a horizontal scroll
set wrap
"Reacts to the syntax/style of the code you are editing
set smartindent
"Makes sure that spaces are used for indenting lines, even when you press the "Tab" key
set expandtab
"This will insert 2 spaces for a line indent
set tabstop=2
"Manages the indentation when you use the ">>" or "<<" operators to add or remove indentation to an already existing line/block of code
set shiftwidth=2
"The previous commands can be combined into a single line
set tabstop=2 shiftwidth=2 expandtab
" Configure the cursorline
hi CursorLine cterm=NONE ctermbg=234
