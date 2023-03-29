#!/bin/bash

genesis_addresses=(

    # addresses
    "nois19t6kxd4mmkawxtmejxjt3x597xtdevufxug0ma"  # narkosha adress for testnet-005
    "nois100qzcjdn7skz478ua0fh6vsahpyupjw96pdgwx"
    "nois1etx55kw7tkmnjqz0k0mups4ewxlr324tyag9j7"
    "nois16agwms2fd6tgkgmd2axnnr4vvp3g42dl2hn58r"
    # Add your address here in a PR

)

# genesis testnet addresses
account_balance=1000
uaccount_balance=$(expr $account_balance \* 1000000)
for genesis_address in "${genesis_addresses[@]}"
do
    noisd add-genesis-account "$genesis_address" "$uaccount_balance"unois
done


# Community pool init address
account_balance=150000000 #75%
uaccount_balance=$(expr $account_balance \* 1000000)
noisd add-genesis-account nois103y4f6h80lc45nr8chuzr3fyzqywm9n0d8fxzu "$uaccount_balance"unois

# Icecube calculated address
account_balance=10000000 #5%
uaccount_balance=$(expr $account_balance \* 1000000)
noisd add-genesis-account nois1gwnfyx82rwgc4y9r8vx6nr9v35dwezw3dadw6h39mad9amg7shnsler5f0 "$uaccount_balance"unois

# main address
account_balance=40000000 #20%
uaccount_balance=$(expr $account_balance \* 1000000)
noisd add-genesis-account nois1tfg9ptr84t9zshxxf5lkvrd6ej7gxjh75lztve "$uaccount_balance"unois
# faucet Enigma address
account_balance=100000 #
uaccount_balance=$(expr $account_balance \* 1000000)
noisd add-genesis-account nois1qt9xm0yml93ltf8rg0q7pylgzgkyxrtuj6nvzs "$uaccount_balance"unois


# This is how I run this script (works on my machine).

# nois-testnet-005
# rm ~/.noisd/config/genesis.json ; rm -rf /Users/kais/.noisd/config/gentx/ ; noisd init katarina --chain-id nois-testnet-005 && noisd prepare-genesis nois-testnet-005 && nois-testnet-005/add-accounts.sh && noisd gentx deployment-key-testnet  100000000000unois --chain-id nois-testnet-005 && noisd collect-gentxs && cp ~/.noisd/config/genesis.json nois-testnet-005/genesis.json








