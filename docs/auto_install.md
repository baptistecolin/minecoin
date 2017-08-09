# Installation rapide

On a écrit un script qui installe Geth et créé un compte, tout d'un seul coup.

C'est le script [`auto_install.sh`](https://github.com/baptistecolin/minecoin/blob/master/scripts/auto_install.sh) du dossier `scripts/`.

### Utilisation

Ouvrez votre Terminal (`Ctrl + Alt + T` sur Ubuntu). Commencez par télécharger le dépôt qui contient tout les fichiers nécessaires :

```bash
$ sudo apt-get install git # si Git n'est pas encore installé sur votre PC
$ git clone https://github.com/baptistecolin/minecoin
```

Une fois les téléchargements finis, tapez dans votre terminal les commandes suivantes :

```bash
$ cd scripts/
$ sudo ./auto_install.sh <password> <fichier minecoin_genesis.json>
```

  * A la place de `<password>`, entrez le mot de passe que vous désirez avoir pour votre compte MineCoin.
  * A la place de `<fichier minecoin_genesis.json>`, entrez l'emplacement du fichier `minecoin_genesis.json`. Si vous ne savez pas quoi mettre, essayer `../data/minecoin_genesis.json`.

Rentrez le mot de passe de votre PC. Des opérations vont s'effectuer. Des confirmations vous seront demandées, tapez alors `y` (yes) ou `o` (oui) selon la langue de votre PC. L'installation et la création du compte devraient prendre 2 minutes environ.

### Annexes

Vous pouvez lire la procédure d'installation "en détail" sur [`/docs/install.md`](https://github.com/baptistecolin/minecoin/blob/master/docs/install.md). Elle vous fait faire manuellement les mêmes opérations que l'installation automatisée.

## HELP

Si tu as des questions, ou besoin d'aide, ca se passe sur le [Slack](http://minecoin.slack.com)

