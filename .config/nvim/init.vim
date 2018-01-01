call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'zchee/deoplete-jedi'

call plug#end()

syntax on
filetype plugin indent on
set autoindent
set complete-=i
set backspace=indent,eol,start
set smarttab
set tabstop=4
set shiftwidth=4
set encoding=utf-8
set number
set hlsearch
set clipboard=unnamed

let mapleader=','
let maplocalleader='//'

" Normal Mode remaps
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim
nnoremap <space> viw
nnoremap U <c-R>
nnoremap H ^
nnoremap L $

" Visual Mode remaps
vnoremap H ^
vnoremap L $

" Operator remaps
onoremap p i(

" Supertab
let g:SupertabDefaultCompletionType='<c-n>'

" Nerdcommenter
" Add spaces after comment delimeters by default
let g:NERDSpaceDelims = 1
" Enable trimming of whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" NerdTree
noremap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Deoplete
let g:deoplete#enable_at_startup=1
set completeopt-=preview

" Search for text within visual selection
function! RangeSearch(direction)
  call inputsave()
  let g:srchstr = input(a:direction)
  call inputrestore()
  if strlen(g:srchstr) > 0
    let g:srchstr = g:srchstr.
          \ '\%>'.(line("'<")-1).'l'.
          \ '\%<'.(line("'>")+1).'l'
  else
    let g:srchstr = ''
  endif
endfunction
vnoremap <silent> / :<C-U>call RangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
vnoremap <silent> ? :<C-U>call RangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>
