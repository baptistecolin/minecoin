# Introduction à Geth

Geth est un outil puissant qui permet de *tout* faire sur une blockchain de type Ethereum, comme c'est le cas pour le MineCoin ou pour l'Ether. Encore faut-il savoir lui parler. Cette page vous expliquera comment faire des opérations basiques, essentielles pour gérer son portefeuille MineCoin depuis Geth.

### Démarrage

La commande de démarrage est :

`$ geth --datadir ~/.ethereum/minecoin --networkid 19031783 console`

Notez bien l'argument `console` à la fin. Quand il est précisé, Geth ouvre sa console, basée sur Javascript. Sinon, il se contentera d'ouvrir un noeud et de synchroniser les blocs.

Pour ne pas avoir à mémoriser cette commande, vous pouvez la lancer depuis un script. Vous pouvez utliser le script `scripts/launch_console.sh` de ce répertoire :

```bash
$ cd scripts/
$ ./launch_console.sh
```

_Dans toute la suite, on considèrera que vous avez déjà créé au moins un compte MineCoin. Si ce n'est pas encore le cas, on explique comment faire_ [ici](https://github.com/baptistecolin/minecoin/blob/master/docs/account_creation.md)

### Comptes

Pour connaitre la liste des comptes accessibles depuis votre PC :

```javascript
> eth.accounts
["0x04e8bb418ecd4229cdbfa87774dbfaa4e6f51c76"]
```

Il vous est renvoyé un tableau, qui contient une clé publique par compte accessible. A ce titre, vous pouvez accéder à ses éléments en suivant la syntaxe de Javascript.

```javascript
> eth.accounts[0]
"0x04e8bb418ecd4229cdbfa87774dbfaa4e6f51c76"
> eth.accounts[1]
undefined
```

Vous pouvez consulter le solde de n'importe quel compte grace à la fonction `eth.getBalance`, qui prend en argument la clé publique du compte à consulter :

```javascript
> eth.getBalance(eth.accounts[0])
0
> eth.getBalance("0x123456789abcdef123456789abcdef1234567890")
0
```

Dans la première commande, on vient de consulter le solde d'une de nos adresses, celle qui est à l'index 0 quand on appelle `eth.accounts()`. Dans la deuxième, on a consulté le solde d'une adresse étrangère. Si l'adresse ne correspond à aucun compte réel, le résultat retourné sera 0.

Certaines opérations ne nécessiteront pas que vous précisiez le compte avec lequel vous voulez l'effectuer. Dans ces cas là, le compte utilisé sera celui que renvoie la commande `eth.coinbase`. Surveillez ceci si vous manipulez plusieurs comptes. L'adresse _par défaut_ stockée dans `eth.coinbase` peut être modifiée avec la commande :

```javascript
> miner.setEtherbase( adresse_de_votre_choix )
```

### Informations sur la blockchain

Pour connaître le dernier bloc que votre PC a téléchargé :

```javascript
> eth.blockNumber
0
```

Le résultat sera 0 si vous n'avez encore jamais miné, car le seul bloc présent sur votre PC est le bloc d'initialisation, défini précédemment dans `minecoin_genesis.json`. Le numéro du dernier bloc téléchargé est le meilleur repère pour savoir si deux nodes sont synchronisés : ils le sont si et seulement si leurs derniers blocs téléchargés ont le même numéro. Il est important d'avoir téléchargé les blocs les plus récents pour avoir des informations aussi à jour que possible sur la blockchain.

Vous pouvez vous assurer que vous être sur le bon réseau avec :

```javascript
> net.version
19031783
```

Vous pouvez connaître les différentes commandes disponibles grâce à l'autocomplétion en tapant sur `TAB`. Les fonctions ont toujours un préfixe parmi `eth.`, `net.`, `personal.`, `miner.` ...

```javascript
> net. // on tape sur TAB pour connaître les fonctions disponibles
net._requestManager net.constructor net.getListening net.getPeerCount net.getVersion net.listening net.peerCount net.version 
```

### Quitter

Tout simplement :

```javascript
> exit
```

## HELP

Si t'y comprends rien tu peux m'appeler à l'aide : [`baptiste.colin@outlook.com`](mailto:baptiste.colin@outlook.com)
