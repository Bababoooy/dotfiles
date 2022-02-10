
if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting
colorscript random

starship init fish | source
alias ls="lsd"
alias cat="bat"
export EDITOR='nvim'
