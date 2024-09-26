# Homebrew
if test -d /opt/homebrew/bin
  eval (/opt/homebrew/bin/brew shellenv)
end

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
if command --search pyenv > /dev/null
  set -x PYENV_ROOT $HOME/.pyenv
  pyenv init - | source
end

# use eza in place of ls: https://github.com/eza-community/eza
if command --search eza > /dev/null
  function ls
    eza --group-directories-first $argv
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

# golang
if test -d "/opt/homebrew/opt/go@1.17"
  fish_add_path "/opt/homebrew/opt/go@1.17/bin"
end

if test -d "$HOME/go"
  set -x GOPATH ~/go
  set -x GOBIN ~/go/bin
  fish_add_path $GOBIN
end

if test -d "/opt/homebrew/opt/skaffold@1.39/bin"
  fish_add_path "/opt/homebrew/opt/skaffold@1.39/bin"
end

# zoxide
if command --search zoxide > /dev/null
  zoxide init fish | source
end

# pnpm
set -gx PNPM_HOME "$HOME/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# gcloud
if command --search gcloud > /dev/null
  source "$(brew --prefix)/share/google-cloud-sdk/path.fish.inc"
end

# postgres
if test -d "/opt/homebrew/opt/libpq/bin"
  fish_add_path "/opt/homebrew/opt/libpq/bin"
end

# uv
fish_add_path "/Users/spencer/.local/bin"
