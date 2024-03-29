"   ██╗███╗   ██╗██╗████████╗██╗   ██╗██╗███╗   ███╗
"   ██║████╗  ██║██║╚══██╔══╝██║   ██║██║████╗ ████║
"   ██║██╔██╗ ██║██║   ██║   ██║   ██║██║██╔████╔██║
"   ██║██║╚██╗██║██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║
"   ██║██║ ╚████║██║   ██║██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
"   ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

if &compatible
  set nocompatible
endif

set runtimepath+={{ dein_bundles_dir }}/repos/github.com/Shougo/dein.vim

if dein#load_state('{{ dein_bundles_dir }}')
  call dein#begin('{{ dein_bundles_dir }}')

  " Let dein manage dein.
  call dein#add('{{ dein_bundles_dir }}/repos/github.com/Shougo/dein.vim')

  "
  " Visual Interface Plugins
  "

  " Airline
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Colorschemes
  call dein#add('chriskempson/base16-vim')

  "
  " Programming Plugins
  "

  " Generic Programming
  call dein#add('Raimondi/delimitMate')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-surround')

  " Filesystem Navigation
  call dein#add('ctrlpvim/ctrlp.vim')

  " Filetype Syntax and Highlighting
  call dein#add('scrooloose/syntastic')
  call dein#add('PProvost/vim-ps1')

  " Programming Snippet and Completion
  call dein#add('neoclide/coc.nvim', { 'merged': 0, 'rev': 'release' })

  " Version Control
  call dein#add('airblade/vim-gitgutter')

  "
  " Misc Plugins
  "

  " Not neovim
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

" Theme
if exists('$BASE16_THEME')
    \ && (!exists('g:colors_name') || g:colors_name != 'base16-$BASE16_THEME')
  let base16colorspace=256
  colorscheme base16-$BASE16_THEME
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

"
" Plugin configuration: vim-airline
"

let g:airline_theme='base16_default'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1

"
" Plugin configuration: ctrlp.vim
"

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

"
" Plugin configuration: syntastic
"

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"
" Plugin configuration: vim-gitgutter
"
noremap  <Leader>g :GitGutterToggle<CR>

" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
