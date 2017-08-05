#!/bin/bash

## Explication :
# --datadir est suivi du dossier où les données de la blockchain à laquelle on se connecte seront stockées
# --networkid est suivi de l'ID de la blockchain à laquelle on veut se connecter.
# le mot clé `console` donne accès à la console Geth basée sur Javascript

# Cette commande permet donc de se connecter à la blockchain d'ID 19031783, donnera accés à la console, et rangera les données téléchargées dans ~/.ethereum/minecoin

geth --datadir ~/.ethereum/minecoin --networkid 19031783 console
