# customize colors
set --universal fish_color_command '6191fc'

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

# docker-compose shortcut
function dc
  docker-compose $argv
end

# Postgres.app
set PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH

# iterm2
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
