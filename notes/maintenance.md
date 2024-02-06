


```shell
sudo reflector --country France --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

- `--country France` assure que seuls les miroirs situés en France sont considérés.
- `--age 12` filtre les miroirs pour ne garder que ceux qui ont été synchronisés dans les dernières 12 heures.
- `--protocol https` choisit les miroirs qui supportent le protocole HTTPS pour une connexion sécurisée.
- `--sort` rate trie les miroirs selon leur vitesse (bande passante).
- `--save` /etc/pacman.d/mirrorlist sauvegarde la liste des miroirs dans le fichier mirrorlist.