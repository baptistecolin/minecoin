# Scripts
Scripts utiles, pour ne pas se casser la tête en tapant des lignes de commande à rallonge.

NB : ces scripts sont loin d'être exhaustifs, Geth permet de faire beaucoup de choses. Pour en avoir un aperçu, taper `$ geth --help`, ou [consulter la doc de Geth](https://github.com/ethereum/go-ethereum/wiki)

### Liste

  * `init.sh` : met en place les préparations nécessaires avant de pouvoir se connecter à la blockchain Minecoin.
  * `launch_sync.sh` : lance Geth avec les paramètres nécessaires pour se connecter à la blockchain Minecoin. Geth ne fera que se synchroniser avec les autres peers.
  * `launch_console.sh` : lance Geth avec les paramètres nécessaires pour se connecter à la blockchain Minecoin. La console Javascript de Geth sera ouverte et la synchronisation se fera automatiquement.
  * `launch_mining.sh` : lance Geth avec les paramètres nécessaires pour se connecter à la blockchain Minecoin. En plus de la synchronisation, votre peer s'emploiera à miner.
  * `launch_mining_console.sh` : lance Geth avec les paramètres nécessaires pour se connecter à la blockchain Minecoin. En plus de la synchronisation, votre peer s'emploiera à miner immédiatement et la console Javascript de Geth sera ouverte.
  * `auto_install.sh` : permet l'installation de Geth et la création d'un compte, tout d'un seul coup. Pour l'utiliser :
  
    ```bash
    $ sudo ./auto_install.sh <mot de passe pour le compte> <adresse du fichier minecoin_genesis.json>`
    ```

# HELP

Si tu as des questions, ou besoin d'aide, ca se passe sur le [Slack](http://minecoin.slack.com)

