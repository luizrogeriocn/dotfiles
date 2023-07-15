# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        source "$BASE16_SHELL/profile_helper.sh"

base16_solarized-dark

source ~/../usr/share/fzf/key-bindings.zsh
source ~/../usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git'

function caws() {
  target=${1:-magnetis}
  kubectl -n $target exec -ti pod/$(kubectl get pods -n $target | grep Running | grep -vE 'worker|kafka|pre' | awk '{print $1}') -- sh -c "source /vault/secrets/env && sh"
}

export VISUAL=vim
export EDITOR="$VISUAL"
