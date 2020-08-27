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

Today, Apple and Google released [their Contact Tracker collaboration](https://covid19-static.cdn-apple.com/applications/covid19/current/static/contact-tracing/pdf/ContactTracing-CryptographySpecification.pdf). A similar protocol has already been implemented in [Singapore in an app called TraceTogether](https://www.tracetogether.gov.sg/). The idea of the protocol is that the app will allow you to trace when you have come into contact with another person who has been diagnosed with the virus. The protocol allows this to happen in an anonymized way - where, in Singapore, the Department of Health acts like a trusted 3rd party... Google and Apple actually have figured out a way to do this without a trusted 3rd party in the US? That's where this encryption protocol allegedy comes in. I am going to take a deep dive on the topic over the next few days.

In this first post, I am going to discuss bluetooth in general and then tomorrow I will discuss cryptography they used and some of the issues that have been identified in it.

The idea of the protocol is that apps will be able to tell if you came into contact with another person who has been diagnosed with COVID-19 without giving away your identity to anyone or the identity of others around you. The protocol they outlined works with Bluetooth Low Energy technology. 

## Let's talk about Bluetooth Low Energy

The two base requirements are that you have an Apple or Android smartphone and that bluetooth is ALWAYS ON on that smartphone. According to [PEW research 81% of Americans own a smartphone](https://www.pewresearch.org/internet/fact-sheet/mobile/). Out of that, [approximately 51% have Android and 47% have Apple](https://www.statista.com/statistics/266572/market-share-held-by-smartphone-platforms-in-the-united-states/). Bluetooth is probably present on close to 99% of all of the phones.

Bluetooth, however, has it's own issues. First of all, there is [intereference on the 2.4Ghz range including building materials, WiFi, and flourescent lights](https://www.goldtouch.com/stop-bluetooth-interference-messing-devices/). So bluetooth connectivity is already not greatly reliable. If you have ever used a bluetooth speaker, than you can already imagine how the bluetooth connectivity gets interrupted. Typically, I have experienced that bluetooth works best within 10-15 feet of ininterupted indoor space without even bodies in between me and a bluetooth speaker. Additionally, bluetooth cannot attach to many devices at once. It can probably capture the addresses of nearby devices, but how those get connected back to the proximity identifier is a mystery to me.

## Bluetooth "Always On" Risks

Bluetooth has also had [several](https://thehackernews.com/2018/07/bluetooth-hack-vulnerability.html) [known](https://thehackernews.com/2019/08/bluetooth-knob-vulnerability.html) [vulnerabilities](https://www.us-cert.gov/ncas/current-activity/2018/07/23/Bluetooth-Vulnerability) - and every year there is at least one new attack that comes out. I have personally seen a demo at DEFCON where someone was able to get a remote backdoor installed on an iPhone by using bluetooth to inject javascript code into the device through loading a malicious site via bluetooth sharing. This is why for years, [security researchers have warned people to turn off their bluetooth](https://www.foxnews.com/tech/turn-off-your-bluetooth-warn-security-experts) when they are not using it.

## Bluetooth Energy Usage

Finally, bluetooth has [been suspected as a bit of an energy hog for devices](https://android.stackexchange.com/questions/2535/will-constantly-having-bluetooth-on-drain-my-battery-too-fast)... especially if it's active constantly.

So, that's a short summary of Bluetooth (BLE) issues. Bluetooth implementations are not super reliable connection-wise and it also poses some serious security and battery risks to have it turned on constantly.

Tomorrow, I will dig into more details about how the protocol works from a cryptographic perspective and some of the issues there.
