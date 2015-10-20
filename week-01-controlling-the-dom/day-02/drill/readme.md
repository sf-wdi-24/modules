# Dǝbugging Challenges

| Objectives |
| :--- |
| Gain experience following a program as it runs. |
| Understand common developer pitfalls. |
| Fix common problems which impact developers. |

### Challenges

Challenges are primarily available as independent JSFiddle code snippets. The code in JSFiddle can be executed as if it were running on your website.

To execute a challenge on JSFiddle, click the "Run" button.

![Run Challenge](https://cloud.githubusercontent.com/assets/1329385/10594818/bfc44ff8-7685-11e5-8b6a-dadc6f2d6fa5.png)

For advanced challenges we'll use [CodeWars](http://www.codewars.com/) which we recommend using for practice. A CodeWars account is required for an advanced challenge.

### Easy
* Fix the function `subtract` to properly subtract two number.
  * [http://jsfiddle.net/eerwitt/wwp7L069/](http://jsfiddle.net/eerwitt/wwp7L069/)
* Missing semicolon.
* Misspelled variables `var a = 7; a1 + 2;`
* `var function () {}`
* `var a = return 2; a();`

### Medium
* Not assigning `function (a) { a + 1; return a;}(1)`
* Missing parameters `function () {return a;}(2)`
* Order of function calls.
* Order of operation
* `var a = "Hello Number: " + number + 1;`

### Hard
* State mutation problem `a = 2; b = a; b += 1; a == 2;`
* [Infinite loop](http://www.codewars.com/kata/unfinished-loop-bug-fixing-number-1/)
