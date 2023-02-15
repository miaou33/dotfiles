#ENABLE TRIM to take care of SSD
#echo "${boldlightgreen}ENABLING TRIM${boldlightgrey}"
#echo "sudo systemctl enable fstrim.timer"
#echo "sudo systemctl start fstrim.timer"
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

               	 install arch linux base meta-packages                    #
###############################################################################

#meta-package = a package that installs other packages (through the dependencies that he defines)

#core is the minimal package set to define a basic Arch Linux install
pacman -Syu core

#base-devel installs gnu utilities, some useful libs like libtool, and other indispensable
#packages like sudo or gcc
pacman -Syu base-devel


###############################################################################
#							install packages								  #
###############################################################################

#install man pages : $ man <cmd> to know how this cmd works, what options does it have
pacman -Syu man-db 

#install git
pacman -Syu git

#install coding tools
pacman -Syu valgrind 






#bumblebee-status sensors2 pasink pasource powerline powerline-fonts pango
#install all existent fonts so u have a lot of them in once
#pacman -Syu all-repository-fonts
