# fisherman
set fisher_home ~/.fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

# customize colors
set --universal fish_color_command '6191fc'

# homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.fish"

# rbenv
rbenv init - | source

# nvm
function nvm
  fenv source ~/.nvm/nvm.sh ';' nvm $argv
end

# aliases
alias ls=exa
