git config --global user.email "nfauconn@student.42.fr"
git config --global user.name "no3"

git clone git@github.com:nfauconn/CONFiiG.git

#default apps
rm .profile && ln -s CONFiiG/manjaro/.profile .profile

#i3
rm -rf .i3/config && ln -s CONFiiG/manjaro/.i3/config .i3/config

#go to .config dir
cd .config

#terminator
yay -S terminator
pip install requests
mkdir -p $HOME/.config/terminator/plugins
wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"
rm -rf terminator && ln -s CONFiiG/manjaro/.config/terminator terminator

#neovim
yay -S neovim nvim-packer-git unzip
rm -rf nvim && ln -s CONFiiG/manjaro/.config/nvim nvim

#go back to home
cd ..

#inception
yay -S docker docker-buildx
gcl git@github.com:nfauconn/inception.git
sudo systemctl start docker.service
sudo systemctl start docker.socket
sudo systemctl enable docker.service
sudo systemctl enable docker.socket
sudo groupadd docker
sudo usermod -aG docker $USER
echo "install ok. please delog & relog to complete"
