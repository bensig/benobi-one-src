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

For starters, you will need a fully sync'd bitcoin node with txindex=1 - if you don't, then start with my guide on how to [install bitcoind on Ubuntu.]({{< ref "/posts/install-bitcoin-ubuntu.md" >}} "install bitcoind on Ubuntu.")

Next, you should download, build, and install `ord`
```
mkdir $HOME/src
cd src
git clone https://github.com/casey/ord.git
cd ord

sudo apt-get install libssl-dev
cargo build --release
```

Once that is complete, you will have an executable `ord` in `$HOME/src/ord/target/release/ord` 

You can create a little `ord` executable by doing this:

```
mkdir ~/bin
echo 'RUST_LOG=debug $HOME/src/ord/target/release/ord --rpc-url 127.0.0.1:8332 "$@"' > ~/bin/ord
```

If you have not added rpcauth, rpcpassword, or rpcuser to your bitcoin.conf, then that's good! You won't need it for local access. Bitcoind automatically creates a ~/.bitcoin/.cookie file with a simple auth that `ord` will find and use.

Next, index - optional to use "--index-sats" (see further below):
```
screen ord index
```

Go away for a while... this will take time - the index will be building the database at:
```
$HOME/.local/share/ord/index.redb
```

I indexed without "--index-sats" and it finished in a few hours, used about 2GB of disk space. 

Next I indexed with "--index-sats" and it took a lot longer... about 15 hours and used ~100GB of disk space. It really slowed down in the last 100,000 blocks - the "first-inscription-height" setting did not seem to affect this at all. 
```
screen ord --first-inscription-height 767430 --index-sats index
```

Next to run the server, you will need to enable `ord` to bind to port 80:
```
sudo setcap CAP_NET_BIND_SERVICE=+eip /home/bitcoin/src/ord/target/release/ord
```

Now you can run `ord server` - if you set it up with the ord shell script I created above, it will use `RUST_LOG=debug` so you can actually see what's happening when you run the server or any commands.

Happy ordinaling! 
