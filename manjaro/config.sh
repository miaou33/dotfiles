git config --global user.email "nfauconn@student.42.fr"
git config --global user.name "no3"
git clone git@github.com:nfauconn/CONFiiG.git
rm -rf .i3/config && ln -s CONFiiG/manjaro/.i3/config .i3/config
cd .config
rm -rf terminator && ln -s CONFiiG/manjaro/.config/terminator terminator
rm -rf nvim && ln -s CONFiiG/manjaro/.config/nvim nvim

