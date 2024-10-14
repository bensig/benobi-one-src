+++ 
draft = false
date = 2020-04-11T20:22:31-07:00
title = "Apple and Google Contact Tracing - Part 2"
slug = "" 
tags = []
categories = []
thumbnail = "images/benobi-one.png"
description = ""
+++
This is part 2 - continuing from [yesterday's post]({{< relref "posts/apple_google_contact_tracker" >}}) about the implementation choice of bluetooth. This part 2 post is specifically to discuss a breakdown of the encryption implementation.

I thought it was pretty interesting that Google chose to use homomorphic encrpytion. First time I have seen that from them.

Here is a great breakdown of how it works from Moxie Marlinspike - creator of Signal:

{{< tweet user="moxie" id="1248707316997750784" >}}

## The "daily tracing key"

The "daily tracing key" is used to create fingerprints for your device every 15 minutes. That fingerprint is known as a proximity identifier... You will leave your fingerprint wherever you go as you move around throughout your day. You will fingerprint other people's apps as we all become a distributed data-collection center. If someone tests positive, then they will need to publish their "daily tracing keys" which will now be broadcasted to all other devices to let them know if they came into contact with that unknown person.

{{< tweet user="moxie" id="1248707317836574720" >}}
{{< tweet user="moxie" id="1248707318646067202" >}}

## "Privacy"

As soon as someone tests positive, they are essentially giving up all privacy about where they went and who they saw... Additionally, there will be beacons put up by stores, governments, and even independent researchers to gather fingerprints as people move about public spaces.

{{< tweet user="moxie" id="1248707319451402240" >}}

{{< tweet user="moxie" id="1248707320311238659" >}}

{{< tweet user="moxie" id="1248707320311238659" >}}

{{< tweet user="moxie" id="1248707321154293760" >}}

{{< tweet user="moxie" id="1248707321980575747" >}}

{{< tweet user="moxie" id="1248707322794278912" >}}

{{< tweet user="moxie" id="1248707323729563648" >}}