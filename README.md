# whiz_connect 🚀
Ever get tired of putting in ur CS password a billion times every time you push &amp; pull? 🥹

`whiz_connect` is a tool that helps you remove password authentication when using SSH on remote servers. This guide will walk you through the installation process using Homebrew.

## Prerequisites 🥱

Before installing `whiz_connect`, ensure you have Homebrew installed on your system. If you haven't installed Homebrew yet, follow the instructions on the [official Homebrew website](https://brew.sh/).

## Installation Steps 🥹

1. Add the tap containing the whiz_connect formula

   ```sh
   brew tap minsooerickim/homebrew-whiz-connect
   ```

2. Then, install whiz_connect
   ```sh
   brew install whiz_connect
   ```

That's it! WhizConnect is now installed on your system.

## Usage ⏰

To use WhizConnect, simply run the following command in your terminal:

    whiz_connect

## Encryption Method
`id_ed25519` and `id_rsa` are two different types of cryptographic keys used for authentication in Secure Shell (SSH) connections.

`id_ed25519` is a newer type of key that uses the Ed25519 algorithm, which is a high-security elliptic curve algorithm. It is generally considered more secure and faster than the older RSA algorithm. Ed25519 keys are shorter than RSA keys, making them more efficient for network communication.

`id_rsa`, on the other hand, is an older type of key that uses the RSA algorithm. It is still widely used and supported, but it is considered less secure than Ed25519. RSA keys tend to be longer than Ed25519 keys, which can make them slower to use in network communication.

Both types of keys can be used for SSH authentication, but it is generally recommended to use `id_ed25519` if your SSH client and server support it, because it is considered more secure and efficient. However, if your SSH client or server does not support Ed25519, then RSA keys are still a good choice for secure authentication.

## Motivation 😓

My university has MANY MANY remote servers (bolt, sledge, hammer, cs100, many MORE). It gets SUPER ANNOYING having to type in your password **EVERY TIME** you want to `ssh` in or `push`/`pull`/`fetch`, etc.

I recently took `CS166`, DataBase Management Systems (March 2023). This class has officially crossed the line by first making us `ssh` into one remote server then `ssh`'ing AGAIN FROM THAT SERVER TO ANOTHER SERVER. I had to type in my password on an average of 10 times for making 1 contribution...

There are also many files we need to `scp` over to the remote servers from our local machine.. and guess what each of those commands require...passwords... 😑

All of the frustration above have led to the birth of whiz_connect 🚀