var sameArray = function(arr1, arr2) {
  if (arr1.length === 2 && arr2.length === 2) {
    if (arr1.indexOf(arr2[0]) > -1 && arr1.indexOf(arr2[1]) > -1) {
      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
};

var testArr1 = [2, 5];
var testArr2 = [5, 2];
console.log(sameArray(testArr1, testArr2));
// expected output: true

var testArr3 = [3, 6];
var testArr4 = [3, 2];
// expected output: false
console.log(sameArray(testArr3, testArr4));

var testArr5 = [8];
var testArr6 = [8, 5];
console.log(sameArray(testArr5, testArr6));
// expected output: false
