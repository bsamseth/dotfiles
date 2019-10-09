#!/bin/sh

./bootstrap.sh  # Move all dotfiles into $HOME.

# Oh my zsh
# Attempt to set zsh as default shell. If this does not work, see https://www.google.com/search?q=zsh+default+without+chsh
chsh -s $(which zsh)
# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# Get the powerlevel10k zsh theme:
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
# zsh syntax highlighting requires this repo to be in the custom folder. This does the trick.
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Tmux powerline
git clone https://github.com/bsamseth/tmux-powerline.git
mv tmux-powerline ~/.tmux-powerline

# Bash insulter
sudo cp bash.command-not-found /etc/bash.command-not-found

echo "For command insults to work properly"
echo "do:  sudo apt install lolcat cowsay"

