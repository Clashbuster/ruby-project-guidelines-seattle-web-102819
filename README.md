# Taylor's Wiktionary

This is my wiktionary

## What is it?

For starters, it's a living, breathing, working dictionary. I put approximately 102,219 words and 220,000 definitions in this dictionary.

If it were a book it would be about 5525 pages long containing approximately 2,750,000 words.

This bad boy contains approximately 60% of all enlighs words in circulation.

But wait there's more! It's more than just a dictionary. It's a user generated, maintained, and edited dictionary. Users can sign in and edit existing definitions as well as propose their own words. It also keeps track of User data.

### Why does this need to exist?

This is a useful tool because spoken languages are dynamically typed.

Every word we use every day only means something because we have agreed it means something. We assume definitions for many different words and most of us have a relatively similar idea of what any given word means most of the time. That is, until we don't.

Many factors can create a rift in understanding. Intellectual, cultural, social, or geographical differences are the primary culprits.

As programmers we should understand this more than most.

Consider this thought experiment: 

"I accessed the SQL database which contained many seperated instances of data that were stored as objects. Or were they hashes?"

If you said this to a brick layer he would have no idea what were saying even though you're using words that he has heard before. The layer knows that an object is a thing, like a baseball, and an instance is like a short period of time.

You know what objects and instances mean in the context of programming, but the layman does not. This wiktionary offers an opportunity for all of these additional contexts to exist, but even more, allows the context to evolve faster than a written dictionary.



### How is it made? + some structural information about the app

This is a command line interface app.

It uses active record which is superimposed over a three sqlite3 tables. Each table persists information but the primary information kept in each table is pertinent to the user, definition, and word.

The various menu screens query the database in order to return information to the screen.

The methods in the program exist within a class, and some information is stored temperarily in instance variables. This allows me to repeatedly reference some basic information that is only relevant to each instance of the program being run.

For example, the current urser, current word to display, and current definitons to display are all kept in instance variables. Since there cannot be multiple users logged into one machine running one instance this was a convenient way to reference this data. 

But, don't be mislead by the above statement. In theory, the method I am using to keep this instance information should not clash if seperate instances of the app were being run on different machines. (This is all very speculative talk considering the app is not connected to any sort of network to begin with.)



### Some problems I ran into

The biggest problem I had was after 6 hours of programming it becomes a little difficult to read, but I discovered if I muscle through it my instincts take over and the code I right still keeps working.

Seeing that this is a command line interface app it is very difficult to have a good user experience where the user can input several inputs on a single screen. The best way I was able to combat this with my current knowledge was to simply put each entry on a seperate screen with redundant context outputted to the screen so the user would be able to keep track of what they were supposed to be entering.

Other than that it was difficult to find seed data that did not require a lot of money. I was hell-bent on seeding my database with real data from a real dictionary because I wanted this to be a real app that would actually be useful. I accomplished that, but only after scouring the internet for a very long time until I found a collection of dictionary data that was not behind a paywall.

Most high profile dictionaries (english oxford, websters, words, ect) require you to go through an API service that starts charging after 1000-2500 queries. Additionally, most of the API's could only be queried per word. Considering most dictionaries contain at least 60,000 words with definitions, you can see why those options were inadequate for a me (a student)

My instructor helped me find an open souce dictionary on github and I used their files for seed data. (link for transparency)
https://github.com/matthewreagan/WebstersEnglishDictionary


## Conclusion

This was a fun project and I'm glad it all works. I am positively stoked about the fact that this app is a real thing that is useful. If nothing else, it still operates as a good old fashioned dictionary. You can use it to check if your words in boggle or scrabble exist.

Cheers.