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

# use exa in place of ls: https://github.com/ogham/exa
function ls
  exa --group-directories-first $argv
end

# tree view shortcuts
function l;   exa --tree --long --level 1 $argv; end
function ll;  exa --tree --long --level 2 $argv; end
function lll; exa --tree --long --level 3; end
