+++ 
draft = false
date = 2020-04-02T10:52:22-07:00
title = "Lightning fast performance with JAMstack"
slug = "" 
tags = []
categories = []
thumbnail = "images/benobi-one.png"
description = ""
+++

This website has been built with serverless architecture using [JAMstack](https://jamstack.org/). 

The speed of this architecture is really unparalleled. The trick is that I am delivering static content on CDNs. 

The entire source code for this site is hosted on [GitHub](https://github.com/bensig/benobi-one-src). I have written a previous post about [building this site]({{< ref "/posts/hugo_deployment_to_github" >}}). 

## Blazing Speed 

Take a look at the blazing [performance](https://developers.google.com/speed/pagespeed/insights/?url=benobi.one&tab=desktop&hl=en) of https://benobi.one - the site usually gets a score of 95-100 in terms of speed. You can test this against any other site using that some Google tool.

The reason that site speed is important is not just because [Google says so](https://searchengineland.com/google-speed-update-page-speed-will-become-ranking-factor-mobile-search-289904) - but also that [if your site takes more than 3 seconds to load, 25% of users will click away](https://neilpatel.com/blog/loading-time/?wide=1).

I have not seen a faster architecture than this and I would suggest that it becomes a new standard for sites in the future. 

I definitely plan to use this architecture in the future where it makes sense.