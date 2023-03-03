+++ 
draft = false
date = 2023-03-03T12:03:53-08:00
title = "Fast Sync for Initial Bitcoin Node"
slug = "3 Options to quickly sync a Bitcoin Node" 
tags = ["bitcoin"]
categories = []
thumbnail = "images/benobi-one.png"
description = "3 Options to quickly sync a Bitcoin Node"
+++
The initial sync of your Bitcoin node can take up to a week on a slow CPU and internet connection. Here are some options to speed it up:


## Option 1 - Use This Bitcoin Fast Sync Command
There is no torrent which would be faster than just using the Bitcoin network "hive" - which is huge. There may be a way to sync using local or low-latency nodes nearby, but any time you specify which nodes you sync from - it introduces risk.

Very good to have a fast CPU and lots of RAM, SSD is not as important as RAM.

"With this command I was able to download the entire blockchain and create all indices in almost exactly 24 hours:" 

`bitcoind --datadir=<path-to-external-ssd> -blockfilterindex=1 -txindex=1 -coinstatsindex=1 -dbcache=16384 -daemon`

*Note - this is for 16GB of RAM* - if you have 32GB of RAM, you can use `32768` for dbcache in the command above

Source: https://www.reddit.com/r/Bitcoin/comments/wwdrmu/how_to_download_the_entire_btc_blockchain_in_24h/


## Option 2 - Copy data from a (trusted) node over rsync SSH - not as safe as option 1:

Another option is to copy the directories from another node that is synchronized with the index you need:

### Make sure old data is removed:
```
sudo rm -rf ./bitcoin/blocks
sudo rm -rf ./bitcoin/chainstate
sudo rm -rf ./bitcoin/indexes
```

### Copy the blocks and chainstate folders from your existing node to ~/.bitcoin/
### For example (fill in with your own IP / FQDN and path for SSH):
```
sudo rsync -aP bitcoin@othernode.local:~/.bitcoin/blocks ~/.bitcoin/
sudo rsync -aP bitcoin@othernode.local:~/.bitcoin/chainstate ~/.bitcoin/
sudo rsync -aP bitcoin@othernode.local:~/.bitcoin/indexes ~/.bitcoin/
```


## Option 3 - Copy data to and from a (trusted) node using an external SSD:

### Copy fully sync'd node to external drive
```
sudo rsync ~/.bitcoin/blocks /mnt/externaldrive/.bitcoin/
sudo rsync ~/.bitcoin/chainstate /mnt/externaldrive/.bitcoin/
sudo rsync ~/.bitcoin/indexes /mnt/externaldrive/.bitcoin/
```

### Copy from external drive to node
```
sudo rsync /mnt/externaldrive/.bitcoin/blocks ~/.bitcoin/
sudo rsync /mnt/externaldrive/.bitcoin/chainstate ~/.bitcoin/
sudo rsync /mnt/externaldrive/.bitcoin/indexes ~/.bitcoin/
```

If this is missing anything, or if you have any comments or questions - ping me on [Twitter](https://twitter.com/bensig) and I will update this page.