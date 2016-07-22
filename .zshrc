if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi
source ~/.zplug/init.zsh

zplug "sorin-ionescu/prezto",\
	hook-build:"ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto ~/.zprezto && ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto/runcoms/zpreztorc ~/.zpreztorc",\
	use:init.zsh
zplug check || zplug install
zplug load

alias vi="vim"
alias vim="nvim"
alias a="tmux attach -d -t"
alias n="tmux new -s"
alias feature="git flow feature"
alias hotfix="git flow hotfix"
alias release="git flow release"
alias fixed="ghi comment --close -m fixed"

export EDITOR="nvim"
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="/usr/local/opt/android-sdk/platform-tools:$PATH"
export ANDROID_HOME=/usr/local/opt/android-sdk
