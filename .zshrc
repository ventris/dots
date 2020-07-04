#!/usr/bin/env zsh
export ZSH=$HOME/.oh-my-zsh

# shortcut to this dotfiles path is $ZSH
export DOTFILES=$HOME/dotfiles

export LC_ALL=en_US.UTF-8

export DYLD_LIBRARY_PATH=/usr/local/opt/openssl/lib:$DYLD_LIBRARY_PATH

# all of our zsh files
typeset -U config_files
config_files=($DOTFILES/*.zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}
do
  source $file
done

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
  source $file
done

ZSH_THEME="typo"

plugins=(
  git
)

unset config_files

source $ZSH/oh-my-zsh.sh

if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

autoload -U +X bashcompinit && bashcompinit

complete -o nospace -C /usr/local/bin/vault vault

#export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=30000
SAVEHIST=30000

export ERL_AFLAGS="-kernel shell_history enabled"

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5


