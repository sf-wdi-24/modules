# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> Object Oriented Programming

| Objectives |
| :--- |
| Build practical and useful objects using Javascript constructors |
| Demonstrate a working knowledge of  object properties and methods  |
| Convert previous projects to utilize Object Oriented Programming techniques |

## What is an Object?

As of today, we have been writing our Javascript code mainly using only functions, Strings, integers, and Arrays.   This has allowed us to parse through data objects given to us and reach out and pull data from the internet!  These are all great accomplishments, but like everything else in the world of programming, there is always a more efficient way of implementing what we have done.

Here's a truncated version of some data we might see from GitHub.  Take some time to study the structure and the data types within the data object.

```javascript
data = {
    school: "General Assembly",
    city: "San Francisco",
    course: "Web Development Immersive",
    course_id: "WDI24",
    classroom: "7",
    students: [{
        id: 0,
        last_name: "Abeyta",
        first_name: "Adam",
        github_username: "abeytaadam"
    }, {
        id: 1,
        last_name: "Lee",
        first_name: "Alan",
        github_username: "alanlee35"
    }, {
        id: 2,
        last_name: "Massey",
        first_name: "Andre",
        github_username: "DreTGiant"
    }]
}


```

-  Based on our experience in class so far and your familiarity with the above object, consider the following as you read further:
	- How many of the properties in `data` are Strings?
 	- How many of the properties are Arrays?
 	- If there is an array, what is the array data type?

The `data` object is a grouping of key & value pairs (known as properties) that describe our class, WDI24.

```javascript
school: "General Assembly"
```
In the line above, `school` is the **key** and `"General Assembly"` is the **value**.

To access this property, we can use dot-notation or bracket-notation on the key to have the corresponding value returned.

 ```javascript
 var GA = data.school //General Assembly
 ```

`GA` has the value `General Assembly`.

To access an array within an object, the method is similar to accessing any other property.  The property `students` is an array of Objects.  To access that array and assign it to a variable, we simply perform the following:

 ```javascript
 var studentArray = data.students //students
 ```
The `data.students` array is now accessible  by using `studentArray` instead.
Declaring variables and defining them as portions of a larger object helps us create readable and followable code.

*We can assume that an Object is a collection of properties (key & value pairs) that all have some sort of relationship and are connected logically to one another.*

### Quick Challenge
- Copy the object above and save it to a javaScript file, `data.js`
- Add some properties that logically fit into an object describing our class (address, floor number, and a list of instructors.
- Run 'node' in your console and copy the contents of your `data.js` file into it.
- Use the node console to drill down into you newly modified data object!

If everything worked out, you should have a fully functioning data object, only now with even MORE properties with us to play with!


## Creating an object
For relatively straightforward and small objects, it is perfectly fine to declare them as a variable and define them, as we did with `data.js`.  This is known as a *Literal* object definition.
Here. I'll make you a flower using the *Literal* method:

```javascript
// Literal Object Definition
var flower = {
	color : "red",
	petals : 32,
	smellsPretty : true
}
```

 Now let me make you a flower using the preferred *Constructor* method:

 ```javascript
 // Constructor Object Definition
 function Flower(){
 	this.color = "red";
 	this.petals = 32;
 	this.smellsPretty= true;
 }
 ```

The Literal definition of an object creates one single objected called flower.  There are no other flowers, just that one single object we created.  The constructor method is actually a function that creates a unique object every time it is called.  Below we will create a new variable `rose` that will use the constructor method to create a new object.

```javascript
var rose = new Flower();
```

Let us break down a couple concepts introduced with this new line of code:
- The capitalization of `Flower` lets everyone know that `Flower` is an object constructor.  Calling `Flower()` will return a `Flower` object.
- The `new`before our function call lets javascript know that we are creating a new object that will be independent of any other object.
- We call the flower function, which creates an object with the three pre-defined properties already made.  Our object is ready to go!

<img src = http://www.mzephotos.com/wallpapers/roses/red-rose-1024x768.jpg width = 75%>

Accessing the properties of our new `rose` object is the same as accessing our properties from data: we use dot or bracket notation.

```javascript
var color = rose.color // red
var petalCount = rose.petals // 32
var smellsNice = rose.smellsPretty //true
```

If we wanted to create yet ANOTHER flower, all we have to do is call our function just like we did above.  This time, lets make an object called `lily`.

```javascript
var lily = new Flower();
```

We can access the properties of `lily` in the same manner as we did with `rose`.

```javascript
var color = lily.color // red
var petalCount = lily.petals // 32
var smellsNice = lily.smellsPretty //true
```

## Changing an Object's properties
I don't know about you, but I generally like my Lillies yellow. I have also never heard of a lily with 32 petals, holy smokes!  Can we change our `lily` object to better reflect my perfect lily? You bet!

```javascript
// Changing object property values
lily.color = 'yellow';
lily.petals = 6;
```

That's more like it!  To change the value of the lily object properties. we simply access them with dot or bracket notation.  We then follow with an equals and a new appropriate value.  Couldn't be easier!

<img src = https://seniorhikerphotos.files.wordpress.com/2012/06/lilysarina12052301.jpg width = 75%>

## Object Methods
One of the most powerful features of Javascript Objects are Methods.  Methods are *"functions"* that are predefined and built into an object.  We all know and love the array Methods `forEach()`, `map()`, `filter()`, and `reduce()`; these are all Methods of the Array object.  We use arrays so much that Javascript automagically creates them from an Array constructor without us having to instantiate them like we did above with the flowers.  Thanks, Javascript!

Lets make a simple method in the flower object that outputs to the console whenever we call it.


```javascript
function Flower(){
    this.color = "red";
    this.petals = 32;
    this.smellsPretty= true;
    // Demonstrates a simple method in an object
    this.sniff = function(){
        console.log("Sniff Sniff Sniff!");
    };
}
```

We now have a method inside our flower object called `sniff`.  When we call it, the console will display "Sniff Sniff Sniff!" as predicted.

Lets add another method that takes an argument and returns a response.

```javascript
function Flower(){
    this.color = "red";
    this.petals = 32;
    this.smellsPretty= true;
    // Demonstrates a simple method in an object
    this.sniff = function(){
        console.log("Sniff Sniff Sniff!");
    };
    // Demonstrates use of arguments with methods
    this.smellsGood = function(answer) {
    	if (answer) {
    		return 'This flower smells amazing!';
    	} else {
    		return 'What a noxious weed!';
    	}
    };
}
```
Methods can also access properties within the object with the `this` identifier then using dot or bracket notation.  Check out the method `describe()` below for an example.

```javascript
function Flower() {
    this.color = "red";
    this.petals = 32;
    this.smellsPretty= true;
    this.sniff = function(){
        console.log("Sniff Sniff Sniff!");
    };
    // Demonstrates use of arguments with methods
    this.smellsGood = function(answer) {
    	if (answer) {
    		return 'This flower smells amazing!';
    	} else {
    		return 'What a noxious weed!';
    	}
    };
    // Demonstrates use of local object variables
    this.describe = function(answer) {
        alert("This flower is " + this.color + ".");    
	}
}
```

### Quick Challenge - He loves me, he loves me not...
Create an object method for flower that will play the old game ['He loves me, he loves me not...'](https://en.wikipedia.org/wiki/He_loves_me..._he_loves_me_not)
- Count down from the petal number down to 1
- Alternately display 'He loves me' or 'He loves me not' to the console for each petal count decrement.
- Display the final phrase with an exclamation; that's the end of the game!


There are many more aspects to objects that we will discover tomorrow.  For now, play with objects and think up some great object examples that we might use in class.

PS. Here is the literal equivalent of the flower constructor with all of the methods intact:

```javascript
var flower = {
    color :"red",
	petals : 32,
	smellsPretty: true,
    sniff : function(){
        console.log("Sniff Sniff Sniff!");
    },
    // Demonstrates use of arguments with methods
    smellsGood : function(answer) {
        if (answer) {
            return 'This flower smells amazing!';
        } else {
            return 'What a noxious weed!';
        }
    },
    // Demonstrates use of local object variables
    describe : function(answer) {
        alert("This flower is " + this.color + ".");    
    }
}
```

### Home Work

Once you've finished the in-class challenges, you can go <a href="https://github.com/sf-wdi-24/OOP-challenge" target="_blank">here</a> for the homework.

Further Suggested Reading:
- [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Introduction_to_Object-Oriented_JavaScript)
- [Tutsplus](http://code.tutsplus.com/tutorials/the-basics-of-object-oriented-javascript--net-7670)
