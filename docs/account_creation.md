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

Si t'y comprends rien tu peux m'appeler à l'aide : [`baptiste.colin@outlook.com`](baptiste.colin@outlook.com)
