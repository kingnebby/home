# The following lines were added by compinstall
zstyle :compinstall filename '/Users/danvilla/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

bindkey "^R" history-incremental-search-backward

# alias
alias ll="ls -la"
alias dk="docker"

env-az() {
  echo -n "az subscription ($AZ_SUB): "
  read az_sub;
  if [ ! -z "$az_sub" ]; then;
    export AZ_SUB=$az_sub;
  fi;

  echo -n "aks instance id ($AZ_AKS_ID): "
  read aks_id;
  if [ ! -z "$aks_id" ]; then;
    export AZ_AKS_ID=$aks_id;
  fi;
}

# functions
mkfile() {
  mkdir -p "$(dirname "$1")" && touch "$1" ;
}
dkb() {
  docker run -it "$1" bash
}
dks() {
  docker run -it "$1" sh
}
dkc() {
  docker-compose $1
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Custom Prompt
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# export PS1="[\[\e[32m\]\w\[\e[0m\]]\n\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` [\[\e[34m\]\u\[\e[0m\]]\[\e[36m\]\$(parse_git_branch)\[\e[0m\] 🔥 \$ "

