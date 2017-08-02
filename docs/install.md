# Installation

On vous explique ici comment installer Geth

### C'est quoi Geth ?

Geth est un client qui permet de se connecter a une blockchain Ethereum, se charge de la synchroniser, et permet de faire toutes les operations necessaires : consulter son compte, effectuer une transaction, consulter la blockchain, miner ...

### Installation sur UNIX 

Dans votre terminal, executez :

```bash
$ sudo apt-get install -y software-properties-common
$ sudo add-apt-repository -y ppa:ethereum/ethereum
$ sudo apt-get update
$ sudo apt-get install -y ethereum
```

Geth est alors installe. Vous pouvez l'executer en tapant `geth`, cependant, il se connectera par defaut au _main network_, c'est a dire au reseau Ethereum. Le MineCoin est mis en place sur un reseau parallele, c'est pourquoi il faut taper :

`geth --datadir ~/.ethereum/minecoin --networkid 1783`. 

Pour vous y connecter et avoir acces a la console Geth, ajoutez `console` a la fin de la ligne de commande.

`geth --datadir ~/.ethereum/minecoin --networkid 1783 console`

Il est conseille de sauvegarder cette ligne de commande dans un fichier `minecoin.sh`, pour pouvoir l'executer en tapant simplement `./minecoin.sh` sans avoir a memoriser les details.

### Creation d'un compte

Connectez vous a la console :

`$ geth --datadir ~/.ethereum/minecoin --networkid 1783 console`

Pour se creer un compte, il faut taper :

`> personal.newAccount()`

Un mot de passe vous est demande, tapez le 2 fois.

```
> personal.newAccount()
Passphrase: 
Repeat passphrase: 
"0x6c503786685f23abae76976fe0aa843f75ea9e71"
```

La chaine de caracteres qui est imprimee, ici `0x6c503786685f23abae76976fe0aa843f75ea9e71` ,est votre cle publique, elle sert "d'adresse" vers laquelle les gens vous enverront de l'argent.
Memorisez le a tout prix : c'est lui qui chiffre votre cle privee. La cle privee chifree peut etre trouvee sur votre PC a l'adresse `~/.ethereum/minecoin/keystore`. 

```
$ ls ~/.ethereum/minecoin/keystore
UTC--2016-05-23T16-27-26.470952057Z--6c503786685f23abae76976fe0aa843f75ea9e71

$ cat ~/.ethereum/net42/keystore/UTC--2016-05-23T16-27-26.470952057Z--6c503786685f23abae76976fe0aa843f75ea9e71 
{"address":"6c503786685f23abae76976fe0aa843f75ea9e71","crypto":{"cipher":"aes-128-ctr","ciphertext":"bbdb1bd1ae530a7f83636b536f79f723fff5054496a6a29d2c4430ae3bb15c78","cipherparams":{"iv":"060243b8cdf55bedacb23123aa6a2d7d"},"kdf":"scrypt","kdfparams":{"dklen":32,"n":262144,"p":1,"r":8,"salt":"c0eb4ed480d3b21a8fc4da2a1e0b8fcfc04959b564289eeae86aac7edb88b34d"},"mac":"1159477b4f34ee5cc72359c33d178af85e4436f3a46045d44dc0536a5962f5de"},"id":"5346df68-f762-48d0-8421-ea5c0875b8a0","version":3}
```

Le fichier contenant votre cle privee est nomme `<date de creation>--<cle publique>`



