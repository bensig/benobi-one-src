+++ 
draft = false
date = 2023-03-04T15:56:40-08:00
title = "Actually get ord to index bitcoin"
slug = "" 
tags = []
categories = []
thumbnail = "images/benobi-one.png"
description = "A guide for getting ord working on Ubuntu"
+++

For starters, you will need a fully sync'd bitcoin node with txindex=1 - if you don't, then start with my guide on how to [install bitcoind on Ubuntu.]({{< ref "/posts/install-bitcoin-ubuntu-20.md" >}} "install bitcoind on Ubuntu."

Next, you should download, build, and install `ord`
```
git clone https://github.com/casey/ord.git
cd ord

sudo apt-get install libssl-dev
cargo build --release
```

Once that is complete, you will have an executable `ord` in `/home/bitcoin/src/ord/target/release/ord` 

You can create a little `ord` executable by doing this:

```
mkdir ~/bin
echo '/home/bitcoin/src/ord/target/release/ord --rpc-url 127.0.0.1:8332 "$@"' > ~/bin/ord
```

If you have not added rpcauth, rpcpassword, or rpcuser to your bitcoin.conf, then that's good! You won't need it for local access. Bitcoind automatically creates a ~/.bitcoin/.cookie file with a simple auth that `ord` will find and use.

Next, index - optional to use "--index-sats":
```
screen ord --index-sats index
```

Go get a coffee, or dinner... while you are gone - the index will be building the database at:
```
/home/bitcoin/.local/share/ord/index.redb
```

I indexed without "--index-sats" and it finished in a few hours, used about 2GB of storage. 

Next I indexed with "--index-sats" and it took a lot longer... 