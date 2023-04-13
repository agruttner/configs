# NOTE: using zlogin because other tools use zshrc (ie PDE setup)
# enable oh-my-zsh

##############################################
# basic options
##############################################
# enable vim bindings on command line
setopt VI

# case-insensitive tab completion and globbing of paths
setopt NO_CASE_GLOB

# automatically cd into a directory if cmd is a dir without cd
setopt AUTO_CD

# enable command correction prompts
# n: execute as typed
# y: accept and execute the suggested correction
# a: abort and do nothing
# e: return to the prompt to continue editing
setopt CORRECT
setopt CORRECT_ALL

##############################################
# history settings
##############################################
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=5000
HISTSIZE=2000
# add more info to history
setopt EXTENDED_HISTORY
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
# ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
# expand history thingies (ie !!, :p) to full command
setopt HIST_VERIFY

##############################################
# completion
##############################################
# case insensitive path completion 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 
# partial completion suggestions
zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix 
# init completion system
autoload -Uz compinit && compinit
# load bashcompinit for some old bash completions 
autoload bashcompinit && bashcompinit

##############################################
# prompt
##############################################
# colors: execute `spectrum_ls` command
# see for git vars: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/git-prompt/git-prompt.plugin.zsh
git_prompt_status() {
  precmd_update_git_vars
  if [ -n "$__CURRENT_GIT_STATUS" ]; then
    COLOR="green"
    if [ "$GIT_CLEAN" -ne "1" ]; then
      COLOR="red"
    fi
    if [ "$GIT_STASHED" -ne "0" ]; then
      STASH=" $"
    fi
    UPSTREAM=""
    if [ "$GIT_BEHIND" -ne "0" ]; then
      UPSTREAM+="<"
    fi
    if [ "$GIT_AHEAD" -ne "0" ]; then
      UPSTREAM+=">"
    fi
    if [ "$GIT_BEHIND" -eq "0" ] && [ "$GIT_AHEAD" -eq "0" ]; then
      UPSTREAM="="
    fi
    CONFLICTS=""
    if [ "$GIT_CONFLICTS" -ne "0" ]; then
      CONFLICTS="|MERGING"
    fi
    PREFIX="%B%F{$COLOR}("
    SUFFIX="%)%f%b"
    echo "$PREFIX$GIT_BRANCH$UPSTREAM$STASH$CONFLICTS$SUFFIX"
  fi
}
PROMPT='%(?.%F{green}√.%F{red}?%?)%f [%n@%F{226}%m%f:%B%~%b $(git_prompt_status) ]%# '
RPROMPT='%*'

##############################################
# git
##############################################
git config --global --replace-all core.pager "less -F -X"

##############################################
# source other files
##############################################
source ${ZDOTDIR}/.zsh_aliases
