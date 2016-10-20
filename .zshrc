if [[ ! -d ~/.zgen ]]; then
  git clone https://github.com/tarjoilija/zgen.git .zgen
fi
source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
  zgen prezto
  zgen prezto git
  zgen prezto environment
  zgen prezto tmux
  zgen prezto ssh
  zgen prezto utility
  zgen prezto spectrum
  zgen prezto helper
  zgen prezto fasd
  zgen prezto directory
  zgen prezto completion
  zgen prezto zsh-history-substring-search
  zgen prezto history
  zgen prezto terminal
  zgen prezto command-not-found
  zgen prezto syntax-highlighting
  zgen prezto prompt theme 'steeef'
  zgen save
fi

alias vi="vim"
alias vim="vim"
alias a="tmux attach -d -t"
alias new="tmux new -s"
alias feature="git flow feature"
alias hotfix="git flow hotfix"
alias release="git flow release"
alias gfixed="ghi comment --close -m fixed"
alias gdone="ghi comment --close -m done"
alias gcm='git commit -m'
alias gws='git status'
alias gwd='git diff'
alias gs='git stash'
alias gsp='git stash pop'
alias gp='git push'

export EDITOR="vi"
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="/usr/local/opt/android-sdk/platform-tools:$PATH"
export ANDROID_HOME=/usr/local/opt/android-sdk

export PATH="$HOME/.yarn/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$HOME/.linuxbrew/bin:$PATH"
bindkey -e

export GHI_TOKEN="d9f0d2731c6f427d2c0f63708825cd5e1a253eaa"
