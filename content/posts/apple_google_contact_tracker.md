+++ 
draft = false
date = 2020-04-10T22:16:52-07:00
title = "Apple and Google Contract Tracker - Part 1"
slug = "" 
tags = []
categories = []
thumbnail = "images/benobi-one.png"
description = ""
+++

Today, Apple and Google released [their Contact Tracker collaboration](https://covid19-static.cdn-apple.com/applications/covid19/current/static/contact-tracing/pdf/ContactTracing-CryptographySpecification.pdf). I'm going to address this in 2 posts. First, to discuss bluetooth in general and then tomorrow I will discuss cryptography they used and some of the issues that have been identified in it.

The idea of the protocol is that apps will be able to tell if you came into contact with another person who has been diagnosed with COVID-19 without giving away your identity to anyone or the identity of others around you. The protocol they outlined works with Bluetooth.

## Let's talk about Bluetooth

The two base requirements are that you have an Apple or Android smartphone and that bluetooth is ALWAYS ON on that smartphone. According to [PEW research 81% of Americans own a smartphone](https://www.pewresearch.org/internet/fact-sheet/mobile/). Out of that, [approximately 51% have Android and 47% have Apple](https://www.statista.com/statistics/266572/market-share-held-by-smartphone-platforms-in-the-united-states/). Bluetooth is probably present on close to 99% of all of the phones.

Bluetooth, however, has it's own issues. First of all, there is intereference on the 2.4Ghz range. So bluetooth connectivity is not great. Typically, I have experienced that bluetooth works best within 10-15 feet of ininterupted indoor space. Additionally, bluetooth cannot attach to many devices at once. It can probably capture the addresses of nearby devices, but how those get connected back to the proximity identifier is a mystery to me.

Bluetooth has also had [several](https://thehackernews.com/2018/07/bluetooth-hack-vulnerability.html) [known](https://thehackernews.com/2019/08/bluetooth-knob-vulnerability.html) [vulnerabilities](https://www.us-cert.gov/ncas/current-activity/2018/07/23/Bluetooth-Vulnerability) - basically every year there is another one that comes out. I have personally seen a demo at DEFCON where someone was able to get a remote backdoor installed on an iPhone by using bluetooth to inject javascript code into the device through loading a malicious site via bluetooth sharing. This is why for years, [security researchers have warned people to turn off their bluetooth](https://www.foxnews.com/tech/turn-off-your-bluetooth-warn-security-experts) when they are not using it.

Finally, bluetooth has [been suspected as a bit of an energy hog for devices](https://android.stackexchange.com/questions/2535/will-constantly-having-bluetooth-on-drain-my-battery-too-fast)... especially if it's active constantly.

So, that's a short summary of Bluetooth (BLE) issues. Bluetooth is not super reliable and it also poses some serious security and battery risks to have it turned on constantly.

Tomorrow, I will dig into more details about how the protocol works from a cryptographic perspective and some of the issues there.