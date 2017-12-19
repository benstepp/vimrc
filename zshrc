export ZSH=~/.oh-my-zsh
source "$ZSH/custom/zsh-git-prompt/zshrc.sh"
ZSH_THEME="robbyrussell"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=()

export PATH="/usr/local/Cellar/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin"
export PATH="~/.rbenv/bin:$PATH"

source $ZSH/oh-my-zsh.sh

GIT_PROMPT_EXECUTABLE="haskell"
PROMPT='💁  [%c] $(git_super_status)$ '

export PGPASSFILE='~/.pgpass'

alias rgm='bundle exec rails g migration'
alias rs='bundle exec rails server'
alias rc='bundle exec rails console'
alias rdbm='bundle exec rake db:migrate && RAILS_ENV=test bundle exec rake db:migrate'
alias rdbr='bundle exec rake db:rollback && RAILS_ENV=test bundle exec rake db:rollback'
alias g='hub'
alias git='hub'
alias ga='hub add'
alias gs='hub status && hub --no-pager diff --stat'
alias gp='hub push'
alias gc='hub commit -v'
alias gr='hub fetch && hub rebase -i origin/master'
alias gpr='hub pull-request'
alias sudo='sudo '
alias vim='nvim'
alias vi='nvim'
alias http='python -m SimpleHTTPServer 9000'
alias z='cd /Volumes/Z-Drive/'
alias dcr='docker-compose run --rm '

export EDITOR='nvim'

eval "$(rbenv init -)"

shitpostgres() {
  launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
  rm /usr/local/var/postgres/postmaster.pid &>/dev/null
  launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
}

rsb() {
  bundle exec rails server -b $(ifconfig | grep -o '\s192.168.[0-9]\{1,3\}.[0-9]\{1,3\}\s')
}

delete_all_docker_shit() {
  docker stop $(docker ps -a -q)
  docker rm $(docker ps -a -q)
  docker volume rm $(docker volume ls -q)
  docker images | grep -o '\S*' | xargs docker rmi
  docker images -q | xargs docker rmi
}

docker_aws() {
  eval $(aws ecr get-login --region us-east-1)
}

update_all() {
  brew update && \
    brew upgrade && \
    brew reinstall --HEAD neovim && \
    upgrade_oh_my_zsh && \
    nvim +PlugUpdate +q +q
}
