#!/bin/bash

id_ed_exists = false

# check if rsa/id_ed22519 key already exists
if [ -e ~/.ssh/id_rsa.pub ] || [ -e ~/.ssh/id_ed25519.pub ]; then
    # id_ed25519 is safer so priority
    if [ -e ~/.ssh/id_ed25519.pub ]; then
        id_ed_exists = true
        echo "detected existing id_ed22519.pub"
    else
        echo "detected existing id_rsa.pub"
    fi
else
    echo "generating new id_rsa"

    # saves to /.ssh/
    # no passphrase comment this line out if you want a passphrase
    # passphrase confirmation
    # echo -en "\n\n\n" | ssh-keygen -t rsa
    echo | ssh-keygen -P '' -t rsa

    # id_rsa & id_rsa.pub generated
    echo "id_rsa & id_rsa.pub successfully generated in /.ssh/"
fi

# get user and remote host
echo
echo "type in the ssh command to your remote server (ex. ssh mkim410@bolt.cs.ucr.edu)"
read ssh_remote_host

# move public key to remote server
if [ "$id_ed_exists" = true ]; then
    ssh-copy-id -i ~/.ssh/id_ed25519.pub $ssh_remote_host
else
    ssh-copy-id -i ~/.ssh/id_rsa.pub $ssh_remote_host
fi

# done
echo "whiz whiz!!"

exit
