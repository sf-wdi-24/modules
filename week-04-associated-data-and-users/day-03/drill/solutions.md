## Challenge

**Create a `bubbleSort` function that takes in an array of numbers, uses the bubble sort algorithm on it, and returns the sorted array.**

```js
function bubbleSort(arr) {

  // we'll need to make at most `arr.length - 1` passes through the array to sort it
  for (var i = 0; i <= arr.length - 1; i++) {

    // to start each pass, we haven't swapped at all
    var swapped = false;

    // loop through the array
    for (var j = 0; j <= arr.length - 1; j++) {

      // swap if two values are out of order
      if (arr[j] > arr[j + 1]) {
        var temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;

        // update `swapped` so we know if there was a swap
        // during this pass through the array
        swapped = true;
      }
    }

    // if we didn't have to make any swaps during this pass
    // the array is sorted, and we can return it!
    if (!swapped) {
      return arr;
    }
  }

  // this return triggers for empty arrays
  return arr;
}

var tests = [
  { input: [0, 1, 2], expected: [0, 1, 2] },
  { input: [8, 5, 3], expected: [3, 5, 8] },
  { input: [], expected: [] },
  { input: [9, 4, 7, 6], expected: [4, 6, 7, 9] }
];

for (var t = 0; t < tests.length; t++) {
  console.log("Testing bubbleSort with input", tests[t].input);
  console.log("Expected output is", tests[t].expected);
  console.log("Actual output is", bubbleSort(tests[t].input));
  console.log("\n");
}
```

## Thought Bubbles

*Haha! We made that pun twice!*

1. Why is it safe to stop looping through the array after you have a full pass through without swaps?

  > You always swap when two elements are out of order relative to each other. If you go through the whole array and don't have to swap, it means nothing was out of order. So the whole thing is sorted!

2. How would you change your function to sort the array in the reverse order?

  > Swap if `arr[i] < arr[i + 1]` instead of when `arr[i] > arr[i + 1]`.

3. What are some basic requirements for Bubble Sort to work on an input array? Would your code work with an input array like `["Thursday", 47, ["a", "b", "c"]]`?

  > The values you're swapping have to be comparable. JavaScript doesn't let you compare those different data types with `<` or `>`, so the solution won't work with that input. (And it makes sense not to!)

4. Bubble Sort is known as a slower sorting algorithm in many scenarios. What is the best-case scenario for Bubble Sort? That is, what kind of array causes bubble sort to do the least amount of swaps? How many swaps would bubble sort do on this kind of array?

  > The best case scenario input for Bubble Sort is an array that's already sorted. It will only do one pass through a sorted array, and it will never do any swaps.

5. What is the worst case scenario for Bubble Sort? (What kind of array causes it to do the most swaps?)

  > The worst case scenario input for bubble sort is an array that's in reverse order. It has to make a pass through the array to "bubble" every item up, and most of those passes require multiple swaps.
