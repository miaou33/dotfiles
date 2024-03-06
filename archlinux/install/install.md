## Verifier que le système de demarrage est bien en UEFI

```sh
ls /sys/firmware/efi/efivars
```
Si la commande retourne des fichiers, alors le système est en UEFI.

La différence entre UEFI (Unified Extensible Firmware Interface) et BIOS (Basic Input/Output System) réside principalement dans leurs capacités, leur architecture et leur méthode de démarrage du système.
1. **Architecture et capacités** : UEFI est le successeur du BIOS traditionnel et offre une architecture plus moderne. Il supporte des disques durs de grande taille (plus de 2 To) grâce à la table de partitionnement GUID (GPT), alors que le BIOS est limité par le MBR (Master Boot Record) qui ne supporte que des disques jusqu'à 2 To.
2. **Interface et fonctionnalités** : L'UEFI offre une interface utilisateur graphique (GUI) qui peut être manipulée à la souris, contrairement au BIOS qui se base uniquement sur le clavier. UEFI offre également des fonctionnalités avancées comme le démarrage sécurisé, la réparation automatique, et la compatibilité réseau pour le téléchargement ou la mise à jour du firmware directement depuis l'interface.
3. **Démarrage** : UEFI permet le démarrage depuis des fichiers exécutables situés sur une partition système EFI, ce qui améliore la flexibilité et la sécurité du processus de démarrage. Le BIOS, quant à lui, charge l'amorceur depuis le premier secteur du disque dur.
En résumé, UEFI offre une meilleure compatibilité matérielle, plus de fonctionnalités, et une meilleure sécurité par rapport au BIOS traditionnel. Pour une nouvelle installation comme Arch Linux, il est généralement recommandé d'utiliser le mode UEFI si votre matériel le supporte.


## Connection au reseau (passer si `ping -c 3 archlinux.org` fonctionne)

1. Entrer dans le mode interactif de iwd (iNet Wireless Daemon) pour se connecter à un réseau wifi
    ```sh
    iwctl
    ```

2. Trouver la carte réseau
    ```sh
    [iwd]# device list
    ```

3. Connecter la carte réseau à un réseau wifi
    ```sh
    [iwd]# station <device> scan
    [iwd]# station <device> get-networks
    [iwd]# station <device> connect <SSID>
    ```
    > SSID = Service Set Identifier (nom du réseau wifi)

4. Quitter le mode interactif

## Mise à jour de l'horloge système

```sh
timedatectl set-ntp true
```
Cette commande active le service NTP (Network Time Protocol) pour synchroniser l'horloge système avec un serveur NTP.

```sh
timedatectl set-timezone Europe/Paris
timedatectl status
```

## Partitionnement du disque

1. Vérifier les disques disponibles
    ```sh
    fdisk -l
    ```
2. Lancer cfdisk pour partitionner le disque
    ```sh
    cfdisk /dev/sda
    ```
3. Selectionner le type de table de partitionnement

Une table de partitionnement (label type ou partition table) est une structure de données qui décrit les partitions d'un disque dur.
- **MBR (Master Boot Record)** : table de partitionnement de BIOS, limitée à 2 To.
- **GPT (GUID Partition Table)** : table de partitionnement de UEFI, supporte les disques de grande taille, effectue une sauvegarde de la table de partitionnement à la fin du disque, et autres fonctionnalités plus complexes que MBR.

**Navigation**: Utiliser les flèches pour se déplacer, et les touches `Enter` et `Tab` pour sélectionner et valider. Les espaces non alloués sont représentés par des `Free Space`.

4. Créer les partitions
    - **Partition de démarrage EFI** : 1Go, type EFI System
    - **Partition swap** : 32 Go, type Linux swap
    - **Partition racine** : Le reste de l'espace, type Linux filesystem

[ Write ] pour valider les changements, puis [ Quit ] pour quitter cfdisk.

## Formatage des partitions

Verifier les partitions créées
```sh
lsblk
```

1. Formater la partition de démarrage EFI
    ```sh
    mkfs.fat -F32 /dev/<partition_efi>
    ```
2. Formater la partition swap
    ```sh
    mkswap /dev/<partition_swap>
	```
3. Formater la partition racine
    ```sh
    mkfs.ext4 /dev/<partition_racine>
    ```
## Monter les partitions

En termes de commandes, lorsque vous tapez `mount /dev/sda3 /mnt`, vous dites au système :

- Prenez la partition qui est identifiée par `/dev/sda3`.
- Rendez accessible son contenu au sein du répertoire `/mnt`.

Après avoir exécuté cette commande, si vous allez dans le répertoire `/mnt`, vous verrez tous les fichiers et dossiers qui résident physiquement sur la partition `/dev/sda3`.

1. Monter la partition racine
	```sh
	mount /dev/<partition_racine> /mnt
	```

2. Monter la partition de démarrage EFI

	- Monter la partition de démarrage EFI
		```sh
		mount --mkdir /dev/<partition_boot> /mnt/boot/EFI
		```

3. Activer la partition swap
	```sh
	swapon /dev/<partition_swap>
	```

## Installation du système de base

### Trier les miroirs

`reflector` est un outil qui permet de trier les miroirs en fonction de leur vitesse et de leur fraîcheur. Il est recommandé de trier les miroirs avant d'installer le système de base.

```sh
reflector --country France --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

### MAJ du système de clés

```sh
pacman-key --init
pacman-key --populate archlinux
```

### Installer le système de base


```sh
pacstrap /mnt 	base \
				linux \
				linux-firmware \
				base-devel \
				vim
```


> Pacstrap est l'outil qui permet d'installer les paquets de base d'Arch Linux dans un répertoire cible. Il est utilisé pour installer le système de base sur un disque dur ou une partition.
> Sa difference avec Pacman est que Pacstrap installe les paquets dans un répertoire cible, tandis que Pacman installe les paquets dans le système actuel.

### Générer le fichier fstab

Le fichier fstab (File System Table) est un fichier de configuration qui décrit les partitions et les systèmes de fichiers utilisés par le système. Il est utilisé par le système pour monter automatiquement les partitions au démarrage.

```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

### Changer la racine du système

```sh
arch-chroot /mnt
```

Cela permet de changer la racine du système actuel vers le répertoire `/mnt` qui contient le système de base que nous venons d'installer.

Ainsi,toutes les commandes effectuées après cette étape seront exécutées dans le contexte du système installé sur le disque dur.

## Configuration du système

### Configurer la langue et la localisation

```sh
vim /etc/locale.gen
```
décommenter la ligne `en_US.UTF-8 UTF-8`. Puis générer les locales :

```sh
locale-gen
```

Créer le fichier de configuration locale :
```sh
echo "LANG=en_US.UTF-8" > /etc/locale.conf
```

Exporter la variable d'environnement:
```sh
export LANG=en_US.UTF-8
```

### Configurer le fuseau horaire
  
```sh
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
```
```sh
hwclock --systohc
```

### Configurer le réseau

```sh
echo "<hostname>" > /etc/hostname
```

Ajouter les entrées dans le fichier `/etc/hosts` :
```sh
127.0.0.1 localhost
::1 localhost
```

### Configurer le mot de passe root

```sh
passwd
```

### Installer et configurer le démarrage

```sh
pacman -S grub efibootmgr
```

Installer le chargeur d'amorçage GRUB :
```sh
grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB
```

Générer le fichier de configuration de GRUB :
```sh
grub-mkconfig -o /boot/grub/grub.cfg
```


### Créer un utilisateur

```sh
useradd -m -G wheel -s /bin/bash <username>
```
```sh
passwd <username>
```

### Configurer sudo

```sh
pacman -S sudo
```

Editer le fichier `/etc/sudoers` en décommentant la ligne :
```sh
%wheel ALL=(ALL) ALL
```
Pour permettre aux membres du groupe wheel d'exécuter des commandes en tant que superutilisateur.

### Configurer le réseau

```sh
pacman -S networkmanager
```

Activer le service NetworkManager :
```sh
systemctl enable NetworkManager
```



## Sortie de chroot et redémarrage

```sh
exit
```

```sh
umount -R /mnt
```

```sh
swapoff -a
```

```sh
reboot
```





