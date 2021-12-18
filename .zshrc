# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
cd /home/roger

export ZSH="/home/roger/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function caws() {
  target=${1:-magnetis}
  kubectl -n $target exec -ti pod/$(kubectl get pods -n $target | grep Running | grep -vE 'worker|kafka|pre' | awk '{print $1}') -- sh -c "source /vault/secrets/env && sh"
}

export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git'
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

export VISUAL=vim
export EDITOR="$VISUAL"
