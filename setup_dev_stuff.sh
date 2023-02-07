echo "setup sdkman"
curl -s "https://get.sdkman.io" | bash

echo "language server lua"
brew install lua-language-server


echo "pyenv"
pyenv install 3
pyenv global 3

echo "Poetry"
curl -sSL https://install.python-poetry.org | python3 -

