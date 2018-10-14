# eventByte
iOS app to share and view free-food events on campus

## Inspiration
We recognized that college students are hungry zombies that are constantly in search for free food and late night snacks. We also noticed that clubs and organizations on college campuses host events that offer free food, snacks, and drinks to encourage students to attend. EventByte allows people to share and grab a byte (;D) at college campus-based events that offer free food.

## What it does
EventByte has two main features.
1. A user can post an event without any sign in. They can add the event name, event date and time, event location, event description, organization name, and organization contact information (email).
2. A user can view all the events in the event database, submitted by other users.

## How we built it
The app was developed on Xcode with Swift, which was connected to a MySQL database. We used Amazon's Relational Database Service (RDS) to store our event database and Amazon's Elastic Compute Cloud (EC2) to run our php program that connects MySQL to our app.

## Challenges we ran into
1. Setting up the AWS and EC2 account
2. Using php to connect the SQL database to our iOS app

## Accomplishments that we're proud of
We are proud of learning Swift, Xcode, php, and MySQL for the first time, while also creating a product that can be practical and directly benefit our college community and our peers. It has the potential to increase student involvement in club activities and resolve the college student hunger crisis.

## What we learned
We have learned new technical skills, such as using relational databases and new languages (php and Swift). 

## What's next for EventByte
If we had more time, we would have worked on 
1. requiring some fields in the "Add an Event" action.
2. improving the UI and design.

Future improvements include
1. creating user accounts to allow event information change and deletion
2. adding new event attributes, such as event end-time and tags (for food type)
3. automatically deleting the events from the database after the event is over
4. connecting to other social media platforms, such as Facebook events or EventBrite
5. creating separate databases by college campus
6. allowing user to filter or sort the displayed list of events by date, time, etc. 