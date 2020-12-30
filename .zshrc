# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi
source ~/.zplug/init.zsh

zplug modules/git, from:prezto
zplug modules/ssh, from:prezto
zplug modules/gpg, from:prezto
zplug modules/utility, from:prezto
zplug modules/history, from:prezto
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
zplug plugins/ssh-agent, from:oh-my-zsh
zstyle :omz:plugins:ssh-agent agent-forwarding on

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

zplug load

bindkey -e
export LANG=en_US.UTF-8
export EDITOR="vi"

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
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="$HOME/platform-tools:$PATH"

eval "$(pyenv init -)"
eval "$(rbenv init -)"

source $HOME/.cargo/env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fdfind --type f'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
