# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60">  Fibonacci

<a href="https://cloud.githubusercontent.com/assets/1329385/10953571/8afb5d82-82fd-11e5-9f07-5dea1c865dc1.gif" target="_blank"><img src="https://cloud.githubusercontent.com/assets/1329385/10953571/8afb5d82-82fd-11e5-9f07-5dea1c865dc1.gif" alt="Recursion"></a>

## Fibonacci

In mathematics, the **Fibonacci sequence** is the series of numbers that follow this pattern:

```
1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...
```

By definition, each number in the sequence is the sum of the two numbers before it, with the exception of the first two numbers, which are both `1`.

## Challenge

Using <a href="https://github.com/sf-wdi-24/fibonacci" target="_blank">this starter code</a> write a recursive function that returns the `nth` number in the Fibonacci sequence.

```js
var fib = function(n) {

  // base case

  // recursive case
}

fib(1) // returns 1
fib(2) // returns 1
fib(8) // returns 21
```

## Stretch Challenge

Imagine what would happen when you call `fib(50)` (**Hint:** It will most likely crash your browser). When calling `fib(50)`, how many times would `fib(10)` run in your recursive solution? How about `fib(1)`?

Can you think of another way to write your `fib` function without using recursion? Try to implement a solution that runs in O(n) time (linear).


## Yoga Challenge

Solve <a href="http://www.codewars.com/kata/n-th-fibonacci/javascript" target="_blank">this Kata</a> using your new skills. Then compare to other solutions.

