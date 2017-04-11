[[ ! -d ~/.zgen ]] && git clone https://github.com/tarjoilija/zgen.git .zgen
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
  zgen prezto history
  zgen prezto terminal
  zgen prezto command-not-found
  zgen prezto syntax-highlighting
  zgen load mafredri/zsh-async
  zgen load sindresorhus/pure
  zgen save
fi

prompt pure

alias vi="vim"
alias vim="nvim"
alias a="tmux attach -d -t"
alias new="tmux new -s"
alias feature="git flow feature"
alias hotfix="git flow hotfix"
alias release="git flow release"
alias gfixed="ghi comment --close -m fixed"
alias gdone="ghi comment --close -m done"
alias gcm="git commit -a -S -m"

export EDITOR="vi"
export PATH="/usr/local/opt/android-sdk/platform-tools:$PATH"
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export ANDROID_HOME=/usr/local/opt/android-sdk

export PATH="$HOME/.yarn/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$HOME/.linuxbrew/bin:$PATH"
bindkey -e
export LANG=en_US.UTF-8

[ -z "$SSH_AUTH_SOCK" ] && eval `ssh-agent -s`
ssh-add "$HOME/.ssh/id_rsa" > /dev/null 2>&1

# install

check() {
  command -v $1 >/dev/null 2>&1
}
_install() {
  echo "-> Installing $2..."
  HOMEBREW_NO_AUTO_UPDATE=1 brew install $1
}
install() {
  [[ -z $2 ]] && c="$1" || c="$2"
  check brew && check $1 || _install $c $1
}

# brew
check brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# check brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"

# others
install nodebrew
install nvim neovim/neovim/neovim
install git-flow
install tmux
