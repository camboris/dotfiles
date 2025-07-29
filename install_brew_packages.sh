#!/bin/sh

echo "Instalando Brew"
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


echo "neovim"
brew install --HEAD neovim
# brew install ctags
brew install tree-sitter


echo "file utils"
brew install ranger
brew install stow
# brew install unrar # no existe?
# brew install vifm
brew install bat
brew install glow
# brew install marksman # no lo encuentra, falta un comando?


echo "git utils"
# brew install tig
brew install lazygit


echo "greppers"
brew install the_silver_searcher
brew install ripgrep
brew install fzf
brew install fd
brew install zoxide

echo "graficos"
brew install graphviz
brew install plantuml
brew install mermaid-cli

echo "fuentes"
brew tap homebrew/cask-fonts
# brew install font-symbols-only-nerd-font
brew install font-fira-code
brew install font-jetbrains-mono
brew install font-Fira-Code-nerd-font
# brew install font-jetbrains-mono-nerd-font

echo "terminales"
# brew install kitty
brew install wezterm
# brew install tmux

echo "desarrollo"
brew install go
brew install pyenv
brew install fnm
brew install jq
brew install httpie

echo "otros"
brew install yacreader
brew install calibre
brew install rectangle

