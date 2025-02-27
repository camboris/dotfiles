if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Load pure theme
zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
zinit light sindresorhus/pure

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::python
zinit snippet OMZP::poetry
zinit snippet OMZP::dotenv

zinit load zsh-users/zsh-history-substring-search
zinit ice wait atload'_history_substring_search_config'

# Load completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias la='ls -al'
alias vim='nvim'
alias c='clear'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

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

# export PATH="/Users/mpozzo/Library/Python/3.9/bin:$PATH"
export PATH="$HOME/.poetry/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"

eval "$(fnm env --use-on-cd --shell zsh)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --no-rehash - zsh)"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

pokemon-colorscripts -r

# # Path to your oh-my-zsh installation.
# export ZSH="/Users/mpozzo/.oh-my-zsh"
#
# ZSH_THEME="spaceship"
#
# plugins=(
#     git
#     zsh-autosuggestions
#     zsh-syntax-highlighting
#     z
#     python
#     poetry
#     dotenv
#   )
#
# source $ZSH/oh-my-zsh.sh
#
# # User configuration
# SPACESHIP_TIME_SHOW=true
# SPACESHIP_DOCKER_SHOW=false
#
# #System config
# export LC_ALL=en_US.UTF-8
#
# #Alias
# alias fgtcp="fury get-token | grep -E '^[a-z0-9]{64}$' | tr -d '\n' | pbcopy"
# alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
# alias ntu="npm run test:unit"
# alias ntus="npm run test:unit -- -u"
# alias ntuq="npm run test:unit -- --silent"
# alias ntuqo="npm run test:unit -- --silent -o"
# alias ntuo="npm run test:unit -- -o"
#
# # paths
# export PATH="$PATH:$HOME/.local/bin"
#
# # # Go development
# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin
# export GOPROXY="https://proxy.golang.org,direct"
# export GONOPROXY="github.com/mercadolibre"
# export GOPRIVATE="github.com/mercadolibre"
#
# # nordic-doctor
# export NORDIC_DOCTOR_DIR="$HOME/.nordic-doctor"
# export PATH="$NORDIC_DOCTOR_DIR/bin:$PATH"
#
# # export PATH="/Users/mpozzo/Library/Python/3.9/bin:$PATH"
# export PATH="$HOME/.poetry/bin:$PATH"
#
# export PYENV_ROOT="$HOME/.pyenv"
#
# alias fzp="fzf --preview 'bat --color=always {}' --preview-window '~3'"
#
# # fzf
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# bindkey "©" fzf-cd-widget
# export FZF_CTRL_T_OPTS="--height 40% \
# --border sharp \
# --layout reverse \
# --prompt '∷ ' \
# --pointer ▶ \
# --marker ⇒"
# export FZF_CTRL_T_OPTS="--height 40% \
# --border sharp \
# --layout reverse \
# --prompt '∷ ' \
# --pointer ▶ \
# --marker ⇒"
# export FZF_CTRL_T_OPTS="--height 40% \
# --border sharp \
# --layout reverse \
# --prompt '∷ ' \
# --pointer ▶ \
# --marker ⇒"
#
# # fnm node manager en rust
# eval "$(fnm env --use-on-cd)"
#
# # pyenv
# alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi
# #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="/Users/mpozzo/.sdkman"
# [[ -s "/Users/mpozzo/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/mpozzo/.sdkman/bin/sdkman-init.sh"
#
# timezsh() {
#   shell=${1-$SHELL}
#   for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
# }
#
# ## The following line is added by pre-commit
# # export PATH="/Users/mpozzo/Library/Python/3.9/bin:$PATH"
#
# # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
#
# source "$HOME/.sdkman/bin/sdkman-init.sh"
# source "$HOME/.cargo/env"
# pokemon-colorscripts -r
#
