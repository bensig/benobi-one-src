+++ 
draft = false
date = 2020-04-11T20:22:31-07:00
title = "Apple and Google Contract Tracker - Part 2"
slug = "" 
tags = []
categories = []
thumbnail = "images/benobi-one.png"
description = ""
+++
This is part 2 - continuing from [yesterday's post]({{< relref "posts/apple_google_contact_tracker" >}}) about the implementation choice of bluetooth. This part 2 post is specifically to discuss a breakdown of the encryption implementation.

I thought it was pretty interesting that Google chose to use homomorphic encrpytion. First time I have seen that from them.

Here is a great breakdown of how it works from Moxie Marlinspike - creator of Signal:

{{< tweet 1248707316997750784>}}

The "daily tracing key" is like an "anonymized" daily identifier for your device. Your device will generate one "daily key" using an algorithm and then generate some unique "proxmity identifiers" based on that tracing key. Proximity identifiers are generated each 15 minutes and every phone will keep track of all of the proximity IDs that it has seen + when and where.

Why is this concerning?

Several reasons, for one thing - if you are constantly encountering the same people daily, then deriving your identity would not be that hard if you can know a few of the other people's identities.

{{< tweet 1248707317836574720>}}

{{< tweet 1248707318646067202>}}

{{< tweet 1248707319451402240>}}

{{< tweet 1248707320311238659>}}

{{< tweet 1248707320311238659>}}

{{< tweet 1248707321154293760>}}

{{< tweet 1248707321980575747>}}

{{< tweet 1248707322794278912>}}

{{< tweet 1248707323729563648>}}