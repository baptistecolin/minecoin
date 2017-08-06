#!/bin/bash

### AUT INSTALL SCRIPT
# Ce script va installer les outils nécessaires pour manipuler une blockchain Ethereum, et automatiquement créer un couple de clés prêt à l'usage.
#
# UTILISATION :
# 
# $ ./auto_install.sh <mot de passe à utiliser pour le compte MineCoin> <adresse du fichier minecoin_genesis.json>
#
# NB : on pourraît améliorer la sécurité en ce qui concerne la communication du mdp

# set up the repositoy and install Geth
apt-get install -y software-properties-common
add-apt-repository -y ppa:ethereum/ethereum
apt-get update
apt-get install -y ethereum

# init the MineCoin blockchain
geth --datadir ~/.ethereum/minecoin init ../data/minecoin_genesis.json

# launch Geth with RPC port open, with necessary restrictions
#
# DETAILS :
# --rpc allows JSON-RPC calls. It opens port 8545 by default.
# --rpcapi [values] mentions which commands are allowed to be fired through RPC. Here, only "personal.____" commands are allowed.
# --rpccorsdomain [values] brings restriction concerning who is allowed to launch commands through RPC. Here, we don't want another computer to access our Geth, only 127.0.0.1 (localhost) is authorized.
# & is added so that this command runs in the background without blocking the rest of the script
geth --datadir ~/.ethereum/minecoin --networkid 19031783 --rpc --rpcapi "personal" --rpccorsdomain 127.0.0.1 &

# wait 10 seconds for Geth to properly start
sleep 10

# send an account creation command through RPC
curl -X POST --data '{"jsonrpc":"2.0","method":"personal_newAccount","params":["$1"],"id":1}' localhost:8545

# wait 5 seconds for the command to be properly processed
sleep 5

# We can assume the account has been created. We can kill the geth process.
kill `pidof geth`
