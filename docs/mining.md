# Minage

Les commandes principales sont `miner.start(1)`, pour commencer à miner, et `miner.stop()`, pour arrêter.

Le `1` dans `miner.start(1)` signifie qu'un processus de minage sera ouvert. Inutile d'en ouvrir plus, cela n'accèlerera pas le minage.
### Première exécution

Avant de commencer à miner, Geth va générer la base de données :

```javascrit
> miner.start(1)
INFO [08-06|03:12:16] Updated mining threads                   threads=1
INFO [08-06|03:12:16] Transaction pool price threshold updated price=18000000000
INFO [08-06|03:12:16] Starting mining operation 
INFO [08-06|03:12:16] Commit new mining work                   number=1 txs=0 uncles=0 elapsed=25.578ms
INFO [08-06|03:12:19] Generating DAG in progress               epoch=0 percentage=0 elapsed=1.854s
INFO [08-06|03:12:21] Generating DAG in progress               epoch=0 percentage=1 elapsed=3.786s
INFO [08-06|03:12:23] Generating DAG in progress               epoch=0 percentage=2 elapsed=5.690s
...
```

Il faut patienter le temps que tout soit construit. Quand vous voyez apparaître la ligne :

```javascript
INFO [08-06|03:18:54] Generated ethash verification cache      epoch=1 elapsed=3m25.612s
```

C'est que la base de données est construite.

### Exécutions habituelles

On lance le minage :

```javascript
> miner.start(1)
INFO [08-06|03:30:04] Updated mining threads                   threads=1
INFO [08-06|03:30:04] Transaction pool price threshold updated price=18000000000
INFO [08-06|03:30:04] Starting mining operation 
INFO [08-06|03:30:04] Commit new mining work                   number=1 txs=0 uncles=0 elapsed=411.502µs
```

Le minage débute. Il faut patienter. 

Il faut bien comprendre que les blocs ne viennent pas de nulle part : un bloc contient une liste de transactions en attentes. Le processus de minage est ce qui permet de valider les transactions en attentes, et de transmettre l'information. En contrepartie de leur travail de validation, les mineurs sont récompensés avec quelques MineCoin.

Le réseau s'ajuste pour que, à long terme, un nouveau bloc soit issu toutes les 15 minutes. Il est possible qu'un bloc ne contienne aucune transaction à miner, si aucune transaction n'a été effectuée depuis le minage du dernier bloc. En revanche, une transaction ne sera jamais validée si personne n'est là pour la miner.

Au bout d'un certain temps, peut être que vous minerez un bloc :

```javascript
> miner.start(1)
INFO [08-06|15:22:37] Updated mining threads                   threads=1
INFO [08-06|15:22:37] Transaction pool price threshold updated price=18000000000
INFO [08-06|15:22:37] Starting mining operation 
INFO [08-06|15:22:37] Commit new mining work                   number=1 txs=0 uncles=0 elapsed=213.588µs
INFO [08-06|16:01:11] Successfully sealed new block            number=1 hash=c60628…5153f6
INFO [08-06|16:01:11] 🔨 mined potential block                  number=1 hash=c60628…5153f6
```

On voit que cela a pris environ 40 minutes entre le début du minage et le minage du 1er bloc.

Quand un node réussit à miner un bloc, il est récompensé avec 5 MNC :

```javascript
> eth.getBalance(eth.coinbase)
5000000000000000000
```

La fonction renvoie 5 x 10^18 car le résultat est exprimé en Wei, une sous unité du MineCoin. 1 MNC == 10^18 Wei. Vous pouvez effectuer des conversions avec `web3.fromWei` et `web3.toWei` :

```javascript
> web3.fromWei(5000000000000000000, 'ether')
5
> web3.toWei(5, 'ether')
5000000000000000000
```

## HELP

Si t'y comprends rien tu peux m'appeler à l'aide : [`baptiste.colin@outlook.com`](mailto:baptiste.colin@outlook.com)
