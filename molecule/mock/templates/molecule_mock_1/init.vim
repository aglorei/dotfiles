if &compatible
  set nocompatible
endif

set runtimepath+={{ dein_bundles_dir }}/repos/github.com/Shougo/dein.vim

if dein#load_state('{{ dein_bundles_dir }}')
  call dein#begin('{{ dein_bundles_dir }}')

  " Let dein manage dein.
  call dein#add('{{ dein_bundles_dir }}/repos/github.com/Shougo/dein.vim')

  " Generic Programming
  call dein#add('Raimondi/delimitMate')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-surround')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
