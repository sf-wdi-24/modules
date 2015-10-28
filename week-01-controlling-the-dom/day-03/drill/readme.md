# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> JavaScript Data Types

| Objectives |
| :--- |
| Identify JavaScript primitive and reference data types |
| Use the JS console to manipulate data and create objects |
| Use JavaScript's built-in array methods to manipulate more complex data |

## Primitives

A primitive value is represented at the lowest level of implementation of a programming language. All primitives are immutable, meaning they can't be changed.

JavaScript has **6 primitive data types**:

  * **String:** words in quotes
  * **Number:** integer or float (decimal)
  * **Boolean:** `true` or `false`
  * **null:** non-existant object
  * **undefined:** empty variable
  * **Symbol:** identifier for object properties (<a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol" target="_blank">only in ES6</a>)

### Expressions

Data types like `Number` or `String` are not very useful without being able to form expressions, or combinations of values.

```js
1 + 1
//=> 2

2 - 1
//=> 1
```

You can also create expressions with strings using addition. This is called **string concatination**.

```js
"Hello, " + "world!"
//=> "Hello, world!"

"WDI " + 24
//=> "WDI 24"
```

### Number Operators

In order to perform certain number operations, JavaScript has a `Math` object with some very useful methods.

```js
// 3^2
Math.pow(3, 2)
//=> 9

// 2^4
Math.pow(2, 4)
//=> 16

// √4
Math.sqrt(4)
//=> 2

// returns a random decimal number between 0 and 1
Math.random()
//=> .229375290430

// returns a random decimal number between 0 and 10
Math.random() * 10
//=> 1.9611513358540833

// removes decimal places
Math.floor(3.9999)
//=> 3
```

**Note:** JavaScript has a global property called `NaN`, meaning "Not A Number". `NaN` is the returned value when `Math` functions fail, e.g. `Math.sqrt(-1)`. [<a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN" target="_blank">more info</a>]

## Objects

Primitive data types are not enough for most programming purposes. We need collections of data that we can use efficiently. Objects are **reference data types** that allow us to group primitives together.

```js
// array
var cars = ["Black Tesla", "Red Toyota"];

// object literal
var car = { make: "Tesla", model: "S", color: "red", year: 2015 };
```

### Arrays

Arrays are collections of data stored in sequential order.  Arrays are great for:

* Storing data
* Enumerating data, i.e. using an index to find items
* Quickly reordering data

```js
var friends = ["Moe", "Larry", "Curly"];
//=> ["Moe", "Larry", "Curly"]
```

Items in an array are indexed starting at 0 and ending at length - 1.

```js
var firstFriend = friends[0];
//=> "Moe"

var lastFriend = friends[2];
//=> "Curly"
```

JavaScript gives us some useful built-in methods:

```js
friends.length;
//=> 3

friends.indexOf("Larry");
//=> 2

friends.push("Jane");
//=> ["Moe", "Larry", "Curly", "Jane"]
```

### Object Literals

Object literals store data as key and value pairs. They're like arrays except that data isn't stored in any sorted order and keys don't have numbered indexes.

```js
// create object literal
var pet = { name: "Spot", species: "Dog", age: 4 };

// access value stored with the key "name"
pet["name"]
//=> "Spot"
pet['name']
//=> "Spot"
pet.name
//=> "Spot"
```

## Challenges

*Use the JS console in the browser to solve the challenges. Press `cmd + option + J` to open the console. Feel free to also record your responses in a file, but make sure you test them in the console!*

### Strings

1. Store your first name in a variable.
2. Concatenate your first name with your last name, and store the result in another variable.
3. Use the <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split" target="_blank">`split`</a> method to turn your string variable from challenge #2 into an array.
4. Use the <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof" target="_blank">`typeof`</a> method to show how the output of the `split` operation from challenge #3 is different from the input.

### Arrays

1. Find the fourth name in the following array:

  ```js
  var friends = [
    "Moe",
    "Larry",
    "Curly",
    "Jane",
    "Emma",
    "Elizabeth",
    "Greg",
    "Lydia"
  ];
  ```

2. Change the name "Elizabeth" to "Liz" in the friends array.

3. Add your name to the end of the `friends` array, and add another name to beginning.

4. Sort the `friends` array in alphabetical order.

5. Now we have two lists of friends below. Combine them into one list and sort them.

  ```js
  var myFriends = [
    "Rickon",
    "Meera",
    "Hodor",
    "Jojen",
    "Osha",
    "Rickard",
    "Maester"
  ];

  var yourFriends = [
    "Bilbo",
    "Boromir",
    "Elrond",
    "Faramir",
    "Frodo",
    "Gandalf",
    "Legolas",
    "Pippin"
  ];
  ```

### Object Literals

1. How would you represent the following data using an object literal? Then update John's address to "1234 Park Ln".

  ```
  John, Doe, 36, 1234 Park St.
  ```

2. How would you represent the following data using a combination of object literals and arrays?

  ```
  Jane, Doe, 32, 1239 Spark St.
  Mary, Doe, 31, 1231 Spark St.
  Greg, Doe, 34, 1214 Park St.
  Harriet, Doe, 32, 1324 Park St.
  ```

## Stretch Challenges

1. I have a list of favorite foods below. If "Popcorn" is my favorite food and "Potato chips" my second favorite, how would you find the rank of another food. Try "Pho". **Hint:** Look up the `indexOf` array method.

  ```js
  var foods = [
    "Popcorn",
    "Potato chips",
    "Shrimp",
    "Tacos",
    "French toast",
    "Crab",
    "Pho",
    "Lasagna",
    "Brownie",
    "Lobster",
    "Donuts",
    "Ice cream",
    "Hamburger",
    "Sushi",
    "Chocolate",
    "Pizza"
  ];
  ```

2. I made a mistake with my favorite foods. How can I find the index of "Donuts" and remove it? **Hint:** Look up the `splice` array method.

3. My friends want to know what my 5th to 10th favorite foods are. **Hint:** Look up the `slice` array method.

4. How would you sort the list of names below? **Hint:** Use string and array methods.

  ```js
  var friends = "Moe,Larry,Curly,Jane,Emma,Elizabeth,Greg,Lydia";
  ```

## Resources

* <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures" target="_blank">JavaScript data types and data structures</a>
* <a href="http://learnjsdata.com/strings.html" target="_blank">Working with Strings</a>
* <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array" target="_blank">Array - JavaScript</a>
