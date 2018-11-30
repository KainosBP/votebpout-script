#!/bin/bash
#
# Script Created by J.T. Buice | kainosbp.com
#

TELOSPATH="/telos/stage3.0/build/programs"

WALLETHOST="127.0.0.1"
APIHOST="127.0.0.1"
APIPORT="8888"
WALLETPORT="8999"

#$TELOSPATH/teclos/teclos -u http://$NODEHOST:$NODEPORT --wallet-url http://$WALLETHOST:$WALLETPORT "$@"
$TELOSPATH/teclos/teclos -u http://$APIHOST:$APIPORT "$@"
