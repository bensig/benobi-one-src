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

You can create a little `ord` executable by doing this to automatically enter the rpc-url and "RUST_LOG=debug" to every ord command:

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

Next to run the server, you can run it on a non-default port as a non-priviledged user. If you set it up with the ord shell script I created above, it will automatically use `RUST_LOG=debug` so you can actually see what's happening when you run the server or any commands.
```
ord server --http --http-port 8080
```

Next you can point a browser at your ip or fqdn at http://yourip:8080 or http://localhost:8080 if on the same device and browse ordinals.

Probably smart to set up nginx to sit in front of your server. Here is a quick config example - just replace "yourservername.com" with your FQDN:

```
upstream ords {
    server 127.0.0.1:8080 fail_timeout=15s;
}
server {
    listen 80;
    listen [::]:80;

    server_name yourservername.com;
    server_tokens off;

    error_log  /var/log/nginx/ords-error.log;
    access_log  /var/log/nginx/ords-access.log;

    keepalive_timeout 120;
    keepalive_requests 100000;
    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;

   location / {
        proxy_pass http://ords;
        add_header 'Access-Control-Allow-Methods' 'GET, POST';
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_next_upstream error timeout invalid_header http_500;
        proxy_connect_timeout 1s;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
   }
   ```

Bonus fun - now your server is probably getting pegged with SYN attacks and all kinds of crap - bc, you know, Bitcoin...

I'd recommend setting up `fail2ban` with some filters like this: https://github.com/ansell/fail2ban-filters

Happy ordinaling! 
