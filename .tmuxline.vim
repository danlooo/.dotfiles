" https://github.com/edkolev/tmuxline.vim

let g:tmuxline_preset = 'nightly_fox'

let g:tmuxline_preset = {
      \'a'    : ['#S'],
      \'win'  : ['#I', '#W'],
      \'cwin' : ['#I', '#W', '#F'],
      \'y'    : [''],
      \'z'    : ['#(cd #{pane_current_path}; git rev-parse --abbrev-ref HEAD)',
      \          '#{s|/home/$USER|~|:pane_current_path}', '#H']}


Tmuxline vim_statusline_2
TmuxlineSnapshot! ~/.tmuxline
