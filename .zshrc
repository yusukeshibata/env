# zgen
if [[ ! -d ~/.zgen ]]; then
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi
source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then
  zgen prezto
  zgen prezto git
  zgen prezto ssh
  zgen prezto gpg
  zgen prezto utility
  zgen prezto history
  zgen oh-my-zsh plugins/ssh-agent
  zstyle :omz:plugins:ssh-agent agent-forwarding on
  zgen load mafredri/zsh-async
  zgen sindresorhus/pure
  zgen save
fi

prompt pure

bindkey -e
export LANG=en_US.UTF-8
export EDITOR="vi"

alias ls="exa"
alias a="tmux attach -d -t"
alias new="tmux new -s"
alias feature="git flow feature"
alias hotfix="git flow hotfix"
alias release="git flow release"
alias open="explorer.exe"
alias vi="nvim"
alias vim="nvim"

export PYENV_ROOT="$HOME/.pyenv"
export GPG_TTY=$(tty)
export LIBGL_ALWAYS_INDIRECT=0
export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0.0

export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fdfind --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# eval "$(pyenv init -)"
# eval "$(rbenv init -)"
# source $HOME/.cargo/env

