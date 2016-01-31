# fisherman
set fisher_home ~/.fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

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
