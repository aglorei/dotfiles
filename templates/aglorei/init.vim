"   ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
"   ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
"   ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
"   ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
"   ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
"   ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

if &compatible
  set nocompatible
endif

set runtimepath+=~/.vim/bundles/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundles')
  call dein#begin('~/.vim/bundles')

  " Let dein manage dein.
  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Generic Programming
  call dein#add('Raimondi/delimitMate')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-surround')

  " Syntax
  call dein#add('scrooloose/syntastic')
  call dein#add('PProvost/vim-ps1')

  " Utility
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Version Control
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')

  " Interface
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Colorschemes
  call dein#add('chriskempson/base16-vim')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" Theme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
else
  colorscheme default
endif

set background=dark

" Use :help 'option' for documentation
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch

set smarttab
set nrformats-=octal
set ttimeout
set ttimeoutlen=50

set encoding=utf-8
set shiftround
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:░░,trail:▓
set list

set incsearch
set ignorecase
set smartcase
set hlsearch

set number
set ruler
set relativenumber

set showcmd
set showmode
set laststatus=2
set wildmenu

set autoread
set hidden
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac
set completeopt=longest,menuone

" In many terminal emulators the mouse works just fine, thus enable it
if has('mouse')
  set mouse=a
endif

" Lazy ':'
map \ :

let mapleader = ','

" Plugin configurations

" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" vim-airline
let g:airline_theme='base16_default'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1

" vim-gitgutter
noremap  <Leader>g :GitGutterToggle<CR>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" LanguageClient-neovim
" Requires 'set hidden'

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls']
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> nm :call LanguageClient#textDocument_rename()<CR>

" deoplete
let g:deoplete#enable_at_startup = 1

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
