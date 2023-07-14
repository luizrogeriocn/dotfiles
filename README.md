# .dotfiles

Paste this into terminal if you are luizrogeriocn :)

```bash
bash -c "$(curl -#fL https://raw.githubusercontent.com/luizrogeriocn/.dotfiles/main/install)"
```

For the time being this only downloads the repository and creates symlinks for the files.
I still need to add the instalation of my most used packages (listed below).

---

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
