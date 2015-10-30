# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60">  JavaScript Prototypes

![Nesting](http://i.imgur.com/ef4TAV9.gif)

Make a bad JS library and have people fix it using prototypes for a small site.

Show difference between instance override and global for changing what a function does.

# What is a prototype

# Why are prototypes used

# Checking for Object understanding

# Declaring functions in the constructor

# Limitations of functions in constructor

# Example with functions in constructor as a library

# Why do we use libraries

Share code and don't repeat yourself.

Sometimes you make a useful function, like `function add(x, y) { return x + y; }` which you don't want to code again. Instead save time by making a library which does this math.

In fact, that library is so common there is already a library in JS called... `Math`!

# What if the library sucks?

My first library to cause chaos (mess up people's hard work) is absolutely perfect except it doesn't work.


# Fixing a library with prototypes

# Github explore JS libraries

* [jQuery](https://github.com/jquery/jquery/blob/15ac848868e993dfe5ccd7751a94f5c8edc288bc/src/core.js#L38)
* [Bootstrap](https://github.com/twbs/bootstrap/search?utf8=%E2%9C%93&q=prototype)
* Seriously, everything including [the kitchen sink](https://github.com/mozilla/KitchenSink/search?utf8=%E2%9C%93&q=prototype)

# Challenges

## Create a library using prototypes.

Make library code which edits all divs on the current page.

Name your library.

Show someone your library.

Extend your library functionality.

Change someone else's library.
