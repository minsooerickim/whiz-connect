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

## Motivation 😓

My university has MANY MANY remote servers (bolt, sledge, hammer, cs100, many MORE). It gets SUPER ANNOYING having to type in your password **EVERY TIME** you want to `ssh` in or `push`/`pull`/`fetch`, etc.

I recently took `CS166`, DataBase Management Systems (March 2023). This class has officially crossed the line by first making us `ssh` into one remote server then `ssh`'ing AGAIN FROM THAT SERVER TO ANOTHER SERVER. I had to type in my password on an average of 10 times for making 1 contribution...

There are also many files we need to `scp` over to the remote servers from our local machine.. and guess what each of those commands require...passwords... 😑

All of the frustration above have led to the birth of whiz_connect 🚀