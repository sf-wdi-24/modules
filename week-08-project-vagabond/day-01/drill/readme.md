# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Mock Interviews

## Schedule

#### Monday

| Time | Interviewer 1 | Interviewer 2 | Interviewer 3 | Interviewer 4 | Interviewer 5 |
| :---- | :---- | :---- | :---- | :---- | :---- |
| 9:17 | Adam | Alan | André | Carlos | Cynthia |
| 9:47 | Dave | Eddy | John | Michael | Stanley |

#### Tuesday

| Time | Interviewer 1 | Interviewer 2 | Interviewer 3 | Interviewer 4 | Interviewer 5 |
| :---- | :---- | :---- | :---- | :---- | :---- |
| 9:17 | Steven | Trung | Victoria | Zohar | Adam |
| 9:47 | Alan | André | Carlos | Cynthia | Dave |

#### Wednesday

| Time | Interviewer 1 | Interviewer 2 | Interviewer 3 | Interviewer 4 | Interviewer 5 |
| :---- | :---- | :---- | :---- | :---- | :---- |
| 9:17 | Eddy | John | Michael | Stanley | Steven |
| 9:47 | Trung | Victoria | Zohar |  |  |

## Drills

When you're not in a mock interview, please work on the drills below OR work through exercises of your choice on <a href="http://www.codewars.com/dashboard" target="_blank">Codewars</a> or <a href="http://exercism.io" target="_blank">Exercism.io</a>. Feel free to use JavaScript or Ruby.

1. **Sum Pairs:** Write a program to find all pairs of integers in an array that sum up to a specified value. Can you implement it in constant (`O(n)`) time? **Example:**

  ```ruby
  sum_pairs([109, 3, 22, 6, 56, 7, 4], 10)
  # => [[3, 7], [6, 4]]
  ```

2. **Collatz Conjecture:** Start with a number n > 1. Find the number of steps it takes to reach n = 1 using the following process:

  ```ruby
  # if n is even, divide it by 2
  # if n is odd, multiply it by 3 and add 1
  ```

  Learn more about the <a href="https://en.wikipedia.org/wiki/Collatz_conjecture" target="_blank">Collatz conjecture</a>.

3. **Addition Land:** Implement multiplication (`*`), division (`/`), and subtraction (`-`) using only the addition (`+`) operator.

4. **Number to Words:** Given an integer between `0` and `999,999`, print an English phrase that describes the integer (e.g., "One Thousand, Two Hundred and Thirty Four").

5. **Underscore Once (JavaScript):** This function takes in another function `f` and returns a new function `g` that is the same as `f`, but can only be called once. **Example:**

  ```js
  var once = function (f) { ... };

  var log = function(message) {
    console.log(message);
  };

  var logOnce = once(log);

  logOnce("a"); // logs "a"
  logOnce("b"); // doesn't log anything
  ```

6. **Flatten Object:** Implement a `flatten_object` function. Given an object like this:

  ```js
  var obj = {
    a: 1,
    b: 2,
    c: {
      d: 3,
      e: 4,
    },
    f: {
      g: {
        h: 5
      }
    }
  };
  ```

  Output a flattened object like this:

  ```js
  var result = {
    a: 1,
    b: 2,
    c_d: 3,
    c_e: 4,
    f_g_h: 5
  };
  ```

7. **All the Talks:** You're at an awesome conference with a ton of cool talks. Given a list of talks and other events, create a daily schedule to go to as many events as possible. Each event has a start time, an end time, and a description. **Key Questions:**

  * Can I go to two events at once? *No.*
  * Can I attend only part of an event? *No.*
  * Do I need breaks? *Nah.*
  * What format are the event times? *Assume they're given in minutes since midnight. For example, 9:00AM would be represented by 540.*

  **Hint:** Look for a "greedy algorithm" solution to "scheduling" to see an approach for this kind of problem!

8. **Spiral Word Search:** Given an array of words, write a program that searches an N x N word search and returns an array of the found words. Instead of a regular word search where words are horizontal, vertical, or diagonal, all words in this search are in a spiral pattern. **Example:**

  ```js
  var array = ["seattle", "portland", "san francisco"];

  // N x N wordsearch grid:

   a | r | y | b | w | s | d | e
  ---|---|---|---|---|---|---|---
   h | c | l | e | x | a | k | i
  ---|---|---|---|---|---|---|---
   t | f | o | p | m | s | c | v
  ---|---|---|---|---|---|---|---
   f | u | r | a*| t*| t*| w | h         
  ---|---|---|---|---|---|---|---
   z | b | n | e*| s*| l*| o | x         
  ---|---|---|---|---|---|---|---           |
   p | y | h | d | n | e*| l | j
  ---|---|---|---|---|---|---|---
   u | a | i | o | l | r | g | s
  ---|---|---|---|---|---|---|---
   g | k | c | y | u | b | m | q

  findWord(array, wordSearch);
  // => ["seattle"]
  ```
