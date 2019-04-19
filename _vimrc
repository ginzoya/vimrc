colorscheme slate
syntax on

" show line number in gutter
set number

set colorcolumn=80

" show whitespace as characters
" eol:⏎
set list
" this check is nvim-specific, otherwise it should look like:
" if has('gui_running')
if exists('g:GuiLoaded')
    set listchars=tab:␉→,trail:·,nbsp:⎵
else
    set listchars=tab:>-,trail:.
endif

" tab inserts 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Explorer tree-style
let g:netrw_liststyle = 3

" support normal path slashes on Windows
if exists('+shellslash')
    set shellslash
endif

" for git bash whenever it runs vim
if !exists('g:GuiLoaded')
    finish
endif

let g:python3_host_prog = 'C:/Users/Aaron/AppData/Local/Programs/Python/Python-37-32/python.exe'

" for vim-hug-neovim-rpc
set encoding=utf-8

" neovim dein
" don't forget to install with :call dein#install() or dein#update()
"""""""""""""
set runtimepath+=C:/Users/Aaron/vimfiles/bundle/repos/github.com/Shougo/dein.vim

if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " auto complete for python
  call dein#add('deoplete-plugins/deoplete-jedi')

  " python linter
  call dein#add('nvie/vim-flake8')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" flake8
" put the following in ~/.config/flake8 to make your life a little less miserable:
" [flake8]
" max-line-length = 120
let g:flake8_show_in_gutter=1
autocmd BufWritePost *.py call flake8#Flake8()
