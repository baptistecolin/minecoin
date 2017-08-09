# Installation

On vous explique ici comment installer Geth

### C'est quoi Geth ?

Geth est un client qui permet de se connecter a une blockchain Ethereum, se charge de la synchroniser, et permet de faire toutes les opérations nécessaires : consulter son compte, effectuer une transaction, consulter la blockchain, miner ...

### Installation sur UNIX 

Ouvrez votre terminal, (`Ctrl + Alt + T` sur Ubuntu). Commencez par télécharger ce dépôt en rentrant les commandes suivantes :

```bash
$ sudo apt-get install git # si Git n'est pas déjà installé sur votre PC
$ git clone https://github.com/baptistecolin/minecoin.git
```

Une fois téléchargé, on installe Geth en exécutant :

```bash
$ sudo apt-get install -y software-properties-common
$ sudo add-apt-repository -y ppa:ethereum/ethereum
$ sudo apt-get update
$ sudo apt-get install -y ethereum
```

Geth est alors installé. Vous pouvez l'exécuter en tapant `geth`, cependant, il se connectera par défaut au _main network_, c'est a dire au réseau Ethereum classique. Le MineCoin est mis en place sur un réseau parallèle (_private network_), c'est pourquoi il faut mentionner des arguments supplémentaires :

```bash
$ geth --datadir ~/.ethereum/minecoin --networkid 19031783
```

Pour vous y connecter et avoir accés a la console Geth, ajoutez `console` à la fin de la ligne de commande.

```bash
$ geth --datadir ~/.ethereum/minecoin --networkid 19031783 console
```

On va rajouter le flag `--bootnodes` suivi de l'adresse du node du Rezal, afin de s'y connecter en priorité. Cela nous permettra de récupérer les données de la blockchain en se synchronisant avec le serveur du Rezal qui, normalement, devrait être à jour.

Si on ne le précise pas, Geth va rechercher des nodes auprès de qui se synchroniser. Le MineCoin n'est pas encore une cryptomonnaie ultra-célèbre, il y a peu de nodes, donc ça peut prendre beaucoup de temps pour trouver quelqu'un. On gagne du temps en lui indiquant un node de référence.

```bash
$ geth --datadir ~/.ethereum/minecoin --networkid 1901783 --bootnodes enode://354e4bc1c3e38be4cdd9a9f19d36fbafee94f880970e46f3e796cfbea952c7ed14828380f76004271e527c42c477fd212464630f30cdcbb63655e8c41b7ed2d6@80.12.85.103:30301 console
```

Les commandes deviennent carrément complexes si on veut faire les choses rigoureusement. Pour ne pas avoir à les mémoriser ou les copier/coller, elles sont sauvegardées dans le dossier [`scripts/`](https://github.com/baptistecolin/minecoin/tree/master/scripts) du Github. Pour lancer Geth, il suffira donc de taper `./launch_sync.sh`, ou bien `./launch_console.sh` pour lancer Geth avec la console, etc.

# Création d'un compte

### Principe

Votre compte sur la blockchain se résume à une seule chose : un couple de clés. Chacune est une chaîne de caractère sophistiquée. Il y en a deux :
  * **La clé publique.** Elle ressemble à ceci : `0x6c503786685f23abae76976fe0aa843f75ea9e71`. C'est par elle que vous serez désigné sur la blockchain, par exemple, au moment de préciser qui est le destinataire d'une transaction, on renseigne la clé publique du destinataire.

  * **La clé privée.** Peu importe ce à quoi elle ressemble, mieux vaut ne pas la manipuler soi-même. La clé privée sert à _signer_ vos transactions, elle apporte la preuve que c'est vous qui avez effectué une action et pas quelqu'un d'autre. Comme son nom le suggère, ne la communiquez pas, car si quelqu'un la connaissait, c'est comme si il possèdait votre compte.

Nous allons voir ici comment créer un couple de clés.

### Comment faire ?

Connectez vous a la console Geth :

`$ geth --datadir ~/.ethereum/minecoin --networkid 19031783 console` ou `./launch_console.sh`

Pour se créer un compte, il faut taper :

`> personal.newAccount()`

Un mot de passe vous est demandé, tapez le 2 fois.

```
> personal.newAccount()
Passphrase: 
Repeat passphrase: 
"0x6c503786685f23abae76976fe0aa843f75ea9e71"
```

La chaine de caractères qui est imprimée, ici `0x6c503786685f23abae76976fe0aa843f75ea9e71`, est votre clé publique, elle sert "d'adresse" vers laquelle les gens vous enverront de l'argent.
Mémorisez le mot de passe à tout prix : c'est lui qui chiffre votre clé privée. La clé privée chifrée peut être trouvee sur votre PC a l'adresse `~/.ethereum/minecoin/keystore`. 

```
$ ls ~/.ethereum/minecoin/keystore
UTC--2016-05-23T16-27-26.470952057Z--6c503786685f23abae76976fe0aa843f75ea9e71

$ cat ~/.ethereum/minecoin/keystore/UTC--2016-05-23T16-27-26.470952057Z--6c503786685f23abae76976fe0aa843f75ea9e71 
{"address":"6c503786685f23abae76976fe0aa843f75ea9e71","crypto":{"cipher":"aes-128-ctr","ciphertext":"bbdb1bd1ae530a7f83636b536f79f723fff5054496a6a29d2c4430ae3bb15c78","cipherparams":{"iv":"060243b8cdf55bedacb23123aa6a2d7d"},"kdf":"scrypt","kdfparams":{"dklen":32,"n":262144,"p":1,"r":8,"salt":"c0eb4ed480d3b21a8fc4da2a1e0b8fcfc04959b564289eeae86aac7edb88b34d"},"mac":"1159477b4f34ee5cc72359c33d178af85e4436f3a46045d44dc0536a5962f5de"},"id":"5346df68-f762-48d0-8421-ea5c0875b8a0","version":3}
```

Le fichier contenant votre clé privée est nommé `<date de creation>--<cle publique>`

## HELP

Si tu as des questions, ou besoin d'aide, ca se passe sur le [Slack](http://minecoin.slack.com)

