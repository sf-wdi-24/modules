# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Interview Workshop: Big-O

## What is an algorithm?

An algorithm is a set of instructions to find the solution to a problem.

We write code to implement algorithms, but algorithms don't have to be written in code.

## What is efficiency?

**Time efficiency** helps us predict how long it could take a particular algorithm to run. **Space efficiency** helps us predict how much memory a particular algorithm could use up.

## Why study algorithms and efficiency?

* Understanding existing algorithms lets us reuse knowledge from the field.
* Better-performing algorithms can enhance the user experience.
* Better-performing algorithms can save companies money.
* Algorithms and algorithm analysis are shared languages developers use to talk programs (especially in INTERVIEWS!).

## Big-O Notation

1. Ask yourself: In the worst case scenario, how many calculations does your algorithm do?
2. Phrase the answer in terms of the size of the input.  
3. Ignore constant multiples or smaller calculations added on.

Consider all mathematical operations (`+`, `-`, `*`, `/`, and `%`) constant time, or **O(1)**, operations.

```js
function add(a, b) {
  return a + b;
}
```

Programs containing `for` loops that go through the whole input array are generally implementing at least linear time, or **O(n)**, algorithms.

```js
function addAll(numArray) {
  var sum = 1;
  for (var i = 0; i < numArray.length; i++) {
    sum += numArray[i];
  }
  return sum;
}
```

Logarithm terms in Big-O notation (like `O(log(n)`) usually come from recursive functions that divide the problem into smaller sub-problems.

TODO: Add example of `O(log(n))`

Almost everything else is composed of combinations of those. For example, if a `for` loop has more complex operations inside it, time complexity is usually higher.

The nested `for` loop below has a time complexity of `O(n^2)`.

```js
function addAllArrays(arrayOfArrays) {
  var sum = 1;
  var oneArray;
  for (var i = 0; i < arrayOfArrays.length; i++) {
    oneArray = arrayOfArrays[i];
    for (var j = 0; j < oneArray.length; j++) {
      sum +=  numArray[j];
    }
  }
  return sum;
}
```

### Common Orders of Complexity

| Notation | Name |
| :--- | :--- |
| `O(1)` | constant |
| `O(log(n))` | logarithmic |
| `O(nc), for c < 1` | |
| `O(n)` | linear |
| `O(n(log(n))` | linearithmic |
| `O(n^2)` | quadratic |
| `O(n^c)`, `for c > 1` | polynomial |
| `O(c^n)`, `for c > 1` | exponential |

Every row listed in this table is more complex (takes more time or space) than the rows above it.  That means, if we decide an algorithm takes polynomial time to do one set of operations and then moves on and needs a linear amount of work to finish up, we can just say it's a polynomial algorithm for the purposes of Big-O notation.

**Graph:** How the number of operations (time) grows with the number of input elements for various orders of complexity.

![time_complexity](https://cloud.githubusercontent.com/assets/7833470/12595419/0a4601a0-c430-11e5-9374-53375be48c30.png)

## Resources

* <a href="http://bigocheatsheet.com" target="_blank">Big-O Cheat Sheet</a>
* <a href="https://www.interviewcake.com/article/big-o-notation-time-and-space-complexity" target="_blank">Big O Notation</a> [Interview Cake]
* <a href="https://courses.edx.org/c4x/MITx/6.00.1x_5/asset/handouts_Big_O_Notes.pdf" target="_blank">Notes On Big-O Notation</a> [edX]
* <a href="(https://class.coursera.org/algo-003/lecture/11" target="_blank">Big-Oh Notation</a> [Coursera]

## Challenges: Algorithm Analysis

1. Write a function called `compare` that compares two numbers. The function should return `1` if the first number is greater than the second, `0` if they are equal, or `-1` if the first number is less than the second. How many calculations (including comparisons) does your function do?

2. Write a function to find the middle element in an array. How many calculations (including comparisons) does your function do for:
  * the input array `[0, 4, 5]`
  * an input array with 8 elements
  * any input array with `n` elements

3. Write a function to find the maximum element in an array. How many calculations (including comparisons) does your function do for:
  * the input array `[0, 4, 5]`
  * any input array with 8 elements
  * any input array with `n` elements

4. Write a function called `indexOf` that takes in a number and an array and searches for the number in the array. If the number is in the array, it should return the array index where it found the number. If the number is not in the array, it should return `null`.  How many calculations (including comparisons) does your function do for:
  * the input array `[0, 4, 5]`
  * any input array with 8 elements
  * any input array with `n` elements

5. Write a function called `countNums` that takes in an array of numbers and counts how many times each number in the array appears. How many calculations (including comparisons) does your function do for:
  * the input array `[0, 4, 5]`
  * any input array with 8 elements
  * any input array with `n` elements

6. Write a function called `findShared` that takes in two arrays and outputs a new array that contains every number appearing in both input arrays. How many calculations (including comparisons) does your function do for:
  * the input array `[0, 4, 5]`
  * any input array with 8 elements
  * any input array with `n` elements
