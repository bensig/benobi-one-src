+++ 
draft = false
date = 2020-03-28T02:48:50-07:00
title = "Animated GIFs in Swift Xcode"
slug = "" 
tags = []
categories = []
thumbnail = "images/benobi-one.png"
description = "A simple solution for swift and Animated GIFs"
+++

## Bye StackOverflow

Gone are the days of Stack Overflow; long live YouTube coding tutorials. My Dad used to have a library of home improvement books. It was a set of over 40 color coded books covering every topic from plumbing to roofing to electrical. The books were not that easy to follow either... diagrams are often not as good as seeing someone do whatever it is you are trying to do in a video. 

It's the same thing with learning a magic trick from a book. When I was a kid I used to try to learn magic tricks from a book and it was really hard to learn from the diagrams... now, I can just watch a video of a magician explaining how to do a card flourish - and the mechanics are much, much easier to see than "step 1, put your thumb under your middle finger."

## Building Apps is Magic

Plumbing is mostly untuitive - liquid follows a few basic rules. On the other hand, simple tasks in Xcode (Apple's IDE for building MacOS and iOS applications) do not follow basic rules. Xcode can be described as deep, complex, and unintuitive. Today I was just attempting to get an animated gif to run as a video the background of a little retro app I built. That probably seems like it would be an easy task... but much like trying to learn a new magic trick from a book, adding a gif had become a daunting little task just to make my app look cooler.

I found many tutorials and Github Repos. I tried many all of the various ways and not only did they seem like overkill, not one of them worked for me... Finally, I came across [this video](https://www.youtube.com/watch?v=DqyU3vGo9mI) that helped me figure it out in 5 seconds. 

## Adding a GIF to Swift

Very simple. Go [here](https://github.com/swiftgif/SwiftGif/blob/master/SwiftGifCommon/UIImage%2BGif.swift) and paste the contents of this file into a new swift file in your xCode project.

Then in your ViewController - inside of  `override func viewDidLoad() {` -->  add `imageView.loadGif(name: "<nameOfGIFfile> ) }`

Of course, you will need to have an imageView in your app already and have that object imported into your ViewController as imageView.

So, I learned a new magic trick today - and if you found this page, now you did too. 