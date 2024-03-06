```sh
timedatectl set-ntp true
timedatectl set-timezone Europe/Paris
cfdisk /dev/sda
```
- partition EFI: 1Go, type EFI system
- partition swap: 32Go, type Linux swap
- partition racine: le reste (environ 150Go), type Linux Filesystem

```sh
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3

mount --mkdir /dev/sda1 /mnt/boot
swapon /dev/sda2
mount /dev/sda3 /mnt

reflector --country France --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

pacman-key --init
pacman-key --populate archlinux

pacstrap /mnt 	base \
				linux \
				linux-firmware \
				base-devel \
				vim

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
```

```sh
[chroot]# sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
[chroot]# locale-gen
[chroot]# echo LANG=en_US.UTF-8 > /etc/locale.conf

[chroot]# ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
[chroot]# hwclock --systohc

[chroot]# echo <hostname> > /etc/hostname
[chroot]# echo "127.0.0.1 localhost\n::1 localhost\n" >> /etc/hosts

[chroot]# passwd

[chroot]# pacman -S grub efibootmgr
[chroot]# grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
[chroot]# grub-mkconfig -o /boot/grub/grub.cfg

[chroot]# useradd -m -G wheel -s /bin/bash <username>
[chroot]# passwd <username>

[chroot]# pacman -S sudo
[chroot]# sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers

[chroot]# pacman -S networkmanager
[chroot]# systemctl enable NetworkManager

[chroot]# exit
```

```sh
umount -R /mnt
swapoff -a
reboot
```