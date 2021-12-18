# .dotfiles

Install AG (the silversearcher)
apt-get install silversearcher-ag

Install FDFIND
sudo apt-get install fd-find

Install FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

Install ZSH
sudo apt-get install zsh

Make it your default shell
chsh -s $(which zsh)

Install OhMyZsh
export ZSH="/home/roger/.oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

Create symbolic link to vimrc with
ln -s /home/roger/.dotfiles/.vimrc /home/roger/.vimrc

Create Symbolic link to gitconfig
ln -s /home/roger/.dotfiles/.gitconfig /home/roger/.gitconfig

Create symbolic link to zshrc
ln -s /home/roger/.dotfiles/.zshrc /home/roger/.zshrc
