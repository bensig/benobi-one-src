+++ 
draft = true
date = 2020-03-27T02:27:29-07:00
title = "Hugo Deployment to Github and Plesk via Webhook"
slug = "" 
tags = []
categories = []
thumbnail = "images/benobi-one.png"
description = ""
+++

This site is built on [Hugo](https://gohugo.io/) which is really fast and easy to work with - even if you are only a basic developer. Here is how I setup my Hugo deployments. It's actually really simple and it will help you save a lot of time updating your site.

## Setup vscode to play nicely with Hugo 
These will help you to see your syntax and build your site from vscode directly using the command pallete.
* [Hugo Language and Syntax Support](https://marketplace.visualstudio.com/items?itemName=budparr.language-hugo-vscode)
* [Better TOML](https://marketplace.visualstudio.com/items?itemName=bungcip.better-toml)
* [Hugo Helper](https://marketplace.visualstudio.com/items?itemName=rusnasonov.vscode-hugo)


## Setup your Github repos for Hugo deployment 
I setup 3 different repos on Github: 
    1. [Hugo source code](https://github.com/bensig/benobi-one-src) 
    2. [Hugo-generated static HTML](https://github.com/bensig/benobi-one-html). 
    3. [Hugo theme fork](https://github.com/bensig/hugo-coder-portfolio) 

I added the [theme fork](https://www.andrewhoog.com/post/git-submodule-for-hugo-themes/) and [html repos](https://gohugo.io/hosting-and-deployment/hosting-on-github/) as submodules. One step from the linked instructions on GoHugo was not totally clear. I had to delete the public folder from my source repo and added the html repo as a submodule to keep it all clean. This is the actual command I used to create the public folder and setup the submodule: `git submodule add -b master https://github.com/<Hugo-html-repo.git> public` 

## Hugo bash script for single command deployment
Finally, I made a bash script to commit and push the code to the source and html github repos.

```#!/bin/bash
# commit-push-hugo.sh - commit and push hugo site for deployment
# usage: commit-push-hugo.sh commit-message
git add . && git commit -m "$1" && git push
cd public && git add . && git commit -m "$1" && git push
```

I put that script into my $PATH and made it executable by my user and now I am able to easily commit and deploy my changes to Github by typing:`commit-push-hugo.sh commit-message` from within my Hugo src repo root.

## Plesk webhook for auto deployment
That's great if you want to host on Github pages and you can stop right there and have a great site... But I like to use Plesk for all my web hosting. 

Plesk allows you to setup your Github remote repo as a source for httpdocs and they have a handy webhook. 

I configured this webhook to be triggered by a push on the html repo. Now when I make changes to my site, I can preview them locally by starting my hugo server in vscode and then running a single command to deploy to Github which triggers a webhook on my Plesk server - Voila! Simple Hugo deployment! 

If there is anything I can do better or if you have any quesitons about this setup please feel free to reach out to me on [Twitter](https://twitter.com/bensig).