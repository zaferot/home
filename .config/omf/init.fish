# Remove fish default greeting
set --erase fish_greeting

# Colored man
set -xU LESS_TERMCAP_mb (printf "\e[01;31m")      # begin blinking
set -xU LESS_TERMCAP_md (printf "\e[01;31m")      # begin bold
set -xU LESS_TERMCAP_me (printf "\e[0m")          # end mode
set -xU LESS_TERMCAP_se (printf "\e[0m")          # end standout-mode
set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")   # begin standout-mode - info box
set -xU LESS_TERMCAP_ue (printf "\e[0m")          # end underline
set -xU LESS_TERMCAP_us (printf "\e[01;32m")      # begin underline

# Set LC_COLORS
eval (dircolors -c ~/.dircolors | sed 's/>&\/dev\/null$//')

# Setting ag as the default source for fzf
set -x FZF_DEFAULT_COMMAND 'ag -l -g ""'

# SSH agent
set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

# Set default $TERM when in tmux
if test -z "$TMUX"
  set -x TERM 'xterm-256color'
end

# Set default editor
set -x EDITOR vim
