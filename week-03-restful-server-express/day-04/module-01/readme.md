# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60">  Mongo & Mongoose
| Objectives |
| :--- |
| Traverse a MongoDB using the command line interface (CLI). |
| Connect to MongoDB using Mongoose within your application. |

## Review: What are Mongo and Mongoose?

<img src="http://i.imgur.com/MVaVKG8.gif" />

> MongoDB (from humongous) is a cross-platform document-oriented database. Classified as a NoSQL database, MongoDB eschews the traditional table-based relational database structure in favor of JSON-like documents with dynamic schemas (MongoDB calls the format BSON), making the integration of data in certain types of applications easier and faster. Released under a combination of the GNU Affero General Public License and the Apache License, MongoDB is free and open-source software. <a href="https://en.wikipedia.org/wiki/MongoDB" target="_blank">WikiPedia</a>

Wow, hella hardcore... NO.

Let's extend our challenge from this morning and speak about Data.

For this challenge, open up your solution from the challenge this morning and we'll draw parallels between RDBMS and noSQL or document stores.

##RDBMS vs noSQL
A great analogy from a fellow on StackOverflow:
> "NoSQL databases store information like you would recipes in a book. When you want to know how to make a cake, you go to that recipe, and all of the information about how to make that cake (ingredients, preparation, mixing, baking, finishing, etc.) are all on that one page.
>
> SQL is like shopping for the ingredients for the recipe. In order to get all of your ingredients into your cart, you have to go to many different aisles to get each ingredient. When you are done shopping, your grocery cart will be full of all the ingredients you had to run around and collect.
>
> Wouldn’t it be nicer if there was a store was organized by recipe, so you could go to one place in the store and grab everything you need from that one spot? Granted you’ll find ingredients like eggs in 50 different places, so there’s a bit of overhead when stocking the shelves, but from a consumer standpoint it was much easier/faster to find what they were looking for."

-<a href="http://stackoverflow.com/questions/14428069/sql-and-nosql-analogy-for-the-non-technical/14428221#14428221" target="_blank">mgoffin, Jan 20 '13 at 19:15</a>

## Mongo & Mongoose setup

1. In the terminal, add Mongoose to your TodoApp's node modules.

  ```zsh
  npm install --save mongoose
  ```

2. In `server.js`, require Mongoose and connect to the database you're using for your application.

  ```js
  // server.js

  var mongoose = require('mongoose');
  mongoose.connect('mongodb://localhost/catchphrasely');
  ```

  <details>
    <summary>What's a connection string?</summary>
    `mongodb://localhost/catchphrasely` is a string formatted by specifications provided by the Mongoose package in order to connect to a Mongo DB database on your local system named `catchphrasely`.
  </details>

3. At this point, if you haven't already created the database you're using, do so in the terminal. You'll need to start up MongoDB by running:

  ```zsh
  mongod
  ```

  **Note:** If you already have an instance of MongoDB running, you'll get an error at this step. If that's the case, you can move on to the next step, since MongoDB is already running!

4. In a separate terminal tab, create and connect to your database. In the example, our new database is called `catchphrasely`.

  ```zsh
  mongo
  use catchphrasely
  ```

## Explore the cli

Typing in `mongo` from your shell connects to your local MongoDB instance by default. Now that we're there let's look over how to navigate our new database system.

Now we'll go over <a href="https://scotch.io/tutorials/an-introduction-to-mongodb" target="_blank">this scotch</a> tutorial while exploring what these commands actually mean using <a href="https://docs.mongodb.org/manual/reference/mongo-shell/" target="_blank">Mongo's documentation</a>.
