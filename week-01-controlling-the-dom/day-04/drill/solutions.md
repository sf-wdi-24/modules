## Swapping Variables: Solution
```
var x = "a";
var y = "b";

// check values of x and y
console.log("x: " + x + ", y: " + y);

// swap x and y
var temp = x;
x = y;
y = temp;

// check values of x and y again
console.log("x: " + x + ", y: " + y);
```

## Reverse a String: Solution
```
var reverse = function(str) {
  var newStr = "";
  for (var i = str.length - 1; i >= 0; i -= 1) {
    newStr += str[i];
  }
  return newStr;
};

reverse("Hello");
```

## Vowel Count: Solution
```
var vowels = function(str) {
  var vowelList = ["a", "e", "i", "o", "u"];
  var vowelCount = 0;
  for (var i = 0; i < str.length; i += 1) {
    if (vowelList.indexOf(str[i]) !== -1) {
      vowelCount += 1;
    }
  }
  return vowelCount;
};

vowels("pineapple");
```
