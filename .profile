test -r /sw/bin/init.sh && . /sw/bin/init.sh
#PS1='[\D{%d.%m.%y} \t \u:\w ]$ '
if [ -f "$HOME/.aliases" ]; then
	. "$HOME/.aliases"
fi
if [ -f "$HOME/.bash_ps1" ]; then
	. "$HOME/.bash_ps1"
fi

# man page colours
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
