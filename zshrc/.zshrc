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
alias ci='rm -rf node_modules package-lock.json && npm i'

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

# Added by Python Dev Environment Installer
export HOMEBREW_BIN_LOCATION="/opt/homebrew/bin"
export PATH="$HOMEBREW_BIN_LOCATION:$PATH"
# Added by Python Dev Environment Installer
export ANTHROPIC_MODEL="claude-sonnet-4-6[1m]"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# >>> es-wrapper initialize >>>
# Agregado automáticamente por el instalador de es-wrapper
# Para desinstalar, ejecuta: ~/.es-wrapper/uninstall.sh
export PATH="$HOME/.es-wrapper/bin:$PATH"

unalias source 2>/dev/null
unalias . 2>/dev/null
source() {
    builtin source "$@"
    local ret=$?
    if [[ -n "$VIRTUAL_ENV" ]]; then
        export PATH="$HOME/.es-wrapper/bin:$PATH"
    fi
    return $ret
}
alias .='source'

_es_wrapper_guard() {
    case ":$PATH:" in
        *":$HOME/.es-wrapper/bin:"*)
            if [[ "$PATH" != "$HOME/.es-wrapper/bin:"* ]]; then
                export PATH="$HOME/.es-wrapper/bin:${PATH//$HOME\/.es-wrapper\/bin:/}"
            fi
            ;;
        *)
            export PATH="$HOME/.es-wrapper/bin:$PATH"
            ;;
    esac
}
precmd_functions+=(_es_wrapper_guard)
# <<< es-wrapper initialize <<<

# Internal Python Registry
export PIP_INDEX_URL='https://pypi.artifacts.furycloud.io/simple'
export UV_INDEX_URL='https://pypi.artifacts.furycloud.io/simple'

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

# Added by git-ai installer on Tue Jul 21 15:33:44 CST 2026
export PATH="/Users/mpozzo/.git-ai/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"

export PATH="$HOME/.fury/fury_venv/bin:$PATH"
