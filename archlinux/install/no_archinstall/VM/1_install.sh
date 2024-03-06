#!/bin/bash

# !!!!!!!!!!!!!!!!!!!!
# ATTENTION: SI PAS SUR VM, SE CONNECTER A INTERNET AVANT DE LANCER CE SCRIPT
# Verifier egalement que le systeme est bien en UEFI.
# Cf markdown.
# !!!!!!!!!!!!!!!!!!!!

# Mise à jour de l'horloge système et définition du fuseau horaire
timedatectl set-ntp true
timedatectl set-timezone Europe/Paris

############################################
# Partitionnement du disque dur			   #
############################################

# Création d'une nouvelle table de partitions GPT
parted /dev/sda -- mklabel gpt

# Création de la partition EFI
parted /dev/sda -- mkpart primary 1MiB 1GiB
parted /dev/sda -- set 1 esp on

# Création la partition swap
parted /dev/sda -- mkpart primary 1GiB 33GiB

# Création de la partition racine
parted /dev/sda -- mkpart primary 33GiB 100%

# Formatage des partitions
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 /dev/sda3

# Montage des partitions
mount --mkdir /dev/sda1 /mnt/boot/EFI
swapon /dev/sda2
mount /dev/sda3 /mnt

############################################
# Installation du système de base		   #
############################################

# Tri des miroirs
reflector --country France --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# Mise à jour des clés
pacman-key --init
pacman-key --populate archlinux

# Installation du système de base
pacstrap /mnt base linux linux-firmware base-devel

# Génération du fichier fstab
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot dans le système installé
arch-chroot /mnt
