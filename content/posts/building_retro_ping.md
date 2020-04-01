+++ 
draft = false
date = 2020-03-31T22:40:30-07:00
title = "Retro Ping App"
slug = "" 
tags = []
categories = []
thumbnail = "images/benobi-one.png"
description = ""
+++

I built a mobile app this weekend in Swift. I'm very happy with the end product and I have already tested it out with a few friends.

I wanted to discuss a step-by-step process that I used for building it along with some gotchas and learnings. 

Here are the 15 steps I took to create this app:

1. Spec
2. Wire
3. Design
4. Code Function
5. Test Functions on Physical Device
6. Code style
7. Test 
8. Refine 
9. Submit App to Testflight
10. Work on App Store Elements
11. Test App on Testflight (various devices)
12. Refine App
13. Test App Again
14. Submit App to Apple App Review
15. Launch

I knew I wanted to build a simple app with a simple purpose: measure latency and simply say if the connection is "good" or "bad" based on the latency of the phone. 

## 1. Spec
    I still started by writing [a spec document](https://docs.google.com/document/d/1rqlgZ5ClwZSInaQxrjPydO7HCDxAnex98CSCuDp4h6w/) which outlines how the app will function. I put user stories in this format:

    "As a user, I want to do X so that I can Y." 

## 2. Wire
    I built wireframes in XD. You can see the wireframes on the spec document. They were super low fidelity. Just enough to get the idea across and to understand where things would fit on the screen generally. This answers questions that you may not have thought about in the spec: 
     * Should there be a button? 
     * Does a user need a place to find help?

## 3. Design

    In this case, I chose two images to be placeholders. I got them edited so that they were the same size and I could easily use them in the app. I put them in Preview and resized, then exported them to PNG files.

## 4. Code Functions

I had no experience with Swift at all. I started a fresh project in XCode using storyboards. The storyboards were not that complicated to understand. I click the plus symbol and I can add elements to the page. An image, a text label, etc... 

Next, those elements had to be connected to the actual code. In the Assistant mode, I was able to control-drag them over to the code to reference them. I watched video tutorials to learn more about this and I "phoned a friend" for the first time to figure out how this worked exactly. It wasn't clear to me how to name the objects so that they could be appropriately referenced in the Swift code.

For the actual app functions, I looked for ways to implement instead of invent. It's always good to avoid figuring out something simple that someone has already figured out. 

I found and installed a pod to help with the ping function, it worked without any tweaks. I setup some logic to swap the placeholder images based on the outcome of the ping (this was one of the "phone a friend" moments) - and now, I had an app that functioned... Mostly.

## 5. Test Functions on Physical Device

I ran into a gotcha. When I tried to launch it on my physical iPhone via a USB cable connected to XCode the app would crash with a weird runtime error. Strangely, the app ran fine in the SIM... This turned out to be a certificate issue since my Apple Developer Account wasn't setup properly for my personal use. There were no errors or warnings and no information online that was helpful. So, I had to figure this one out on my own through trial and error... The weird part is that I was still able to "trust" the app to install it on my phone. Also it was confusing that I was part of a few companies' ADC accounts, but that I had to pay for my own ADC account for $99/year...

## 6. Code Style

Once that was all resolved, I had a fully functioning app. I committed the code to my local git repo and I started to play with the styling. I swapped out the small images I had as placeholders for larger images. Then I worked with the constraints to get it to center on all devices (phone a friend moment 3). I added app icons [which I generatated on the web](https://makeappicon.com/) and I also created a loading page. The loading page is super limited by Apple. It basically has to be just an image. It cannot have any animation or text styling that is not embedded in an image since the app has not loaded any animations or fonts yet. 

## 7. Test Style 

Now, I tested in a few simulators on my computer and my physical phone again - but, the app looked boring with a static image... I had completed the MVP, so I figured it would be acceptible to move on to another feature that I had wanted to include in the initial public release anyway: ANIMATION! 

I searched and found a pretty sweet vaporwave animation in an MP4 which I [turned into a gif online using a website](https://www.onlineconverter.com/mp4-to-gif). I loved the retro look of this animation and it seemed to me that this would appeal to other WiFi latency nerds out there. 

## 8. Refine 

It took me some time to figure out how to get this gif to animate. As I wrote the other day, I finally figured it out from a YouTube video about how to add an animated gif to Swift. 

Once all of that was handled, I added some extra logic to swap a static image over the animated gif when the latency was over 100ms. I also added a custom font, some custom colors, and I [swapped the interface style on the iPhone so it would be seen on my dark background](https://developer.apple.com/documentation/xcode/supporting_dark_mode_in_your_interface/choosing_a_specific_interface_style_for_your_ios_app). 

## 9. Submit App to Testflight

When all of this was complete, I built an archive and pushed it to App Store Connect. Then I made a new branch called "Testflight" on my local git so that I could have a good savepoint in case I broke things. 

## 10. Work on App Store Elements

Next I started working on screenshots (which are required for the app store). These were challenging to get right since the size that I took them on my actual phone did not result in the correct pixel sizes that Apple required. Why? I have no idea, but they had to be resized in Preview.

I also had to make a privacy policy. I found this [privacy policy generator](https://app-privacy-policy-generator.firebaseapp.com/
) and a [free site to host it](https://app.flycricket.com/).

Finally, I wanted to add an App Preview video so that I would get nice unfurls when sharing the app with people. I connected my phone to my computer and recorded a video of the app with Quicktime. Once again, the dimensions of the video were wrong. I had to import the video into a new "App Preview" project in iMovie to get the aspect ratio and dimensions correct. It also had to be at least 15 seconds, so I extended it by copying and pasting the video to double it's length. 

I wrote a description, a tag line, a title, and filled out all of the little pieces on the App Store Connect forms... when I hit the submit for review button, there was another error asking me for iPad screenshots. My app was not designed to work on iPad, so I was confused. It turns out that I also had to go into my build settings to change the app from "Universal" to "iPhone only." I built a new archive and uploaded it to Apple... finally, my app was submitted for review! 

## 11. Test App on Testflight (various devices) 

Once my Testflight build was approved (takes about 24 hours), I invited friends to test it out. When I invite my friends and family to test an app, I always text and call them to let them know to check their email. Testflight emails can be lost, skipped over, or just look like SPAM. It's also confusing to people that they have to install Testflight in order to install your beta app.

## 12. Refine App

One of my friends noticed and then fixed an issue where the gif I was using seemed to skip a frame in it's animation. He made it smoother for me and I replaced it, built a new archive and uploaded it. 

## 13. Test App Again

I tested it again on my simulator, my phone, and had some of my friends test it out again to make sure that it still worked well. If not, Apple might find a problem, and once you get rejected, it can make it harder and slower to get the app approved.

## 14. Submit app

I expect that the app will be approved quickly since I have already had 5 versions approved by the Testflight App Review Team. Even though the teams are different, getting fast approvals by the Testflight App Review Team is a good step towards getting the approval from the big dogs up in Cupertino. 

I'm excited to get the app released and I'm already thinking about a version 2. I'm very satisfied with the MVP product. I know that there are more things I wanted to include, but I'm very happy to have gotten teh product shipped so quickly. I can always add more later! 

## 15. Launch

I set the app to release manually. This way I will be able to look over the description and images once more before it goes out to the App Store. After the app is released, I would need to create a new version of the app to update any App Store elements. 

Once it's approved, I will check over that stuff and click the button to distribute the app globally! That's my favorite part of building something. Next, I will need to make a plan to promote the app and get some reviews.