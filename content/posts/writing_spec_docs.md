+++ 
draft = false
date = 2020-04-06T14:54:45-07:00
title = "The Importance of Writing Good Spec Docs"
slug = "" 
tags = []
categories = []
thumbnail = "images/benobi-one.png"
description = ""
+++

Writing spec documents is an important aspect of building a product. Even if I am not working with a team, it's very useful as a tool to think through all of my product interactions and explain how they will work. If you cannot explain it very simply, then you will not be able to build it.

In addition, with a team, it's a very useful way to get feedback and "buy-in" from your team. If you cannot convince your team that something should be built a certian way, then you probably should not be building it. 

The structure of the spec is really dependent on what you are building. I like to break down spec documents by each feature - for exmaple: authentication, image upload, and view image gallery.

## Spec Document Minimum Requirements

The spec document should answer the following questions at a minimum:

1. What is this feature for?
2. Who will use it? (Is this for users, superusers, or internal to your company?)
3. How will they use it? (Exact steps.)
4. What other features does this affect? (Those features might have separate documents that are linked.)
5. What technology is planned to be leveraged? (3rd party libraries, or SDKs should be mentioned here.)
6. How will we know when this feature is completed? (Acceptance criteria that everyone can agree upon.)

Now, you will have something that everyone can look at and agree upon. It might seem like a lot of work to do this for describing how a user logs into your app - but, it's not as complicated as letting your team figure this out on their own and then find out that it's done in a way that disagrees with your company's ethos or best practices in some way.

## How do you know when a spec doc is done?

There is a way to know when you are done. Whenever no one has any more questions about what you are building based on reading the spec document, then you are good. The two most critical people to understand the document fully is the developer and the product owner.