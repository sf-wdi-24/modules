function binarySearchIterative(array, target) {
  // declare variables for high, low, and mid points of the array
  var mid, low = 0,
      high = array.length - 1; // declaring multiple variables at once

  // while the low is less than the high
  while (low <= high) {
    // set mid equal to halfway between the low and the high
    mid = Math.floor((low + high) / 2);

    // if the value of indexing the array using mid is greater than the target
    if (array[mid] > target) {
      // set the high to mid - 1, start loop over
      high = mid - 1;
    // else if the value of indexing the array using mid is greater than the target
    } else if (array[mid] < target) {
      // set the low to mid - 1, start loop over
      low = mid + 1;
    } else {
      // return the midpoint when the indexed midpoint matches the target
      return mid;
    }
  }
  // return null if the target is not found
  return null;
}

var testArray = [1,2,3,4,5,6,7,8,9,10];
console.log(binarySearchIterative(testArray, 3, 1, 10));
console.log(binarySearchIterative(testArray, 7, 1, 10));


// STRETCH 1:

function binarySearchRecursive(array, target, low, high) {
  // break if the high is less than the low
  if (high < low) { return null; }
  // set mid to be between low and high
  var mid = Math.floor((low + high) / 2);
  // use mid to index the array and compare its value with the target
  if (array[mid] > target) {
    // if the indexed value is higher than the target,
    // call the function again with these new values
    return binarySearchRecursive(array, target, low, mid - 1);
  }
  if (array[mid] < target) {
    // if the indexed value is lower than the target,
    // adjust the midpoint and call the function again
    return binarySearchRecursive(array, target, mid + 1, high);
  }
  // return the index of the array where the target value is located
  return mid;
}

var testArray = [1,2,3,4,5,6,7,8,9,10];
console.log(binarySearchRecursive(testArray, 3, 1, 10));
console.log(binarySearchRecursive(testArray, 7, 1, 10));



// STRETCH 2:
function binaryStringSearchIterative(array, target){
var steps =  0;
// If we want to keep the array in random order, create a temporary copy of the array
var temp = [];

  // In Javascript "ABC...XYZ" comes before "abc...xyz". The value "a" is greater than the value "Z".
  // If we sort an array of strings, we will not get true alphabetical order.
  // We need to capitalize the first letters to handle typos:
  for (var i = 0; i < array.length; i++) {
    // Slice off the first letter and capitalize it:
    var firstLetter = array[i].slice(0,1);
    var upperFirst = firstLetter.toUpperCase();
    // Slice off the rest of the word
    var restOfWord = array[i].slice(1, array[i].length);
    // Concatenate the rest of the word
    var result = upperFirst + restOfWord;
    // Push the result into our temporary array
    temp.push(result);
  }

  // Sort the new array
  temp.sort();

  // Run the binary search, as before
  while (low <= high) {
    mid = Math.floor((low + high) / 2);
    if (temp[mid] > target) {
      high = mid - 1;
      steps += 1;
      console.log("Step " + steps + ": mid " + temp[mid] + " comes after " + target);
    } else if (temp[mid] < target) {
      low = mid + 1;
      steps += 1;
      console.log("Step " + steps + ": mid " + temp[mid] + " comes before " + target);
    } else {
      console.log(target + " is alphabetically in position " + (mid+1) + ". Found in " + steps + " steps.");
     return ("index " + mid);
    }
  }
  console.log("No results found");
  return null;
}



// STRETCH 3:

function alphebetizeAndCapitalizeNames(array){
  var temp = [];
    for (var i = 0; i < array.length; i++) {
    var firstLetter = array[i].slice(0,1);
    var upperFirst = firstLetter.toUpperCase();
    var restOfWord = array[i].slice(1, array[i].length);
    var result = upperFirst + restOfWord;

    // handle case of lowercase last initial
    if (result.indexOf(" ") > 0){
      var lastInitialIndex = (result.indexOf(" ") + 1);
      // console.log("lastInitialIndex for " + array[i] + " is " + lastInitialIndex);
      var lastInitial = result.slice(lastInitialIndex, lastInitialIndex+1);
      lastInitial = lastInitial.toUpperCase();
      // console.log("lastInitial for " + result + " is " + lastInitial);
      var partialWord = result.slice(0,lastInitialIndex);
      var endOfWord = result.slice(lastInitialIndex+1, result.length);
      result = partialWord + lastInitial + endOfWord;
      // console.log(result);
    }
    temp.push(result);
  }
  temp.sort();
  return temp;
}

// no comments:
function binaryStringSearchIterative(array, target){
  var low = 0;
  var mid = 0;
  var high = array.length-1;
  var steps =  0;
  var temp = [];

  temp = alphebetizeAndCapitalizeNames(array);

  while (low <= high) {
    mid = Math.floor((low + high) / 2);
    if (temp[mid] > target) {
      high = mid - 1;
      steps += 1;
      console.log("Step " + steps + ": mid " + temp[mid] + " comes after " + target);
    } else if (temp[mid] < target) {
      low = mid + 1;
      steps += 1;
      console.log("Step " + steps + ": mid " + temp[mid] + " comes before " + target);
    } else {
      console.log(target + " is alphabetically in position " + (mid+1) + ". Found in " + steps + " steps.");
      return ("index: " + mid);
    }
  }
  console.log("No results found");
  return null;
}
