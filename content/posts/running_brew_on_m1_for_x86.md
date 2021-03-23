+++ 
date = 2021-03-22T22:46:23-07:00
title = "Running Brew on the New Apple M1 Chip"
slug = "" 
tags = ["apple, apps, error, brew, m1"]
categories = []
thumbnail = "images/benobi-one.png"
description = "Getting brew to work on M1 Macbook"
+++

On the new Macbook M1 chip, you might get an error such as "To install under x86_64, install Homebrew into /usr/local" 

I used my GoogleFu and did not find a solution as simple as this - just install a second Homebrew.

## 5 Simple Steps to Install Intel Brew on M1
1. Install Rosetta (this will fail if your Terminal is set to "[Open using Rosetta](https://www.howtogeek.com/702982/how-to-launch-the-intel-version-of-a-universal-mac-app-on-apple-silicon/)") by running `softwareupdate --install-rose`
2. Run this command to install the Intel architecture Homebrew 
`arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
3. Add this to your ZSH config (I recommend using [OhMyZSH](https://ohmyz.sh/#install) + add a file called ~/.oh-my-zsh/custom/brew.zsh) with the contents:
```
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
alias ibrew='arch -x86_64 /usr/local/bin/brew'
```
4. Re-source your zsh term `source .zshrc`
5. Run Intel brew as `ibrew install <whatever>`

That's it! Now you can install brew for ARM and have ibrew for running Intel-specific apps under Rosetta. Super fast and simple solution! 

If you run into trouble, try typing `brew config` and `ibrew config` to make sure that your brew installs are really in their respectively correct folders - just look for the line "HOMEBREW_PREFIX:".

* ARM brew will live in /opt/homebrew 
* Intel brew will live in /usr/local

Shoutout to [Sam Soffes](https://soffes.blog/homebrew-on-apple-silicon) for his post on this topic that was helpful.