# Installation

On vous explique ici comment installer Geth

### C'est quoi Geth ?

Geth est un client qui permet de se connecter a une blockchain Ethereum, se charge de la synchroniser, et permet de faire toutes les opérations nécessaires : consulter son compte, effectuer une transaction, consulter la blockchain, miner ...

### Installation sur UNIX 

Dans votre terminal, executez :

```bash
$ sudo apt-get install -y software-properties-common
$ sudo add-apt-repository -y ppa:ethereum/ethereum
$ sudo apt-get update
$ sudo apt-get install -y ethereum
```

Geth est alors installé. Vous pouvez l'éxecuter en tapant `geth`, cependant, il se connectera par défaut au _main network_, c'est a dire au réseau Ethereum classique. Le MineCoin est mis en place sur un réseau parallèle (_private network_), c'est pourquoi il faut mentionner des arguments supplémentaires :

`geth --datadir ~/.ethereum/minecoin --networkid 19031783`. 

Pour vous y connecter et avoir accés a la console Geth, ajoutez `console` à la fin de la ligne de commande.

`geth --datadir ~/.ethereum/minecoin --networkid 19031783 console`

Ces commandes un peu complexes sont sauvegardées dans le dossier [`scripts/`](https://github.com/baptistecolin/minecoin/tree/master/scripts) du Github. Pour vous connecter, il suffira donc de taper `$ ./launch_sync.sh` 

## HELP

Si t'y comprends rien tu peux m'appeler à l'aide : [`baptiste.colin@mines-paristech.fr`](mailto:baptiste.colin@mines-paristech.fr)
