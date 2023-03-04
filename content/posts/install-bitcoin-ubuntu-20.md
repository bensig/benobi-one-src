+++ 
draft = false
date = 2023-03-03T17:14:33-08:00
title = "Install bitcoind on Ubuntu - works"
slug = "" 
tags = []
categories = []
thumbnail = "images/benobi-one.png"
description = ""
+++

Looking into these Bitcoin Ordinals https://ordinals.com/ and I decided to try to install and sync a new bitcoin node. It has been a few years since I did this from scratch, so I was looking for some simple ways to install... maybe use snap or download some precompiled binaries and do some softlinks to /usr/local/bin? No, none of that worked for me. I wasted an hour. 

All of the guiedes are all kind of busted IMHO - best to build from source code. This should work on most debian and ubuntu linux installs.

First, get all of the prerequesites installed. I found these hidden in github under the "Unix" build notes 
https://github.com/bitcoin/bitcoin/blob/master/doc/build-unix.md

Do not run as ROOT - make sure you have a regular account with sudo ability. If you don't know how to do that, look up `visudo`.

I simplified into a single line to install with apt get:

```
sudo apt-get install git build-essential autoconf libtool autotools-dev automake pkg-config bsdmainutils python3 libevent-dev libboost-dev libsqlite3-dev 
```

Next clone the github for bitcoin and checkout version 24.0.1 so you can index ordinals correctly:
```
mkdir ~/src
git clone https://github.com/bitcoin/bitcoin.git ~/src/bitcoin
cd ~/src/bitcoin
git checkout v24.0.1
```

Next you will build - start the configuration.
```
./autogen.sh
./configure
```

Get the number of cpu cores your system has - you will need this for the next step.
```
CORES=`lscpu|grep "CPU(s)"|head -1|awk '{print $2}'`
echo $CORES
```

*OPTIONAL* - Set your CPU cores to performance mode, this will speed up the build and initial sync. 
```
CPUS=`echo "$(($CORES-1))"` && i=0; while [ $i -le $CPUS ]; do cpufreq-set -c $i -g performance; i=$(($i+1));done
```

The more cores you use, the faster this will go - recommend using all of them, but if you need to do other things, you can specify the number of CPU cores to use here instead of "$CORES":
```
make -j $CORES
make install
```

Check version installed.
```
bitcoind --version
```

Create bitcoin.conf file:
```
touch ~/.bitcoin/bitcoin.conf
```

Edit the bitcoin.conf file using `nano ~/.bitcoin/bitcoin.conf` and put in the following info:
```
txindex=1
dbcache=16384
debuglogfile=$HOME/.bitcoin/debug.log
```

run bitcoind
```
bitcoind -daemon
```

Next you can sync your node following this guide: [fast sync bitcoin node.]({{< ref "/posts/fast-sync-initial-bitcoin-node.md" >}} "fast sync bitcoin node.") - or just try letting it run with these settings here on this page.

Tail the logs to watch it sync - progress=0.000601 --> this is a percentage based on total size of the chain where 1.000 = 100%.
```
tail -f $HOME/.bitcoin/debug.log | awk '{print $10}'
```

You can see what percent it is at based on storage size or check the block sync level using my script in this gist:
https://gist.github.com/bensig/4793be2327b1d535a70046a759a5e696#file-check_bitcoind_sync-sh
