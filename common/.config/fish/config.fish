# Homebrew
if test -d /opt/homebrew/bin
  eval (/opt/homebrew/bin/brew shellenv)
end

# Yolk
set -x YOLK_REPOS_PATH "/Users/spencerelliott/dev/Yolk-HQ"

# Set VSCode as default editor
set -x EDITOR "code --wait"

# User-scoped binaries
if test -d "$HOME/bin"
  set PATH $HOME/bin $PATH
end

# starship
command --search starship > /dev/null; and starship init fish | source

# volta
if test -d "$HOME/.volta/bin"
  set -x VOLTA_HOME "$HOME/.volta"
  set PATH "$VOLTA_HOME/bin" $PATH
end

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

# gitup shortcut
function gu
  pushd $argv[1]; and gitup
  popd
end

# iterm2
test -e $HOME/.iterm2_shell_integration.fish ; and source $HOME/.iterm2_shell_integration.fish ; or true

# direnv
eval (direnv hook fish)

# helm
if command --search helm > /dev/null
  helm completion fish | source
end

# delete all local git branches which have been merged into master
function git-delete-merged
  git branch --merged master | grep -v "master" | xargs git branch -d
end

# nx
function nx --description 'Alias for pnpm run nx --'
  pnpm run nx -- $argv
end
