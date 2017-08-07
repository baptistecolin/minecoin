#!/bin/bash

## Explication :
# --datadir est suivi du dossier où les données de la blockchain à laquelle on se connecte seront stockées
# --networkid est suivi de l'ID de la blockchain à laquelle on veut se connecter.
# --bootnodes est suivi de l'adresse du node du Rezal, auprès duquel on va se synchroniser
# Cette commande permet donc de se connecter à la blockchain d'ID 19031783, et rangera les données téléchargées dans ~/.ethereum/minecoin

geth --datadir ~/.ethereum/minecoin --networkid 19031783 --bootnodes enode://354e4bc1c3e38be4cdd9a9f19d36fbafee94f880970e46f3e796cfbea952c7ed14828380f76004271e527c42c477fd212464630f30cdcbb63655e8c41b7ed2d6@80.12.85.103:30301
