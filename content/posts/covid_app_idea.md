+++ 
draft = false
date = 2020-04-08T23:39:42-07:00
title = "COVID App in Flutter"
slug = "" 
tags = []
categories = []
thumbnail = "images/benobi-one.png"
description = ""
+++

While I am waiting to hear from Apple about [whether or not they will allow me to update Retro Ping](https://benobi.one/posts/app_store_rejection/), I was thinking about building another really simple app. This app would simply allow people to check how many COVID-19 cases there are near them. 

The app would be pretty simple. I found a bunch of data on Github that is updated daily into CSV files. I could simply download those and transform them into a JSON, then write some simple logic to create an API where the mobile app can get latitude and longitude - send that data to the backend and get back the number of cases for that region.

I started to create a spec document last night and I'm considering building the app in Flutter - just to try it out since it's getting a lot of attention right now. I spun up a Flutter demo app tonight and I was impressed by the performance, but not impressed by how difficult it is to integrate Firebase into iOS, Android, and Flutter itself.

I do not understand why they could not make [this demo app](https://github.com/flutter/samples/tree/master/flutter_maps_firestore) a little simpler to test out and see that it's working...  I got it mostly working after a few hours, and I'm impressed how Flutter structures their code. I have to say that at first glance, Flutter does feel a bit cleaner than React Native.

I'm excited to dig a bit deeper over the next week and I'll post an update here in a few days.