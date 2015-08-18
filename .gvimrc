set guioptions=

" Font
if has("macunix")
  set guifont=Menlo:h14
endif

" Color scheme
if has('gui_running')
  colorscheme solarized
  set background=dark
endif

" Remove macvim default arrow navigations
if has("macunix")
  let macvim_skip_cmd_opt_movement = 1
endif