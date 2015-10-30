# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> JavaScript Control Flow

## Objectives  

| Students will be able to... |
| :--- |
| Predict the output of boolean logic expressions. |
| Describe the structure of `if/else` and `switch` statements. |
| Explain the purpose of `for` loops and `while` loops, and when to use each. |
| Implement `if/else` logic, `for` and `while` loops, and combinations. |

## Motivation

![Rube Goldberg Control Flow](http://i.kinja-img.com/gawker-media/image/upload/anqmmlo9solocvayilwv.gif)

"Control flow" refers to the way our computers move through a program's code. Understanding control flow allows us to trace the flow of a program based on its code. This skill is essential for programming in every language and paradigm.  In particular, **conditionals** and **loops** are fundamental to understanding modern programming languages.

## Boolean Logic

At the very lowest level, computers understand our instructions as sequences of 1s and 0s. This "binary code" drives everything a computer does, from outputting text in the terminal, to displaying complex video game graphics, to communicating with other computers across the Internet. 

Boolean logic is the closest web developers need to get to thinking about binary code. In boolean logic, every value is either true or false.

```js
typeof(true)    // boolean
typeof(false)   // boolean
```

### Basic Boolean Operators

| English | "and" | "or" | "not" or "bang" | "double bang" |
| ------------- |:-------------|:-------------|:-------------| :------- |
| Javascript | `&&` | &#124;&#124; | `!` | `!!` | |
| e.g. | `a && b` | a  &#124;&#124; b | `!b` | `!!b` |
| English | A and B | A or B | not B | not NOT B |

### Boolean Comparison Operators

| strict equality | loose equality | not strictly equal | not loosely equal | greater than | less than | greater than or equal to | less than or equal to |
| ------------- |:-------------|:-------------|:-------------|:-------------|:-------------|:-------------|:-------------|
| `===` | `==` | `!==` | `!=` | `>` | `<` | `>=` | `<=` |

## Conditinals

![commuter flow chart](https://camo.githubusercontent.com/f545891799690188cd2d25b1d06687af66627ab1/687474703a2f2f63646e2e746865626f6c646974616c69632e636f6d2f7061706572636c69702f68746d6c5f696d616765732f33353130382f696d616765732f6f726967696e616c2f77696c6c2d796f752d62652d6c6174655f66696e616c2e706e67)

### `if/else`

The boolean expression inside an `if`'s parentheses will always be evaluated as truthy or falsy to determine what will happen next. 

A die hard Giants fan might have the following rules for baseball games.

```js
if (giantsPlaying) {
  getTickets();
}

if (!giantsPlaying) {
  watchOnTV();
}
```

We can rephrase this more succinctly using `if` and `else`.

```js
if (giantsPlaying) {
  getTickets();
} else {
  watchOnTV();
}
```

A slightly more complex boolean expression will help our Giants fan save some money.

```js 
if (giantsPlaying && gameInSF){
  getTickets();
} else {
  watchOnTV();
}
```

Some languages allow us to write if/else expressions in even fewer lines with a "ternary operator". Which is generally frowned upon because it is as easy to read as a James Joyce novel.

```js
giantsPlaying && gameInSF ? getTickets() : watchOnTV;
```

### `else if`

Here's a sample rule set for commuters:

```js
var destination = "GA";
if ( hasBike ) {
  rideToGA();
} else if ( hasTransitPass ) {
  busToGA();
} else {
  walkToGA();
}
```


### Nested `if`s

A strategy for choosing what to drink:

```js
var drink;

if (tooSleepy) {
  if (before5pm) {
    drink = "coffee";
  } else {
    drink = "black tea";
  }
} else {
  if (isHungry){
    drink = "smoothie";
  } else {  
    drink = "water";
  }
}
```


#### `switch`

A `switch` statement checks the value of one variable or expression to determine which of many "cases" to jump to.  Here's code for a vending machine with a different price for each row:

```js
switch (row){ 
  case 1:   
    price = 0.25;
    break;
  case 2: 
    price = 0.50;
    break;
  case 3:
    price = 0.75;
    break;
  case 4: 
    price = 1.00;
    break;
  default:  // the rest of the products (rows 5-7) 
    price = 1.25;
}     
```


## Conditional Control Flow Tricks

**Loose Control Flow** (watch out for edge cases!)

```js
if ( username ) {
  // submit signup form
}

// same as

if ( username.length > 0) {
  // submit signup form
}
```

**Ternary operator**

Fancy, but `if` I ever see it I'll delete it!

```js
var username = last_name ? first_name + last_name : first_name;

// same as

var username = first_name;
if ( last_name ) {
  username = first_name + last_name;
}
```

**Conditional assignment: `||` as Default Operator**

```js
var bestCity = yourCity || "San Francisco";

// same as

var bestCity = "San Francisco";
if ( yourCity ) {
  bestCity = yourCity;
}

```

**Conditional Execution: `&&` as Guard Operator**

```js
badThing && alert("Uh oh!")

// same as

if ( badThing ) {
  alert("Uh oh!");
}

```


## Loops

Whenever we want to repeat something in code, we use a loop.  We can think of every loop as three parts: initial setup, continue condition, and update expression(s).


### `while` loops


![Endless Doughnuts](http://img.pandawhale.com/78624-Homer-Simpson-infinite-donuts-P3EQ.gif)

__While doughnut, eat doughnut!__

In while loops, the initial setup happens before the loop. The continue condition goes inside the parentheses. The update expressions happen inside the loop. 

```js
var minutesBeforeWork = 80;                    // setup:  plan to wake up early
while (minutesBeforeWork > 30) {               // continue condition: leave enough time to get day clothes on
  minutesBeforeWork = minutesBeforeWork - 5;   // update: hit snooze!
}
```

### `for` loops

For loops allow the setup, continue condition, and update expression inside the for loop parentheses. 

```js
for (var count = 1; count <= 3; count++){
  console.log(count);
}
console.log("Go Team!");
```

For loops for arrays usually use a counter variable to move through the indices of the array.

```js
var friends = ["Bill", "Nicki", "Kelly"]
for (var i = 0; i < m.length; i++) {
  console.log(m[i] + " is a nice person");
}

```

Objects have keys instead of indices, so there is a special `for in` structure used to loop on objects. The `hasOwnProperty` line is part of the pattern that we won't go into today. Here's an example that pulls all of the data about a movie into the console. 

```js
var movieData = {director: "Burton", year: 1993, title: "The Nightmare Before Christmas", price: 4.55}
for (key in movieData){
  if (movieData.hasOwnProperty(key)) {
    console.log(key + ": ", movieData[key]);
  }
}
```

For loops only really need a continue condition (or the loop will never end!). We can do setup before the loop and updating inside the loop. In this way, a for loop can look a lot like a while loop.

```js
var minutesBeforeWork = 540;
for( ; minutesBeforeWork > 30; ) {
  minutesBeforeWork = minutesBeforeWork - 5;
}
```

### `break`

The key word `break` will break us out of a loop immediately.  When you experiment more with loops inside functions, you'll see that `return`ing from inside a loop (inside a function) also immediately breaks the loop.

```js
for (var i = 0; i < 10; i+=2) {
  console.log(i);
  break;
}

var j=0;
while (j < 10) {
  console.log(j);
  break;
  j += 2;
}
```
## Exercises

[YAY! Exercises to practice](https://github.com/sf-wdi-24/control-flow-exercises)

## Resources

* [Loops - JSforcats](http://jsforcats.com/#loops)
* [Conditionals - Codeacademy](http://www.codecademy.com/glossary/javascript/if-statement)
* [Loops - CodeAcademy](http://www.codecademy.com/glossary/javascript/loops)
* [Javascripting](https://github.com/sethvincent/javascripting)
