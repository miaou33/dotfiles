## Verifier que le système de demarrage est bien en UEFI

```
ls /sys/firmware/efi/efivars
```
Si la commande retourne des fichiers, alors le système est en UEFI.

La différence entre UEFI (Unified Extensible Firmware Interface) et BIOS (Basic Input/Output System) réside principalement dans leurs capacités, leur architecture et leur méthode de démarrage du système.
1. **Architecture et capacités** : UEFI est le successeur du BIOS traditionnel et offre une architecture plus moderne. Il supporte des disques durs de grande taille (plus de 2 To) grâce à la table de partitionnement GUID (GPT), alors que le BIOS est limité par le MBR (Master Boot Record) qui ne supporte que des disques jusqu'à 2 To.
2. **Interface et fonctionnalités** : L'UEFI offre une interface utilisateur graphique (GUI) qui peut être manipulée à la souris, contrairement au BIOS qui se base uniquement sur le clavier. UEFI offre également des fonctionnalités avancées comme le démarrage sécurisé, la réparation automatique, et la compatibilité réseau pour le téléchargement ou la mise à jour du firmware directement depuis l'interface.
3. **Démarrage** : UEFI permet le démarrage depuis des fichiers exécutables situés sur une partition système EFI, ce qui améliore la flexibilité et la sécurité du processus de démarrage. Le BIOS, quant à lui, charge l'amorceur depuis le premier secteur du disque dur.
En résumé, UEFI offre une meilleure compatibilité matérielle, plus de fonctionnalités, et une meilleure sécurité par rapport au BIOS traditionnel. Pour une nouvelle installation comme Arch Linux, il est généralement recommandé d'utiliser le mode UEFI si votre matériel le supporte.


## Connection au reseau (passer si ```ping -c 3 archlinux.org``` fonctionne)

1. Entrer dans le mode interactif de iwd (iNet Wireless Daemon) pour se connecter à un réseau wifi
    ```
    root@archisto ~ # iwctl
    ```

2. Trouver la carte réseau
    ```
    [iwd]# device list
    ```

3. Connecter la carte réseau à un réseau wifi
    ```
    [iwd]# station <device> scan
    [iwd]# station <device> get-networks
    [iwd]# station <device> connect <SSID>
    ```
    > SSID = Service Set Identifier (nom du réseau wifi)

4. Quittez le mode interactif

## Mise à jour de l'horloge système

```
root@archisto ~ # timedatectl set-ntp true
```
Cette commande active le service NTP (Network Time Protocol) pour synchroniser l'horloge système avec un serveur NTP.

```
root@archisto ~ # timedatectl set-timezone Europe/Paris
root@archisto ~ # timedatectl status
```

## Partitionnement du disque

1. Vérifier les disques disponibles
    ```
    root@archisto ~ # fdisk -l
    ```
2. Lancer cfdisk pour partitionner le disque
    ```
    root@archisto ~ # cfdisk /dev/sda
    ```
3. Selectionner le type de table de partitionnement

Une table de partitionnement (label type ou partition table) est une structure de données qui décrit les partitions d'un disque dur.
- **MBR (Master Boot Record)** : table de partitionnement de BIOS, limitée à 2 To.
- **GPT (GUID Partition Table)** : table de partitionnement de UEFI, supporte les disques de grande taille, effectue une sauvegarde de la table de partitionnement à la fin du disque, et autres fonctionnalités plus complexes que MBR.

**Navigation**: Utiliser les flèches pour se déplacer, et les touches `Enter` et `Tab` pour sélectionner et valider. Les espaces non alloués sont représentés par des `Free Space`.

4. Créer les partitions
    - **Partition de démarrage EFI** : 512 Mo, type EFI System
    - **Partition swap** : 32 Go, type Linux swap
    - **Partition racine** : Le reste de l'espace, type Linux filesystem

[ Write ] pour valider les changements, puis [ Quit ] pour quitter cfdisk.

## Formatage des partitions

Verifier les partitions créées
```
root@archisto ~ # lsblk
```

1. Formater la partition de démarrage EFI
    ```
    root@archisto ~ # mkfs.fat -F32 /dev/<partition_boot>
    ```
2. Formater la partition swap
    ```
    root@archisto ~ # mkswap /dev/<partition_swap>
    root@archisto ~ # swapon /dev/<partition_swap>
    ```
3. Formater la partition racine
    ```
    root@archisto ~ # mkfs.ext4 /dev/<partition_racine>
    ```
## Monter les partitions



## MAJ du système de clés

```
root@archisto ~ # pacman-key --init
root@archisto ~ # pacman-key --populate archlinux
```

