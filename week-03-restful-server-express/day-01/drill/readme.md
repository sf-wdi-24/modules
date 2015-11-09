Intro to Recursion
==================

**Why?**
--------
Recursion is best used for problems where a large task can be broken down into a repetitive “sub-task”.

<img src="http://www.quickmeme.com/img/28/28b5865ebe59280d5c3ed18fc1147964309d9d0c81663c0c3f81d42fc5979c8f.jpg"/>

**What is recursion?**
----------------------

In computer science, **recursion** is a problem-solving method where the solution depends on solutions to smaller instances of the same problem. When programming, we see recursion in practice when a function calls itself.

**Base Case**

In the base case, the routine does not call itself. But, when a routine does have to call itself in order to complete its sub-task, then that is known as the recursive case. So, there are 2 types of cases when using a recursive algorithm: base cases and recursive cases.

Without a base case the stack overflows.

**Why?**
--------
Recursion is best used for problems where a large task can be broken down into a repetitive “sub-task”.

```js
var guessNumber = function(num) {
  var guess = prompt("Guess the number.");

  // base case (no recursion)
  if (guess === num) {
    alert("Your guess is correct!")

  // recursive case (function calls itself)
  } else if (guess > num) {
    alert("Your guess is too high. Try again.");
    guessNumber(num);

  // another recursive case
  } else if (guess < num) {
    alert("Your guess is too low. Try again.");
    guessNumber(num);
  }
};
```




### Factorial using recursion
Write a function `factorial` that takes a single parameter `n`, and computes the [factorial](http://en.wikipedia.org/wiki/Factorial) of `n`. For example: 

```
factorial(5) => 5 * 4 * 3 * 2 * 1
factorial(4) => 4 * 3 * 2 * 1
factorial(3) => 3 * 2 * 1
factorial(2) => 2 * 1
factorial(1) => 1
factorial(0) => 1
```
Here is some starter code:
```js
var factorial = function(x) {
};
```

### Greatest Common Divisor
Find the greatest common divisor between two positive integers.

### Resources:

<a href="https://www.youtube.com/watch?v=Mv9NEXX1VHc" target="_blank">What on Earth is Recursion?</a><br>
<a href="http://www.wolframalpha.com/input/?i=recursion" target="_blank">More Recursion</a><br>
<a href="http://programmers.stackexchange.com/questions/25052/in-plain-english-what-is-recursion" target="_blank">And finally...</a>
