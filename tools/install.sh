#! /bin/bash

echo " "
echo "+++++++++++++++++++++++++++++++++++++++"
echo "++++++++++ Starting installer.... +++++"
echo "+++++++++++++++++++++++++++++++++++++++"
echo " "

export DOTFILES=$HOME/.dotfiles

if [[ -d ~/code ]]; then
    export CODE_DIR=~/code
fi


# =======================================
# ========= OS dependencies =============
# =======================================
if [ "$(uname)" == "linux-gnu" ]; then
    echo "\n\nRunning on Linux"
    source apt.sh
fi

if [ "$(uname)" == "Darwin" ]; then
    echo "\n\nRunning on OSX"
    source brew.sh
    source osx.sh
fi

echo "Initializing submodule(s)"
git submodule update --init --recursive

#=======================================
#========= Dotfiles +===================
#=======================================
DIR="$HOME/.dotfiles"

if [ ! -d $DIR ]
then
    echo "set symlink for dotfiles"
    ln -s $CODE_DIR/dotfiles $HOME/.dotfiles
fi

#=======================================
#========= ZSHRC =======================
#=======================================
FILE="$HOME/.zshrc"

if [ -f $FILE ]; then
    #  echo "File $FILE exists."
    echo "zshrc file was already installed...skipping"
else
    #  echo "$FILE File created"
    echo "zshrc file has been installed"
    # Symlink the .zshrc file that makes sure the config works
    ln -s $DOTFILES/zsh/.zshrc $HOME
fi

#=======================================
#========= oh-my-vim ===================
# 
# when switching to neovim
# curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#=======================================
DIR="$DOTFILES/oh-my-vim"

if [ ! -d $DIR ]
then
    echo "Vim symlinked"
    ln -s $DOTFILES/oh-my-vim/ $HOME/.vim
fi

#=======================================
#========= Vim Vundle ==================
#=======================================
DIR="$HOME/.vim/bundle/Vundle.vim"

# Check if the Vundle dir is emtpy (it should be)
if [ "$(ls -A $DIR)" ]; then
    # We install all plugins that are specified in
    # .oh-my-vim/config/plugins.vim just to make sure.
    # echo "$DIR directory not empty"
    echo "All Vundle plugins have been installed...skipping"
    # Make sure we install all plugins
    vim +PluginInstall +qall
else
    # If the dir is empty (as it should be)
    # Get Vundle.
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    # We install all plugins that are specified in
    # .oh-my-vim/config/plugins.vim
    vim +PluginInstall +qall
fi

#=======================================
#========= VIMRC =======================
#=======================================
FILE="$HOME/.vimrc"

if [ -f $FILE ]; then
    #  echo "File $FILE exists."
    echo "Vimrc was already installed....skipping"
else
    #  echo "$FILE File created"
    echo "Vimrc has been installed."
    # Symlink the .vimrc file that makes sure the config works
    ln -s $DOTFILES/oh-my-vim/.vimrc $HOME
fi

#=======================================
#========= TMUX  TPM ===================
#=======================================
DIR="$HOME/.tmux/plugins/tpm"

# Check if the tmux dir is emtpy (it should be)
if [ "$(ls -A $DIR)" ]; then
    # if we have TPM already we skip it.
    echo "TPM has been installed...skipping"
else
    # if we don't have TPM we install it.
    echo "TPM has been installed"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

#=======================================
#========= TMUX Conf ===================
#=======================================
FILE="$HOME/.tmux.conf"

if [ -f $FILE ]; then
    #  echo "File $FILE exists."
    echo "Tmux.conf was already installed....skipping"
else
    #  echo "$FILE File created"
    echo "Tmux.conf has been installed."
    # Symlink the .tmux.conf file that makes sure the config works
    ln -s $DOTFILES/tmux/.tmux.conf $HOME
fi

echo '________          __    _____.__.__                 '
echo '\______ \   _____/  |__/ ____\__|  |   ____   ______'
echo ' |    |  \ /  _ \   __\   __\|  |  | _/ __ \ /  ___/'
echo ' |    `   (  (_) )  |  |  |  |  |  |_\  ___/ \___ \ '
echo '/_______  /\____/|__|  |__|  |__|____/\____) ______)'
echo '.... have been installed!'
echo ''
echo ''
echo 'Please look over the ~dotfiles/zsh/config, tmux.conf  and ~/.vim folders to select plugins, themes, and options.'
