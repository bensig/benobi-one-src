+++ 
draft = false
date = 2020-03-27T02:27:29-07:00
title = "JAMstack Serverless Hugo Deployment"
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

## Netlify deployment

Part of my choice for using Hugo was that I had wanted to check out this new decentralized web deployment called [JAMstack](https://jamstack.org/). This site has no central webserver. It runs completely on a CDN. The free CDN I'm using is provided by [Netlify](https://netlify.com). Netlify is a CDN for static html files specifically designed for JAMstack. I added my html repo as a source for the site's code. It is also possible to setup Netlify to run your Hugo deploy script.

If you have any quesitons or comments about this setup please feel free to reach out to me on [Twitter](https://twitter.com/bensig).
