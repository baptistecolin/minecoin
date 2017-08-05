#!/bin/bash

## Explication :
# --datadir est suivi du dossier où les données de la blockchain à laquelle on se connecte seront stockées
# Le mot clé `init` déclenche l'initialisation de l'environnement dans lequel seront stockées les données de la blockchain, et le met en place dans le répertoire indiqué avec --datadir. Il est suivi de l'adresse d'un fichier .json qui contient les données du premier block de la blockchain. 
#
# Cette commande permet donc d'initialiser la blockchain d'ID 19031783 (l'ID est précisé dans le fichier minecoin_genesis.json), et rangera les données téléchargées dans ~/.ethereum/minecoin
#
# NB : 19031783, comme le 19 mars 1783, jour de création de l'Ecole des Mines de Paris par arrêt du Conseil de Roi Louis XVI

geth --datadir ~/.ethereum/minecoin/ init ../data/minecoin_genesis.json
