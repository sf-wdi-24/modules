# JavaScript Data Types

| Objectives |
| :--- |
| Identify JavaScript primitive data types and perform basic expressions on them |
| Explain the difference between primitive and reference data types |
| Use the JS console to manipulate data and create objects |

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
//=> 4

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
friends.length();
//=> 3

friends.indexOf("Larry");
//=> 2

friends.push("Jane");
//=> ["Moe", "Larry", "Curly", "Jane"]
```

### Object Literals

Object literals store data as key and value pairs. They're like arrays except that data isn't stored in any sorted order and keys don't have to numbered indexes.

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

1. Store your first name in a string variable
2. Concatenate your last name with your first name
3. Use [`split`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split) to turn your string variable into an array
4. Use [`typeof`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof) to show how the output of [`split`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split) is different from the input
5. Define a new array and concatenate the first and last elements

## Stretch Challenges

1. Explain why `null == undefined` and `null !== undefined` are both true statements.
2. Find a partner to exchange secret messages with
  * How you encode your message is up to you.
  * You might want to [convert your message to binary](http://www.binaryhexconverter.com/ascii-text-to-binary-converter) and/or use some built-in JS functions ([`slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/slice), [`replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace), etc) to obscure the data you are sending.
  * Get creative and make sure to include detailed instructions so that your partner knows how to decode the message.

## Further Reading

1. [JavaScript data types and data structures [MDN]](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures)
2. [Different ways to define an object [SO]](http://stackoverflow.com/questions/1143498/difference-between-an-object-and-a-hash)
3. [Working with strings](http://learnjsdata.com/strings.html)

<!-- Lesson notes: "" and '' for strings, var and camelCase, JS comments -->
