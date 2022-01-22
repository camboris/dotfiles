#!/bin/sh

echo "Instalando Brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


echo "neovim"
brew install neovim
# brew install ctags
brew install tree-sitter


echo "file utils"
brew install ranger
brew install stow
brew install unrar
# brew install vifm
brew install bat
brew install glow


echo "git utils"
# brew install tig
brew install lazygit


echo "greppers"
brew install the_silver_searcher
brew install ripgrep
brew install fzf

echo "graficos"
brew install graphviz

echo "fuentes"
brew tap homebrew/cask-fonts
brew install font-fira-code
