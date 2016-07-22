if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi
source ~/.zplug/init.zsh

zplug "sorin-ionescu/prezto",\
	hook-build:"ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto ~/.zprezto && ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto/runcoms/zpreztorc ~/.zpreztorc",\
	use:"modules/{git,environment,terminal,editor,spectrum,prompt,tmux,command-not-found,osx,homebrew,node,ssh,directory,history,completion}/init.zsh"
zplug "zsh-users/zsh-syntax-highlighting"
zplug check || zplug install
zplug load

source ~/.zprezto/init.zsh
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:load' zmodule 'attr' 'stat'
zstyle ':prezto:load' zfunction 'zargs' 'zmv'
zstyle ':prezto:module:editor' key-bindings 'emacs'
zstyle ':prezto:module:editor' dot-expansion 'yes'
zstyle ':prezto:module:git:status:ignore' submodules 'all'
zstyle ':prezto:module:gnu-utility' prefix 'g'
zstyle ':prezto:module:history-substring-search:color' found ''
zstyle ':prezto:module:history-substring-search:color' not-found ''
zstyle ':prezto:module:history-substring-search' globbing-flags ''
zstyle ':prezto:module:prompt' theme 'sorin'
zstyle ':prezto:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'cursor' \
  'root'
zstyle ':prezto:module:syntax-highlighting' styles \
  'builtin' 'bg=blue' \
  'command' 'bg=blue' \
  'function' 'bg=blue'
zstyle ':prezto:module:terminal' auto-title 'yes'
zstyle ':prezto:module:terminal:window-title' format '%n@%m: %s'
zstyle ':prezto:module:terminal:tab-title' format '%m: %s'
zstyle ':prezto:module:tmux:auto-start' local 'no'

#
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
