+++ 
draft = true
date = 2020-08-26T18:41:59-07:00
title = "Evolved Scrum"
slug = "Evolved Scrum" 
tags = []
categories = []
thumbnail = "images/benobi-one.png"
description = "A better system for approaching product development."
disclosure = []
+++
The goal of this post is to discuss a system that I call "Evolved Scrum" which is working for our team and how we have adopted our own methology for spending more time building, less time meeting, and doing a better job of managing our time and getting features over the finish line.

A big part of the system is that it puts the responsibility of deciding a scope on the developer instead of the project manager. This will make more sense when you see the example below.

## Secret of Scrum

It's basically an open secret that scrum rarely works. Many oldschool devs I know think scrum is a load of crap. There are some good aspects to scrum methodology and I think it's important to take what works for each team you are working with and also look at what is not working.

Sticking to a rigid system is the opposite of *agile*. Agile is a summarized [quite well on this Reddit thread](https://www.reddit.com/r/explainlikeimfive/comments/4gityr/eli5_what_is_an_agile_environment/d2i9318?utm_source=share&utm_medium=web2x&context=3):

```
Only work on the most important things at any given point in time
Break those things into small bite-sized tasks for individuals to work on autonymously
Catch up for about 10-20 minutes every morning on progress
Meet at the end of a set of 'things' to plan the next set of 'things'
```

But there is another principle that is missed: requirements and solutions must *evolve*. And sure... in our retrospective we would discuss what to Start, Stop, or Continue - but overall, what we really needed to do was stop wasting time on meetings and spend more time building.

## Scrum Failed Us

Personally, I find sprint planning, review, and retrospective to be really tedious, boring, and unengaging. Additionally, the methodology of assigning difficulty to tasks that is not based on time, but a system of points seems like a waste of time. Each developer would basically guess how many difficulty points to assign to things and the process of following up and adjusting points as we go was mega-tedious.

After months of sprints that were overdue, incomplete, and bleeding into the next one and the next one... We were quickly approaching our deadline for launch, and so, we adopted a new system about a month ago which is really working for us to move faster.

One big realization we had is that there are 3 essential variables to consider when building a feature: time, developers, and scope.

The good thing about my evolved scrum system is that it is less likely to fail since it addresses these variables in a different way that is not part of scrum:

**Time**

When we are building on a deadline, time is constant.

**Developers**

The number of developers is also considered a constant. Hiring and training new developers is very costly - it takes time away from building and can actually result in things taking longer or getting built badly.

**Scope**

This meant that only the scope of each feature is variable. The scope needed to be determined based on the time and number of developers. We can always iterate on a basic function - as long as we actually get it functioning.

## Evolved Scrum Actors

Let's define the actors and pieces of this new evolved scrum system.

* **Product Owner** represents the business interests / vision of the product.
* **Project Manager** is responsible for the daily and weekly management of the product build process.
* **Build Team** is a team of at least 2 developers responsible for delivering on an epic. It's a good idea to consider the spec of the epic when you design a build team. For example, you may want to pair a jr and sr developer together on an easy epic and 2 sr devs on a difficult epic.
* **Main Epic** is the workable scope of a feature, normally expressed as "user stories" - "As a user, I can do x so that I get benefit y."
* **Polish Epic** is planned time for addressing issues to fix bugs or polish the main epic.
* **Stretch Goals** an epic can contain goals such that - if the epic is completed ahead of the allotted time, there is built-in additional goals.
* **Designer** works closely with the **Build Team** and **Project Manager** to make sure everything 

## Evolved Scrum Process

Basically, our new evolved scrum system takes the dream version of a feature with all of the bells and whistles imagined by the product owner and then using a process to agree on an MVP version of each feature.

1. **Product Owner** builds a list of the most important features to include in an upcoming release. This can include a list of *stretch goals*.
2. **Project Manager** meets with the **Product Owner** to build detailed spec documents of these features including all of the wishes and dreams of the . Ideally, these spec documents include user stories and either designs or screenshots of how a similar feature works in another app.
3. **Project Manager** takes each features and builds an empty epic in Zenhub by setting the start and end dates with a maximum of 2 weeks + an additional empty epic with 2-3 days of polishing / bug fixing. Since we only have 2 **Build Teams** then there can only be 2 epics happening at any time.
4. **Epic Planning Meeting** this is the most important part of this system. In this 1 hour meeting, the **Project Manager** meets with the **Build Team** assigned to the epic and the **Designer**. Together they **break down the spec into an MVP scope that can be accomplished in the allotted timeframe** for the epic - containing only the most essential user flows. The **Build Team** is responsible for detailing out the test cases which will pass at the end of the time allotted to the epic.
5. The **Designer** now goes and builds out a prototype of how this flow will function in the MVP.
6. Once the design and epic have scope have been defined, it is signed off by the **Product Owner**.
7. The **Build Team** now takes the empty epic and builds out all of their issues that they have committed to accomplishing within the allotted timeframe.
8. There is a **Daily Stand Up (DSU)** of 10-15 minutes with the **Project Managerto**, **Build Teams**, and **Designer** to discuss the progress of each epic and discover any blockers (including missing or unclear designs). There should be no surprises at the end of the epic since there is a daily check-in.
9. **Demo** At the end of the allotted time for the epic, the entire team including the **Product Owner** does a demo / review session of the feature and a list of issues are created for the **Polish Epic**.
10. Work should only be merged into the stable branch when it completes all of the test cases and has been approved by the **Product Owner**.

## Evolved Scrum Example

Let's say that we are building a mobile app and we have the following:

* 4 weeks (20 working days)
* 4 features (2 hard, 2 easy)
* 2 frontend (FE) devs
* 2 backend (BE) devs

This assumes that we already have a detailed spec from the **Product Owner**.

We pair up 1 FE dev with 1 BE dev, now we 2 **Build Teams** that can build 2 features at the same time. These are just like trains on separate tracks.

Now, you might think that we can spend 20 days dedicated to the **Main Epic** for the feature because once a feature is built, there will be bugs and polishing - so that needs to be factored in to the  **Polish Epic**. The **Project Manager** sets up the schedule to make sure that only 2 epics are happening at the same time.

Also, not all features are created equal - some are more challenging to implement. In this example, we have 2 "easy" features which will leverage a lot of things that are already built and 2 "hard" features which have unknown difficulties. So here is how we will allocate the time:

* Hard Epic 1 - **Build Team 1**, 7 working days for **Main Epic**, 3 working days for the **Polish Epic**, starts on day 1
* Hard Epic 2 - Build Team 2, 7 working days for **Main Epic**, 3 working days for the **Polish Epic**, starts on day 2
* Easy Epic 1 - **Build Team 1**, 3 workind days for **Main Epic**, 2 working days for **Polish Epic**, starts on day 11
* Easy Epic 2 - **Build Team 1**, 3 workind days for **Main Epic**, 1 working days for **Polish Epic**, starts on day 12

The epics will finish on day 17, which leaves days 18-20 as a buffer to deal with anything additional that ALWAYS pops up. **Build Teams** can also elect to work on nights and weekends to make their deadline if they fall behind.

Now that the schedule is locked, so we have to figure out what we can build in that timeframe.

At least a few days before the epic kicks off, the build team has the **Epic Planning Meeting** with the project manager and designer. The outcome of this meeting is a list of test cases which will pass at the end off the time allotted to the epic - remember, time is a constant. This is a commitment by the developer to finish the work they chose in the allotted time. If it works for you, there can be a system of rewards for finishing on time and punishments for not finishing on time.

The **Designer** preps all of the designs needed for the **Main Epic** and the **Product Owner** signs off on the epic scope and design. This makes sure that everyone is very clear about "what it means to be done" with the epic.

The **Build Team** creates issues inside of the **Main Epic** on Zenhub and assigns all of the work to be completed.

Now, we are ready to begin work. **DSU** check-ins will be used to learn if we are on-time or not for each epic and if there are any blockers or needs.

At the end of the allotted time for the epic, the **Demo** gives everyone a chance to review the feature together.