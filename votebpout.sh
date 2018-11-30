#!/bin/bash

echo "Enter votebpout proposal name, 12 char or less followed by [Enter]:"
read proposal
echo "Enter BP to Kick followed by [Enter]:"
read kickbp

echo curl -X POST http://localhost:8888/v1/chain/get_account -H \'Content-Type: application/json\' -d \'{"\""account_name"\"":"\""eosio.prods"\""}\' \| jq [\'.permissions[0].required_auth.accounts[].permission]\' | bash - > bps.json

./teclos.sh multisig propose $proposal bps.json '[{"actor": "eosio", "permission": "active"}]' eosio votebpout '{"bp" : '\"$kickbp\"',"penalty_hours":"1"}' -p bigironbptex@active
