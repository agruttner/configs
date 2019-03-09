#PS1='[\D{%d.%m.%y} \t \u:\w ]$ '
if [ -f "$HOME/.bash_ps1" ]; then
	. "$HOME/.bash_ps1"
fi
if [ -f "$HOME/.bash_aliases" ]; then
	. "$HOME/.bash_aliases"
fi

# turn on vi keybindings for command line
set -o vi

export PYTHONPATH="${PYTHONPATH}:/Users/adam/source/laughing-broccoli/"
