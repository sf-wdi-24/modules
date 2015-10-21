# JavaScript Data Types

| Objectives |
| :--- |
| Identify JavaScript primitive data types and know when to use them |
| Explain the difference between primitive and reference data types |
| Use the JS console to manipulate data and create objects |

## Primitives

A primitive value is represented at the lowest level of implementation of a programming language. All primitives are immutable, meaning they can't be changed.

**JavaScript has 6 primitive data types:**

  * **String:** words in quotes
  * **Number:** integer or float (decimal)
  * **Boolean:** `true` or `false`
  * **null:** non-existant object
  * **undefined:** empty variable
  * **Symbol:** identifier for object properties (<a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol" target="_blank">only in ES6</a>)

### Strings

Strings are collections of letters and symbols known as **characters**, and we use them to deal with words and text in Javascript.

```js
"John" or 'Jane'
```

### Numbers

In JavaScript, integers and floats (decimals) are the same type of object, called numbers.

**Integers**

```js
..., -1, 0, 2, 3, 4, 5, ...
```

**Floats (Decimals)**

```js
2.718, 3.14, .5, 0.25
```

## Values & Expressions

Data types like `Number` or `String` are not very useful without being able to form expressions, or combinations.

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


```

Special Number Operators

Javascript can be a little cheap with the number of operations it allows you to do. For example, how is someone supposed to square a number or cube a number easily? Luckily there is a special Math object with some very useful methods.

Taking a number to some power? Then just use Math.pow
// 3^2 becomes
Math.pow(3,2)
=> 4
// 2^4 becomes
Math.pow(2,4)
=> 16
Taking a square root
// √(4) becomes
Math.sqrt(4)
=> 2
Need a random number? Then use Math.random.
// The following only returns a random decimal
Math.random()
=> .229375290430
/**
  The following will return a
  random number between 0 and 10
*/
Math.random()*10
Since Numbers can be Floats or Integers we often want to get rid of remaining decimal places, which can be done using Math.floor.
// Remove the decimal
Math.floor(3.14)
=> 3
Math.floor(3.9999)
=> 3

## Objects

Objects are a *reference data type* that allow us to group primitives together as an array or hash. There isn't enough room in a variable to store an entire object; instead, we store a reference to another location in memory.

  Use the object literal to create objects:
  ```
  var car = { make: "Tesla", model: "S", year: 2015 };
  ```
  ```
  var cars = [car, { make: "Toyota", model: "Prius", year: 2010 }];
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

#### Example
  1. [Convert this binary data to text](http://www.binaryhexconverter.com/binary-to-ascii-text-converter):
  ```
  01100001 01110111 01100101 01110011 01101111 01101101 01100101 00101100 00100000 01100100 01101111 01100111 01110011 00100000 01100001 01110010 01100101
  ```
  2. Open the JS console and store the decoded string in a variable:
  ```
    var message = decoded_string_here;
  ```
  3. Translate from yodaspeak to regular english:
  ```
    message = message.split(", ");
    message = message[1] + " " + message[0];
  ```

#### Extra Credit
  Send the instructions for decoding via email and the message body via slack for extra security. How is this similar to public/private key cryptography?

## Further Reading
  1. [JavaScript data types and data structures [MDN]](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures)
  2. [Different ways to define an object [SO]](http://stackoverflow.com/questions/1143498/difference-between-an-object-and-a-hash)
  3. [Working with strings](http://learnjsdata.com/strings.html)
