#!/bin/bash

key_type=""
echo

# Detect OS
os="$OSTYPE"
echo "detected os: $os"

# check if rsa/id_ed22519 key already exists
if [ -e ~/.ssh/id_rsa.pub ] || [ -e ~/.ssh/id_ed25519.pub ]; then
    # id_ed25519 is safer so priority
    if [ -e ~/.ssh/id_ed25519.pub ]; then
        key_type="ed25519"
        echo "detected existing id_ed22519.pub"
    else
        key_type="rsa"
        echo "detected existing id_rsa.pub"
    fi
else
    if [ "$os" == "msys"* ]; then
        echo "Generating SSH key for Windows..."
        ssh-keygen
    else
        echo -e "Choose the type of SSH key to generate:"
        echo -e "1) id_rsa (RSA)"
        echo -e "2) id_ed25519 (EdDSA)"
        echo
        echo -n "Enter your choice (1 or 2): "
        read choice

        if [ "$choice" -eq 1 ]; then
            key_type="rsa"
            echo "Generating id_rsa key..."
        elif [ "$choice" -eq 2 ]; then
            key_type="ed25519"
            echo "Generating id_ed25519 key..."
        else
            echo "Invalid choice. Exiting."
            exit 1
        fi

        ssh-keygen -t "$key_type"

        echo -e "$key_type successfully generated!"
    fi
fi

# get user and remote host
echo
echo "type in the ssh command to your remote server (ex. mkim410@bolt.cs.ucr.edu)"
read ssh_remote_host

# move public key to remote server
if [ "$os" == "msys"* ]; then
    type "$env:USERPROFILE\.ssh\id_rsa.pub" | ssh $ssh_remote_host "cat >> .ssh/authorized_keys"
else
    if [ "$key_type" = "ed25519" ]; then
        ssh-copy-id -i ~/.ssh/id_ed25519.pub $ssh_remote_host
    else
        ssh-copy-id -i ~/.ssh/id_rsa.pub $ssh_remote_host
    fi
fi

# done
echo -e "whiz whiz!!"

exit
