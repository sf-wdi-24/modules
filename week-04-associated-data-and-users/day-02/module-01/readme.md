# Relationships in Mongo(ose)

#### Setup
```javascript
var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/console');

var Schema = mongoose.Schema;

```

The above code is the standard boilerplate mongoose setup that you will see in any seed.js or Model file

```javascript
/*  Console Schema */
var consoleSchema = new Schema({
	name: String,
	manufacturer: String,
	released: Date
});
```
The `Console Schema` describes a videogame console such as Nintendo, Sega, or XBox.


```javascript
/*  Game Schema */
var gameSchema = new Schema({
	name: String,
	developer: String,
	released: Date,
	// i'm telling consoles to EXPECT references to Console documents
	consoles: [{type: Schema.Types.ObjectId, ref: 'Console'}]
});
```
The `Game Schema` above describes an actual videogame such as Super Mario Bros., MegaMan, Final Fantasy, and Skyrim.

Note the specific code on line 7 within the [] brackets.  Inside the brackets we
are describing what will go inside the consoles array as we work with the database.
In this case we are telling the Game Schema that we will be putting in an ObjectId, which is that big ugly `_id` that mongoose automatically generates for us.  If you forget, it looks like this: ```55e4ce4ae83df339ba2478c6```.  That's what's going on with ```type: Schema.Types.Objectid```.  When we have the code ```ref: 'Console'``` that means that we will be storing ONLY ObjectIds associated with the ```Console``` document type.  Basically, we will only be putting ```Console``` ObjectIds inside the ```consoles``` array. Makes sense!


##Mongoose Document methods and statics
Similar to objects prototypes, we are able to write our own 'helper' methods within the Schemas and Models we make.    

```javascript
/* Game instance methods */
gameSchema.methods.findSimilarType = function(callback) {
	return this.model('Game').find({type: this.type}, callback);
}
```

The above method called ```findSimilarType()``` is called by any Document made by the `Game` model.  Any document you create from the `Game` model will have this method available to it.  


```javascript
/* Game class methods */
gameSchema.statics.search = function (name, callback) {
	return this.where('name', new RegExp(name, 'i')).exec(callback);
}
```

The above method is called a 'static' method and can only be called on the Model.  This is useful for creating more refined searches or making tedious routines easier.  

We've used static methods before!  You're by now comfortable with .find(), .remove(), and .create(); those are all methods that are called by the Model!  We're simply making our own method instead.


Now that we have our methods defined and our schemas created, lets compile them all into active models so we can start creating documents!

```javascript
/* Compiling models from the above schemas */
var Game = mongoose.model('Game', gameSchema);
var Console = mongoose.model('Console', consoleSchema);
```


Let's make two objects for our Console document and Game document creation later on.

```javascript
/* make a simple obect for Console document creation */
 var nin64 = {
 	name: 'Nintendo 64',
 	manufacturer: 'Nintendo',
 	released: 'September 29, 1996'
 }
```

```javascript
/* make a simple object for Game document creation*/
 var zelda = {
 	name: 'The Legend of Zelda: Ocarina of Time',
 	developer: 'Nintendo',
 	release: new Date('April 27, 2000'),
 	consoles: []
 }
```

Notice that consoles is empty within the Game document.  That will be filled with ObjectIds later on.



Now we will create a `Console` document using the `nin64` object we made above.  While inside the console creation callback function, we'll also create our `Game` document.  We do this inside the `Console` creation because we can easily access the newly created `nintendo64` object this is available to us as a callback return in line 3.  

After we create the `Game` document, we push the `nintendo64` console document into the `zeldaGame` consoles array.  Since we already told the Game Schema that we will only be storing ObjectIds instead of actual `Console` documents in the `consoles` array, mongoose will convert `nintendo64` to it's unique `_id` .

```javascript
 Console.create(nin64, function(err, nintendo64){
 	if(err) {return console.log(err);}
 	Game.create(zelda, function(err, zeldaGame) {
 		if(err) {return console.log(err);}
 		zeldaGame.consoles.push(nintendo64);
 		zeldaGame.save();
 		console.log('Game success: \n' + zeldaGame);
 	});
 })
```
This is the result after executing the code we've written thus far:

```javascript
{ __v: 0,
  name: 'The Legend of Zelda: Ocarina of Time',
  developer: 'Nintendo',
  _id: 55e4eb857d6157f4d41a2981,
  consoles: [ 55e4eb857d6157f4d41a2980 ] }

```
What are we looking at?
	- Line 1: __v represents the number of times the document has been accessed
	- Line 2: The name property of the Game Document we have created.
	- Line 3: The developer property of the Game Document we have created.
	- Line 4: The unique `_id` created by Mongoose for our Game Document.
	- Line 5: The consoles array with a single `ObjectId` that is associated with our Console Document.

Lets print out the Console Document `nintendo64` to make sure the `ObjectId` in consoles matches the `_id`:

```javascript

{ _id: 55e4eb857d6157f4d41a2980,
    name: 'Nintendo 64',
    manufacturer: 'Nintendo',
    released: Sun Sep 29 1996 00:00:00 GMT-0700 (PDT),
    __v: 0 }

```

Sure enough, the Game Document consoles only `ObjectId` matches the Console Document `_id`.  What's going on?  The Game Document consoles has a single `Objectid` that contians the '*address*' or the '*location*' where it can find the Console Document if and when it needs it.  This keeps our Game Document small, since it doesn't have to have so much information packed into it.  When it wants the Console Document data, it will ask for it. Until then, it's happy with just the `ObjectId` associated with it.

##The `populate()` method

When we want to finally get information from any Console Document we have inside the Game Document consoles array, we use the method call ```.populate()```.  

```javascript
Game.findOne({ name: 'The Legend of Zelda: Ocarina of Time' })
	.populate('consoles')
	.exec(function(err, game) {
 		if(err){return console.log(err);}
 		console.log(game);
 		console.log("/nI love " + game.name + " for the " + game.consoles[0].name);
 	});
```
Let's go over this method call line by line:
	- Line 1: We call a method to find only **one** Game Document that matches the name: `The Legend of Zelda: Ocarina of Time`.
	- Line 2: We ask the consoles array within that Game Document to fetch the actual Console Document instead of the `ObjectId` referencing that Console Document
	- Line 3: Since we have made a query, we can call `.exec()`, which allows us to activate a callback function within `.exec()`
	- Lines 3-5: If we have any errors, we will log them.  Other wise, we can display the entire Game Document **including** the populated consoles array.
	- Line 6 demonstrates that we are able to mix both data from the original Game Document we found **and** the referenced Console Document we summoned.  

This is the actual output from the above `findOne()` method call:

```javascript
{ _id: 55e4eb857d6157f4d41a2981,
  name: 'The Legend of Zelda: Ocarina of Time',
  developer: 'Nintendo',
  __v: 1,
  consoles:
   [ { _id: 55e4eb857d6157f4d41a2980,
       name: 'Nintendo 64',
       manufacturer: 'Nintendo',
       released: Sun Sep 29 1996 00:00:00 GMT-0700 (PDT),
       __v: 0 }
   ]
}
I love The Legend of Zelda: Ocarina of Time on the Nintendo 64

```

Now, instead of seeing **only** the `ObjectId` that pointed us to the `Console` document, we can see the **entire** `Console` document.  Notice that the `Console` document's `_id` is exactly the same as the `ObjectId` that was previously referencing it. They are one in the same!  



## Mongoose Methods and Statics calls in action

Now that we have some data in our database, we can run the custom methods and statics we've build in the beginning.

```javascript
Game.search('Zelda', function(err, success) {
 	if(err) {return console.log(err);}
 	console.log("Search Result: \n" + success);
});
```
Notice that the `search` static method is being called by the model `Game`.  This method can **only** be called by the Model, not by isntances of a Model.  In the case of our videogame/console code example, we can only use it for the Game model.  


Lastly, lets use the `.findSimilarType()` method.  This method can **only** be called by istances of a Model Document.  

```javascript
var original = new Game({
		name: 'The Legend of Zelda',
		developer: 'Nintendo',
		released: new Date('March 19, 1985'),
		consoles: []
	});
```
Above we are making a new Game Document called original for the first ever Zelda game.

```javascript
original.save();
```
After we create the Game Document named original, we then save it to send it to the Database as above


```javascript
original.findSimilarType(function(err, games){
	if (err) {return console.log(err);}
	console.log("Similar Games: \n");
	games.forEach(function(game) {
		console.log(game.name);
	});
});
```

Now we can use it to call the `findSimilarType()` method.  This will return any Document with the same type as original (any Game Document).  This is a very simple example.


##Challenges
Assemble the above code and refactor it to create your own models that use referenced documents.  Be creative and make it interesting and relevant (easier said than done.)  Create at least 5 'top-level' documents (in my case, five games) and at least 3 referenced documents (in my case, three consoles).  Demonstrate the ability to display the documents with just an ObjectId for the referenced documents.  Finally, call populate() on a query and demonstrate the **full** referenced documents as I did above with the Legend of Zelda: Ocarina of Time and the Nintendo 64.  

##Stretch Challenges
Create two methods and two statics to help you display information from your documents.
