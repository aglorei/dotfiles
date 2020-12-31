if &compatible
  set nocompatible
endif

set runtimepath+={{ dein_bundles_dir }}/repos/github.com/Shougo/dein.vim

if dein#load_state('{{ dein_bundles_dir }}')
  call dein#begin('{{ dein_bundles_dir }}')

  " Add or remove your plugins here like this:
  {% for plugin in dein_plugins %}
    call dein#add('{{ plugin.dest }}')
  {% endfor %}

  " Required:
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
