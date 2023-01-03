# Path to your oh-my-zsh installation.
export ZSH="/Users/mpozzo/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    z
    python
    poetry
  )

source $ZSH/oh-my-zsh.sh

# User configuration
SPACESHIP_TIME_SHOW=true
SPACESHIP_DOCKER_SHOW=false

#System config
export LC_ALL=en_US.UTF-8

#Alias
alias fgtcp="fury get-token | grep -E '^[a-z0-9]{64}$' | tr -d '\n' | pbcopy"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias ntu="npm run test:unit"
alias ntus="npm run test:unit -- -u"
alias ntuq="npm run test:unit -- --silent"
alias ntuqo="npm run test:unit -- --silent -o"
alias ntuo="npm run test:unit -- -o"

# paths
export PATH="$PATH:$HOME/.local/bin"

# # Go development
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GOPROXY="https://proxy.golang.org,direct"
export GONOPROXY="github.com/mercadolibre"
export GOPRIVATE="github.com/mercadolibre"

# nordic-doctor
export NORDIC_DOCTOR_DIR="$HOME/.nordic-doctor"
export PATH="$NORDIC_DOCTOR_DIR/bin:$PATH"

export PATH="/Users/mpozzo/Library/Python/3.9/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

#brew
eval "$(/usr/local/bin/brew shellenv)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fnm node manager en rust
eval "$(fnm env --use-on-cd)"
# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/mpozzo/.sdkman"
[[ -s "/Users/mpozzo/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/mpozzo/.sdkman/bin/sdkman-init.sh"

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}
