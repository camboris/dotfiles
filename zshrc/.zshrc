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

#  limit how much of history to download
zinit ice depth=1
# Load pure theme
zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
zinit light sindresorhus/pure

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# vi mode
# conflcts with zsh-history-substring-search
# zinit light jeffreytse/zsh-vi-mode

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
# export GONOPROXY="github.com/mercadolibre,github.com/melisource"
export GOPROXY='https://proxy.golang.org,direct'
export GOPRIVATE="github.com/mercadolibre,github.com/melisource"

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

export RANGER_FURY_LOCATION=/Users/mpozzo/.fury #Added by Fury CLI
export RANGER_FURY_VENV_LOCATION=/Users/mpozzo/.fury/fury_venv #Added by Fury CLI

# Added by Fury CLI installation process
declare FURY_BIN_LOCATION="/Users/mpozzo/.fury/fury_venv/bin" # Added by Fury CLI installation process
export PATH="$PATH:$FURY_BIN_LOCATION" # Added by Fury CLI installation process
# Added by Fury CLI installation process

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Added by Windsurf
export PATH="/Users/mpozzo/.codeium/windsurf/bin:$PATH"
