# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Interview Workshop: Big-O - Solutions

1. Write a function called `compare` that compares two numbers. The function should return `1` if the first number is greater than the second, `0` if they are equal, or `-1` if the first number is less than the second. How many calculations (including comparisons) does your function do?

  ```js
  function compare(a, b) {
    if (a > b) {
      return 1;
    } else if (a === b) {
      return 0;
    } else {
      return -1
    }
  }
  ```

  `compare` always does up to 2 calculations (comparisons), no matter what the size of  `a` and `b` are. So `compare`'s order of complexity is `O(1)`.

2. Write a function to find the middle element in an array. How many calculations (including comparisons) does your function do?

  ```js
  function mid(arr) {
    // declaration is O(1)
    var midIndex;
    // array length lookup and % are O(1)
    if (arr.length % 2 === 0) {
      // array length, division, assignment all O(1)
      midIndex = arr.length / 2;
    } else {
      // division and subtraction both O(1)
      midIndex = (arr.length - 1) / 2;
    }
    // array lookup O(1)
    return arr[midIndex];
  }
  ```

  `mid` does:
    * one lookup of `arr.length`
    * one calculation with `%`
    * another lookup of `arr.length`
    * one or two more calculations to find the middle index
    * one lookup to find the array element at the middle index

  Each of these 5-6 individual operations is `O(1)`, so we have `5 * O(1) = O(1)` or `6 * O(1) = O(1)`.

  Whether the array has 3 elements, or 8, or 10000000, or `n`, `mid` always does the same 5 or 6 operations.

  Since the number of calculations/operations does **not** depend on the size of the input, `mid` is `O(1)`.

3. Write a function to find the maximum element in an array. How many calculations (including comparisons) does your function do?

  ```js
  function getMax(arr) {
    // assignment is O(1)
    var currentMax = -Infinity;
    // for loop runs arr.length times (n times)
    for (var i = 0; i < arr.length; i++) {
      // comparison and array lookup are O(1)
      if (arr[i] > currentMax) {
        // assignment and lookup are O(1)
        currentMax = arr[i];
      }
    }
    return currentMax;
  }
  ```

  `getMax` does `O(1) + n * (O(1)) = O(1) + O(n) = O(n)` calculations/operations.

4. Write a function called `indexOf` that takes in a number and an array and searches for the number in the array. If the number is in the array, it should return the array index where it found the number. If the number is not in the array, it should return `null`.  How many calculations (including comparisons) does your function do?

  ```js
  function indexOf(num, arr) {
    // O(1)
    var foundIndex = null;
    // O(n) (worst case scenario)
    for (var i = 0; i < arr.length; i++) {
      // O(1)
      if (arr[i] === num) {
        // O(1)
        foundIndex = i;
      }
    }
    return foundIndex;
  }
  ```

  `indexOf` does `O(1) + n * O(1) = O(1) + O(n) = O(n)` calculations/operations.

5. Write a function called `countNums` that takes in an array of numbers and counts how many times each number in the array appears. How many calculations (including comparisons) does your function do?

  ```js
  function countNums(arr) {
    // O(1)
    var output = {};
    // O(n)
    for (var i = 0; i < arr.length; i++) {
      // O(1)
      if (output[arr[i]] === undefined) {
        // O(1)
        output[arr[i]] = 1;
      } else {
        // O(1)
        output[arr[i]] += 1;
      }
    }

    // bonus section: printing the counts
    // O(n) time or less
    for (num in output) {
      // O(1)
      if (output.hasOwnProperty(num)) {
        // O(1)
        console.log(num + ": ", output[num]);
      }
    }
    return output;
  }
  ```

  `countNums` does `O(1) + n * O(1) + (O(n) or less) * O(1) = O(1) + O(n) + O(n) = O(n)` calculations/operations.

  We can simplify `(O(n) or less) * O(1)` to `O(n)`, because Big-O notation gives us an UPPER limit on how long our algorithms take. If we overestimate, this upper limit is still valid (though if we overestimate too much it's not helpful.)

6. Write a function called `findShared` that takes in two arrays and outputs a new array that contains every number appearing in both input arrays. How many calculations (including comparisons) does your function do?

  ```js
  function findShared(arr1, arr2) {
    // O(1)
    var shared = [];
    // arr1.length times (O(n))
    for (var i = 0; i < arr1.length; i++) {
      // arr2.length times (O(n))
      for (var j = 0; j < arr2.length; j++) {
        // O(1)
        if (arr1[i] === arr2[j]) {
          // O(1)
          if (shared.indexOf(arr1[i]) === -1) {
            shared.push(arr1[i]);
          }
        }
      }
    }
    return shared;
  }
  ```

  `findShared` does `O(1) + n * (m * O(1)) = O(1) + n * O(m) = O(1) + O(m * n) = O(m * n)` calculations/operations.

  Again, we can simplify by sacrificing some accuracy and overestimating. If we say `n` is the size of the bigger array, we can overestimate the time this algorithm needs as `O(n * n) = O(n^2)`.
