# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Whiteboarding in Pairs

Today you will be pairing up and taking turns performing whiteboard interviews.  When you are divided into pairs each person A should interview person B for roughly 25 minutes.  At the end of that time they should switch roles and person B will interview person A for 25 minutes.


## Problem # 1 - Palindrome

Write a program that determines if a string is a palindrome, meaning it reads the same forwards as backwards, like "racecar".

For additional complexity, discount white space and punctuation, so that a string like "never odd or even" would be accepted as well.

```js
isPalindrome('racecar');
// => true
isPalindrome('apple');
// => false
```

## Problem # 2 - Greatest Difference

Given an array of numbers, write a program that returns the greatest difference from subtracting any two elements.

```js
greatestDiff([-18, 72, 5, 43, -34, 106]);
// => 140
```

## Problem # 3 - List Combination

Write a function that combines two lists by alternatingly taking elements. For example: given the two lists [a, b, c] and [1, 2, 3], the function should return [a, 1, b, 2, c, 3].
```js
var a = [a,b,c]
var b = [1,2,3]
// => [a,1,b,2,c,3]
```

## Problem # 4 - Shuffle

Given an array with any number of elements, write a program that randomly shuffles the elements. The array elements can be any data type. Calling `shuffle` on the same array should yield a randomized result each time.

```js
shuffle(['a', 'b', 'c', 'd', 'e']);
// => [ 'b', 'c', 'd', 'e', 'a' ]

shuffle(['a', 'b', 'c', 'd', 'e']);
// => [ 'c', 'e', 'b', 'a', 'd' ]
```
