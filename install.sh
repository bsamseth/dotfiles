#!/bin/sh

./bootstrap.sh  # Move all dotfiles into $HOME.

BREWED="aircrack-ng ant homebrew/science/armadillo aspell homebrew/boneyard/clang-omp cmatrix paulp/extras/coursier cowsay crunch exiftool figlet fortune gcc ghc ghostscript gnupg gnupg2 grep gsl ifstat imagemagick ispell lcov libsass macvim homebrew/science/matplotlib mit-scheme multimarkdown node open-mpi perl pypy3 python python3 qcachegrind rainbarf reattach-to-user-namespace reaver rmtrash ruby scipy stockfish homebrew/science/superlu43 tmux trash tree uncrustify utf8proc valgrind vim watch wget zeromq zsh zsh-completions zsh-syntax-highlighting neovim/neovim/neovim"


if [[ $OSTYPE == darwin* ]]; then
    # Install brew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # Install a bunch of things
    brew install "$BREWED"
else
    # Assumed to be on linux. Try to apt install the stuff.
    sudo apt install "$BREWED"
fi


# Oh my zsh
# Attempt to set zsh as default shell. If this does not work, see https://www.google.com/search?q=zsh+default+without+chsh
chsh -s $(which zsh)
# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# zsh syntax highlighting requires this repo to be in the custom folder. This does the trick.
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


# Tmux powerline
git clone https://github.com/bsamseth/tmux-powerline.git
mv tmux-powerline ~/.tmux-powerline
