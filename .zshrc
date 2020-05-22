# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi
source ~/.zplug/init.zsh

zplug modules/git, from:prezto
zplug modules/environment, from:prezto
zplug modules/tmux, from:prezto
zplug modules/ssh, from:prezto
zplug modules/utility, from:prezto
zplug modules/spectrum, from:prezto
zplug modules/helper, from:prezto
zplug modules/directory, from:prezto
zplug modules/completion, from:prezto
zplug modules/history, from:prezto
zplug modules/terminal, from:prezto
zplug modules/command-not-found, from:prezto
zplug modules/syntax-highlighting, from:prezto
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
zplug plugins/ssh-agent,   from:oh-my-zsh
zplug plugins/npx,   from:oh-my-zsh

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

export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export ANDROID_HOME=$HOME/Library/Android
export ANDROID_SDK_ROOT=$ANDROID_HOME/sdk
export NDK_ROOT=$HOME/Library/Android/sdk/ndk-bundle
export ANT_ROOT=/usr/local/opt/ant/bin
export PATH=$HOME/.nodebrew/current/bin:$PATH

source $HOME/proj/emsdk/emsdk_env.sh --build=Release >> /dev/null 2>&1
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="$HOME/platform-tools:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# eval "$(starship init zsh)"
export GPG_TTY=$(tty)

# rbenv
eval "$(rbenv init -)"

# nvim
alias vi="nvim"
alias vim="nvim"
