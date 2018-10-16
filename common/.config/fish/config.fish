# Set VSCode as default editor
set -x EDITOR code

# Cargo (Rust)
if test -d $HOME/.cargo/bin
  set PATH $HOME/.cargo/bin $PATH
end

# Postgres.app
if test -d /Applications/Postgres.app
  set PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH
end

# TeX
if test -d /Library/TeX/texbin
  set PATH /Library/TeX/texbin $PATH
end

# rbenv
command --search rbenv > /dev/null; and rbenv init - | source

# pyenv
command --search pyenv > /dev/null; and pyenv init - | source

# initialize nvm
type --quiet nvm; and nvm use default > /dev/null

# use exa in place of ls: https://github.com/ogham/exa
if command --search exa > /dev/null
  function ls
    exa --group-directories-first $argv
  end

  # tree view shortcuts
  function l;   ls --all --tree --long --level 1 $argv; end
  function ll;  ls --all --tree --long --level 2 $argv; end
  function lll; ls --all --tree --long --level 3 $argv; end
end

# docker-compose shortcut
function dc
  docker-compose $argv
end

# gitup shortcut
function gu
  pushd $argv[1]; and gitup
  popd
end

# iterm2
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# direnv
eval (direnv hook fish)
