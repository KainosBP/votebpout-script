#!/bin/bash
#
# Script Created by J.T. Buice | kainosbp.com
#
# This script assumes you are running it on an API node with port 8888. If not, edit line 17.
# It also assumes you have jq installed. It is a standard package on any default Ubuntu install.

echo "Enter votebpout proposal name, 12 char or less followed by [Enter]:"
read proposal
echo "Enter BP to Kick followed by [Enter]:"
read kickbp
echo "Enter the number of hours to kick followed by [Enter]:"
read hours
echo "Enter the account of the signing BP followed by [Enter]:"
read signingbp

echo curl -X POST https://api.kainosbp.com/v1/chain/get_account -H \'Content-Type: application/json\' -d \'{"\""account_name"\"":"\""eosio.prods"\""}\' \| jq [\'.permissions[0].required_auth.accounts[].permission]\' | bash - > bps.json

cleos -u https://api.kainosbp.com multisig propose $proposal bps.json '[{"actor": "eosio", "permission": "active"}]' eosio votebpout '{"bp" : '\"$kickbp\"',"penalty_hours":'\"$hours\"'}' -p $signingbp@active
