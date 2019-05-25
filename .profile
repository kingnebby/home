# FIX HOME DIR
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
source /usr/local/opt/nvm/nvm.sh
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# alias
alias ll="ls -la"
alias dk="docker"

# Custom functions
mkfile() {
  mkdir -p "$(dirname "$1")" && touch "$1" ;
}
dkb() {
  docker run -it "$1" bash
}

# Custom Bash
# Show git
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="[\[\e[32m\]\w\[\e[0m\]]\n\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\` [\[\e[34m\]\u\[\e[0m\]]\[\e[36m\]\$(parse_git_branch)\[\e[0m\] 🔥 \$ "
