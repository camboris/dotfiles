# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="random"
ZSH_THEME="agnoster"

#alias pcu="packer-color -Syu"
#alias pcs="packer-color -Ss"
#alias pci="packer-color -S"

#plugins=(git python django virtualenv virtualenvwrapper pip pyenv archlinux)
plugins=(git python django virtualenvwrapper pip archlinux)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:/opt/java/bin:/home/boris/.gem/ruby/2.3.0/bin:/home/boris/dev/android-sdk/tools:/home/boris/dev/android-sdk/platform-tools"
export ANDROID_HOME=~/dev/android-sdk

export WORKON_HOME=~/.virtualenvs
source /usr/bin/virtualenvwrapper.sh

#export NVIM_TUI_ENABLE_TRUE_COLOR=1
#export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

#rutas flex
#export PLAYERGLOBAL_HOME=/opt/apache-flex-sdk/player
#export PATH="${PATH}":/opt/apache-flex-sdk/bin

source ~/dev/k/k.sh

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
#if [[ "$SSH_AGENT_PID" == "" ]]; then
    #eval "$(<~/.ssh-agent-thing)"
#fi

