# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Whiteboarding in Pairs - Solutions

## 1 Palindrome

```js
// javascript
function isPalindrome(str) {
  // simple solution
  str = str.toLowerCase();

  // removing spaces and punctuation
  // str = str.toLowerCase().replace(/(\s+|\W+)/g, '');

  for (var i = 0; i < str.length; i ++) {
    if (str[i] !== str[str.length - i - 1]) {
      return false;
    }
  }
  return true;
}
```

```rb
# ruby
def is_palindrome(str)
  # simple solution
  str = str.downcase

  # removing spaces and punctuation
  # str = str.downcase.gsub(/(\s+|\W+)/, '');

  i = 0
  while i < str.length
    if str[i] != str[str.length - i - 1]
      return false
    end
    i += 1
  end

  return true
end
```

## 2 Greatest Difference

```js
// javascript

// Solution 1 - nested for loops (O(n^2) time)
function greatestDiff(array) {
  var maxDiff = 0;
  for (var i = 0; i < array.length; i++) {
    for (var j = 0; j < array.length; j++) {
      if (array[i] - array[j] > maxDiff) {
        maxDiff = array[i] - array[j];
      }
    }
  }
  return maxDiff;
}

// Solution 2 - single for loop (O(n) time)
function greatestDiff(array) {
  var min = Infinity;
  var max = - Infinity;
  for (var i = 0; i < array.length; i++) {
    if (array[i] < min) {
      min = array[i];
    }
    else if (array[i] > max) {
      max = array[i];
    }
  }
  return max - min;
}
```

```rb
# ruby
# Solution 1 - nested for loops (O(n^2) time)
def greatest_diff(array)
  max_diff = 0

  i = 0
  while (i < array.length)
    j = 0
    while (j < array.length)
      if array[i] - array[j] > max_diff
        max_diff = array[i] - array[j]
      end
      j += 1
    end
    i += 1
  end

  max_diff
end

# Solution 2 - single for loop (O(n) time)
def greatest_diff(array)
  min = Float::INFINITY
  max = -Float::INFINITY

  array.each do |num|
    if num < min
      min = num
    elsif num > max
      max = num
    end
  end

  max - min
end
```
