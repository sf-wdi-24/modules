# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Bubble Sort

Sorting is a common problem in interviews and in the real world (sorting books by title, sorting items by price, etc.).

So, there are a lot of solutions! The term **algorithm** is used in software development to describe a solution to a problem that will work in all or many programming languages, without going into the specifics of coding it in any particular language.

**<a href="http://www.sorting-algorithms.com" target="_blank">See a bunch of different sorting algorithms in action.</a>**

## Why Bubble Sort?

We'll look at a few different sorting algorithms, but we're starting with bubble sort because:

* It's simple (but slower than some more complex algorithms).
* It performs great on already sorted data!
* It has a cool name.

## What? Bubble Sort?

Here's the basic idea of the Bubble Sort algorithm:

1. Start at the beginning of a list (array) of items.
2. Compare the item you're looking at to the next item in the list.
3. If this item is greater than the next one, swap them.
4. Move on to the next item.
5. Repeat steps 1-4 until you go through the whole list without doing any swaps.

## Visualizations

* <a href="https://en.wikipedia.org/wiki/Bubble_sort#/media/File:Bubble-sort-example-300px.gif" target="_blank">From Wikipedia</a>
* <a href="https://www.youtube.com/watch?v=lyZQPjUT5B4&t=52" target="_blank">
From Romania</a> (watch on double speed)

## Challenge

**Create a `bubbleSort` function that takes in an array of numbers, uses the bubble sort algorithm on it, and returns the sorted array.**

* Work with a partner to implement the algorithm on the whiteboard.
* Start with pseudocode before moving into actual code.
* Test your work with the input/output pairs listed below:

| Input | Expected Output |
| :--- | :--- |
| `[0, 1, 2]` | `[0, 1, 2]` |
| `[8, 5, 3]` | `[3, 5, 8]` |
| `[]`  | `[]` |
| `[9, 4, 7, 6]` |  `[4, 6, 7, 9]` |

## Thought Bubbles

*Because we can only make that pun once.*

1. Why is it safe to stop looping through the array after you have a full pass through without swaps?

2. How would you change your function to sort the array in the reverse order?

3. What are some basic requirements for Bubble Sort to work on an input array? Would your code work with an input array like `["Thursday", 47, ["a", "b", "c"]]`?

4. Bubble Sort is known as a slower sorting algorithm in many scenarios. What is the best-case scenario for Bubble Sort? That is, what kind of array causes bubble sort to do the least amount of swaps? How many swaps would bubble sort do on this kind of array?

5. What is the worst case scenario for Bubble Sort? (What kind of array causes it to do the most swaps?)
