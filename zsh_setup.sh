ln -s ~/.vimrc ~/configs/.vimrc

echo 'Installing oh-my-zsh...'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo 'Updating .zshrc...'
echo 'export ZDOTDIR="$HOME/configs/zsh"' >> ~/.zshrc
echo 'source "$HOME/configs/zsh/.zshrc"' >> ~/.zshrc
echo '.zshrc updated - check it and source it before use'
