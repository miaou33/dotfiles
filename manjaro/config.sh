#::::::::::::::::::::::::::::::::::::::::::::::::::::: PACKAGES

yay -S bat exa neovim nvim-packer-git unzip docker docker-buildx docker-compose

yay -S terminator
pip install requests
mkdir -p $HOME/.config/terminator/plugins
wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"
echo "\n\nThemes for terminator installed !!\n\n"


#::::::::::::::::::::::::::::::::::::::::::::::::::::: CONFIG

git config --global user.email "nfauconn@student.42.fr"
git config --global user.name "no3"

cd $HOME

mv $HOME/.profile $HOME/.profile.bak && ln -s $HOME/dotfiles/manjaro/.profile .profile
mv $HOME/.zshrc $HOME/.zshrc.bak && ln -s $HOME/dotfiles/manjaro/.zshrc .zshrc

cd $HOME/.config

mv $HOME/.i3/config $HOME/.i3/config.bak && cd .i3 && ln -s $HOME/dotfiles/manjaro/.i3/config config 
mv $HOME/.config/terminator $HOME/.config/terminator.bak && ln -s $HOME/dotfiles/manjaro/.config/terminator terminator
ln -s $HOME/dotfiles/manjaro/.config/nvim nvim

cd $HOME

#inception
gcl git@github.com:nfauconn/inception.git
sudo systemctl start docker.service
sudo systemctl start docker.socket
sudo systemctl enable docker.service
sudo systemctl enable docker.socket
sudo usermod -aG docker $USER

echo "install ok. please delog & relog to complete"
