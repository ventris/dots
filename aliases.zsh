# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"

# Directories
alias dotfiles="cd $DOTFILES"

# Vagrant
alias v="vagrant global-status"
alias vup="vagrant up"
alias vhalt="vagrant halt"
alias vssh="vagrant ssh"
alias vreload="vagrant reload"
alias vrebuild="vagrant destroy --force && vagrant up"

# Docker
alias docker-composer="docker-compose"
alias dk="docker "
alias dklog="docker logs -f --tail 100 "
alias dkl="docker logs -f --tail 100 "
alias dkdf="dk system df"
# Stop and remove all running containers
alias dkrm!='docker rm -f $(docker ps -a -q)'

alias dc="docker-compose"
alias dcup="docker-compose up -d "
alias dcrun="docker-compose run --rm "
function dcdebug {
  docker-compose kill $1
  docker-compose run --service-ports $1
}
# Stop and recreate a container
alias dcreup="docker-compose up -d --force-recreate --no-deps "
alias dclog="docker-compose logs -f --tail 100 "
alias dcl="docker-compose logs -f --tail 100 "

alias ds="docker-sync"
alias dss="docker-sync start"
alias dsx="docker-sync stop"

alias dcbomb!="docker-compose down -v"

# Stop running containers and remove them
alias dclean="docker-clean --stop --containers"

# Open bash in a container. Pass docker-compose name
function dcbash {
  docker-compose exec $1 /bin/bash
}

# Open bash in a container. Pass container name
function dkbash {
  docker exec -it $1 /bin/bash
}

# Git
alias gst="git status"
alias gb="git branch"
alias gc="git checkout"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git add . && git commit -m"
alias diff="git diff"
alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="commit wip"

# MTR
alias mtr=‘sudo /usr/local/sbin/mtr’
