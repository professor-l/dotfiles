#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Ignore duplicate lines in bash history
HISTCONTROL=ignoreboth

# Append history file instead of overwrite
shopt -s histappend

# History length
HISTSIZE=1000
HISTFILESIZE=2000


# Check window size after each command Just In Case[TM]
shopt -s checkwinsize

# MY FAVORITE BASH COLORS in 256
# Format: \e[38;5;NNNm   where [NNN] is a number
# Ex: \e[38;5;219m
#
# red           203
# orange        215
# yellow        221
# green         113
# blue          39
# light blue    111
# purple        207 ~ PREFERRED ACCENT
# pink          219
# black         232
#   .           234
#   .           240
#   .           245
# white         250
# bright        255

alias ls='ls --color=auto'

# Prompt shows dir in purple
PS1='[\u@\h\[\e[38;5;207m\] \W\[\e[0m\]]\$ '

# LS colors match my favorites above
LS_COLORS='rs=0:no=38;5;250:fi=38;5;250:di=38;5;39:ln=38;5;215:bd=38;5;111:cd=38;5;113:or=38;5;203;48;5;250:ex=38;5;203:'
export LS_COLORS

# GCC colors are similar
GCC_COLORS='error=38;5;203:warning=38;5;215:note=38;5;39:caret=38;5;113:locus=01:quote=01'
export GCC_COLORS

# Forcing tmux color compatability
alias tmux="tmux -2"

# Nice color printing aliases
alias print-colors='for COLOR in {0..255}; do echo -en "\e[38;5;${COLOR}m${COLOR} "; done; echo;'
alias print-colors8='for COLOR in {30..37}; do echo -en "\e[${COLOR}m${COLOR} "; done; echo;'
alias print-colors8-light='for COLOR in {90..97}; do echo -en "\e[${COLOR}m${COLOR} "; done; echo;'

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.9

# Alias to enable virtualenv
alias ev='source /usr/bin/virtualenvwrapper.sh'

alias getip='curl https://ipinfo.io/ip ; echo'
alias c='xclip -selection clipboard'
alias p='xclip -o -selection clipboard'

# Enabling fzf and its vim hooks if installed
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

PATH="$PATH:~/.bin"
export PATH

