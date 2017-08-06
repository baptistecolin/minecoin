# Effectuer des transactions

On va détailler sur cette page comment effectuer des transactions de MineCoin depuis la console Geth.

### Prérequis

Ca ne s'invente pas, il faut avoir de l'argent sur son compte !... Dans cet exemple, on commence avec presque 9 MNC :


```javascript
> eth.getBalance(eth.coinbase)
8906250000000000000
```

Ma clé publique est `"0x04e8bb418ecd4229cdbfa87774dbfaa4e6f51c76"`. Je vais envoyer 1 MNC à 14roiron, dont la clé publique est `"0x8bf532a400d5ba317ec5bc5b082226d418fc5910"`.

Pour ne pas avoir à recopier, ou à copier/coller les adresses, on peut les enregistrer dans des variables, en suivant la syntaxe Javascript :

```javascript
> var sender = "0x04e8bb418ecd4229cdbfa87774dbfaa4e6f51c76"
undefined
> var receiver = "0x8bf532a400d5ba317ec5bc5b082226d418fc5910"
undefined
```

On tapera donc `sender` au lieu de `"0x04e8bb418ecd4229cdbfa87774dbfaa4e6f51c76"` dans la suite. On va aussi mémoriser la montant à envoyer :

```javascript
> var amount = web3.toWei(1, "ether")
undefined
> amount
"1000000000000000000"
```

### Description

On utilisera la fonction `eth.sendTransaction`. Elle prend un argument un JSON, qui a la forme suivante :

```json
{
    from: <clé de l'expéditeur> ,
    to: <clé du destinataire> ,
    value: <montant à envoyer, en Wei>
}
```

Ici aussi, on va se simplifier la vie en mémorisant le JSON dans une variable :

```javascript
> var data = {from: sender, to: receiver, value: amount}
undefined
```

Et on ordonne la transaction avec :

```javascript
> eth.sendTransaction(data)
Error: authentication needed: password or unlock
    at web3.js:3104:20
    at web3.js:6191:15
    at web3.js:5004:36
    at <anonymous>:1:1
```

Heureusement, on n'ordonne pas des transactions en claquant des doigts ! Il y a des barrières de sécurité, qui s'ouvrent grâce au mot de passe choisi lors de la création de votre compte MineCoin. Il faut d'abord déverouiller le compte correspondant à `sender` :

```javascript
> personal.unlockAccount(sender)
Unlock account 0x04e8bb418ecd4229cdbfa87774dbfaa4e6f51c76
Passphrase: 
true
```

Le compte expéditeur est alors dévérouillé. Il se revérouillera après un certain temps, ou si on exécute `personal.lockAccount(sender)`. On peut désormais effectuer la transaction :

```javascript
> eth.sendTransaction(data)
INFO [08-06|19:04:07] Submitted transaction                    fullhash=0x4d31ba64c02ecfeeb26efd0201c64b38ace04472beafac6e2828cd36528869f8 recipient=0x8bf532a400d5ba317ec5bc5b082226d418fc5910
"0x4d31ba64c02ecfeeb26efd0201c64b38ace04472beafac6e2828cd36528869f8"
```

La transaction a été ordonnée. Elle est identifiée par un hash. On va le sauvegarder par commodité, il nous permettra d'accéder aux informations de la transaction, notamment grâce à la fonction `eth.getTransaction` :

```javascript
> var transac_hash = "0x4d31ba64c02ecfeeb26efd0201c64b38ace04472beafac6e2828cd36528869f8"
undefined
> eth.getTransaction(transac_hash)
{
    blockHash: "0x0000000000000000000000000000000000000000000000000000000000000000",
    blockNumber: null,
    from: "0x04e8bb418ecd4229cdbfa87774dbfaa4e6f51c76",
    gas: 90000,
    gasPrice: 18000000000,
    hash: "0x4d31ba64c02ecfeeb26efd0201c64b38ace04472beafac6e2828cd36528869f8",
    input: "0x",
    nonce: 0,
    r: "0xe97dab45a1251744300b4c954e11db1b8c5f18d8240cca94cc9dc1128a1f4f5a",
    s: "0x2f62aa443d1f4e0ecc7e9c7264bc79531efb3674a5873acd97139faaa103818f",
    to: "0x8bf532a400d5ba317ec5bc5b082226d418fc5910",
    transactionIndex: 0,
    v: "0x244cdf1",
    value: 1000000000000000000
}
```

Notez bien qu'à ce stade, mon compte n'est pas débité :

```javascript
> eth.getBalance(sender)
8906250000000000000
```

Il ne le sera qu'une fois que la transaction sera validée, c'est à dire quand on un bloc contenant cette transaction dans sa liste sera miné. En attendant, on observe que les champs `blockHash` et `blockNumber` de la transaction sont à 0 : ils obtiendront une vraie valeur quand la transaction sera validée.

Une fonction intéressante est `eth.getTransactionReceipt`. Elle renvoie `null` si la transaction n'est pas validée. Si la transaction est validée, elle renvoie la liste complète des informations à connaître à propos de la transaction.

```javascript
> eth.getTransactionReceipt(transac_hash)
null
```

Patientons le temps que la transaction soit validée. Peut-être que personne n'est en train de miner du MineCoin, dans le doute, mettez vous aussi à miner pour participer à la validation de votre propre transaction : `miner.start(1)`

La ligne suivant nous signale qu'un nouveau bloc a été miné par quelqu'un et que notre peer vient de le télécharger :

```javascript
INFO [08-06|19:22:11] Imported new chain segment               blocks=1 txs=2 mgas=0.042 elapsed=60.156ms  mgasps=0.698 number=4 hash=d032de…eb621a
```

On peut constater que la transaction a été validée avec ce bloc :

```javascript
> eth.getBalance(eth.coinbase)
7905872000000000000
> eth.getTransactionReceipt(transac_hash)
{
    blockHash: "0xd032de02d585a7450733a8a6fc91a2688c72a275d2c306692b69dd182eeb621a",
    blockNumber: 4,
    contractAddress: null,
    cumulativeGasUsed: 21000,
    from: "0x04e8bb418ecd4229cdbfa87774dbfaa4e6f51c76",
    gasUsed: 21000,
    logs: [],
    logsBloom: "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    root: "0x5dac16b65b72b8f6a0b4aba08d65363043e40f507c3aad7939fd301865a05efb",
    to: "0x8bf532a400d5ba317ec5bc5b082226d418fc5910",
    transactionHash: "0x4d31ba64c02ecfeeb26efd0201c64b38ace04472beafac6e2828cd36528869f8",
    transactionIndex: 0
}
```

Le compte de l'expéditeur a bien été débité, et `eth.getTransactionReceipt(sender)` ne renvoie plus `null` mais un bilan de la transaction.

## HELP

Si t'y comprends rien tu peux m'appeler à l'aide : [`baptiste.colin@mines-paristech.fr`](mailto:baptiste.colin@mines-paristech.fr)
