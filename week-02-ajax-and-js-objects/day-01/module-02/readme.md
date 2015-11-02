# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60">  Iterators

## Functional Programming

Programming with functions! Weren't we already doing that?
Well yes, but we can use functions more heavily, especially in place
of loops.
Let's stop writing `for` loops. Iterators are _functional programming_
replacements for `for` loops. We can use these functions to perform
common Array operations for us.

What might we want to with an array?

- run some piece of logic on each item
- create a new array with each item being slightly transformed
- filter the array to contain only a subset of items
- combine all the items in some fashion

We could accomplish all of this using `for` loops, but writing `for`
loops is error prone and tiring. JavaScript provides iterator
functions for all of these common operations. They are called
(respectively):

- <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach" target="_blank">forEach</a>
- <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map" target="_blank">map</a>
- <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter" target="_blank">filter</a>
- <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce" target="_blank">reduce</a>

forEach
-------

`forEach` is the _functional programming_ replacement for your standard
`for` loop.  You can take the body from your `for` loop, wrap it in
a function, and pass that argument to `forEach`. Let's look at an
example:

```
var friends = ["Markus", "Tim", "Ilias", "Elie"];

// old way, with a for loop
for (var i = 0; i < friends.length; i++) {
    console.log("Hello, " + friends[i] + "!");
}

// cool new way, with the .forEach iterator
friends.forEach(function (buddy) {
    console.log("Hello, " + buddy + "!");
});

// both output the same thing
// > Hello, Markus!
// > Hello, Tim!
// > Hello, Ilias!
// > Hello, Elie!
```

__Try it__

Use the `.forEach` iterator to loop over the following
array of foods and say you like them.

```
var foods = ["pizza", "tacos", "ice cream"];

// your code here

// The output should be
// > "I like pizza"
// > "I like tacos"
// > "I like ice cream"
```

__Try it again__

Use the `.forEach` iterator to loop over the following
array of objects and say how delicious each one is.

```
var foods = [
  {name: "Pizza", level: "very"},
  {name: "Tacos", level: "mostly"},
  {name: "Cottage Cheese", level: "not very"}
];

// your code here

// The output should be
// > Pizza is very delicious
// > Tacos is mostly delicious
// > Cottage Cheese is not very delicious
```

__Implement it__

What if JavaScript did not have the `forEach` iterator.
Could we make it ourselves? What do we think it's doing under the
hood?

Create a function called `each` that will take two arguments:

- an array to loop over
- a function to run on every element of the array

```
var names = ["billy", "bob", "joe"];

var each = function (items, callback) {
    // your code here
}

each(names, function (person) {
    console.log("Hello, " + person + "!");
});

// should output:
// > Hello, billy!
// > Hello, bob!
// > Hello, joe!
```

map
---

Sometimes we want to loop over an array and build a new array in the
process. This is what `map` helps us solve. It is like `forEach`, but
it returns the new array that is created.

```
var names = ["tim", "ilias", "elie", "markus"];

// old way with for loop
var cased = [];
for (var i = 0; i < names.length; i++) {
    cased.push(names[i].toUpperCase());
}
console.log(cased);

// new way with `map`
var cased = names.map(function (person) {
    return person.toUpperCase();
});
console.log(cased);

// Should output
// > ["TIM", "ILIAS", "ELIE", "MARKUS"]
// > ["TIM", "ILIAS", "ELIE", "MARKUS"]
```

filter
------

Filter is an iterator that loops through your array and filters it
down to a subset of the original array. A callback is called on each
element of the original array: if it returns true, then the element is
included in the new array, otherwise it is excluded.

```
var names = ["tim", "ilias", "elie", "markus"];

var isEven = function (name) {
  return name.length % 2 === 0;
};
var isOdd = function (name) {
  return name.length % 2 !== 0;
};

var evenLengthNames = names.filter(isEven);
var oddLengthNames = names.filter(isOdd);

console.log(evenLengthNames);
console.log(oddLengthNames);

// Should output
// > ["elie", "markus"]
// > ["tim", "ilias"]
```

reduce
------

Reduce iterates over an array and turns it into one, accumulated
value. In some other languages it is called `fold`. I like to imagine
the game 2048 as it reduces, or folds up, several smaller blocks into
fewer, bigger blocks.

```
var nums = [1,2,3,4];
var add = function (a, b) {
  return a + b;
};

var sum = nums.reduce(add);
console.log(sum);

// Should output:
// > 10
// which is, 1 + 2 + 3 + 4
```

Reduce also usually accepts an option third parameter that will be the
initial accumulated value. If it is omitted, then the reduction starts
with the first two values in the array.

```
var nums = [1,2,3,4];
var add = function (a, b) {
  return a + b;
};

var sum = nums.reduce(add, 10);
console.log(sum);

// Should output:
// > 20
// which is, 10 + 1 + 2 + 3 + 4
```
Homework
----------
You'll be able to find tonight's HW <a href="https://github.com/sf-wdi-24/iterators-challenges" target="_blank">here</a>. The challenges for this evening are a test of you knowledge of how iterators work and how you can recreate them yourself.

References
----------

- <a href="http://en.wikipedia.org/wiki/Functional_programming" target="_blank">Functional Programming on Wikipedia</a>
  (Don't read this.  It will take you down a rabbit hole. But know
  that it exists.)
- <a href="http://en.wikipedia.org/wiki/Imperative_programming" target="_blank">Imperative Programming on Wikipedia</a>
If we weren't doing _functional programming_, what were we doing?
_Imperative programming_.
- <a href="http://en.wikipedia.org/wiki/First-class_function" target="_blank">First-class functions</a>
- <a href="http://en.wikipedia.org/wiki/Higher-order_function" target="_blank">Higher-order functions</a>
