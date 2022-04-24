# When Are We Free is a simple scheduling application for coordinating free days in a friend group.

[![Build Status](https://helpotters.semaphoreci.com/badges/when_are_we_free/branches/master.svg?style=shields&key=9668608a-3e71-4cf9-bf3c-020206a0310a)](https://helpotters.semaphoreci.com/projects/when_are_we_free)
Ruby v.3.0.2

## Who is this for?
The goal here is create a simple interface that allows for event creation and voting in seconds.

Some people don't want to coordinate every combination of free days to determine the perfect overlap between everyone. 
Some people don't want to create complicated polls where users have to add their timeslots for each day. 

Sometimes we just want a simple and quick answer to *'When are we all free?'*

Make those social events happen. Don't let logistics get in the way of seeing the people you like spending time with.

## Features and Design Choices

The application has limited choices for ease-of-use. Events have an opinionated duration of either till the end of the current week or the end of the current month. 

Should any of these events be too short, (ie. 2 days on a week event), it will rollover to the next week/month as well.
 
 
 ## Deployment
 
 I set this application up with Semaphore CI and Heroku.




