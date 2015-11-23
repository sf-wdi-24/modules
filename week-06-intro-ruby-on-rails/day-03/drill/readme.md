# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Ruby Binary Search

Binary search is a type of search method used to find the position (index) of a target item in a sorted array.

```ruby
def binary_search(array, target)
  # your code here
end

sample = [0, 1, 3, 5, 8, 13, 21]
target = 8

binary_search(sample, 1)
#=> 1 (the index that the target value is located in the sample array)
```

The binary search algorithm begins by comparing the target value to the value of the middle element of the sorted array.

```ruby
# starting index
low = 0

# ending index
high = array.length - 1
#=> 6

# middle index
mid = (low + high) / 2
#=> 3
```

If the target value is equal to the middle element's value, then the position is returned, and the search is finished.

```ruby
array[mid] == target
#=> 5 == 1
#=> false
```

If the target value is less than the middle element's value, then the search continues on the lower half of the array. If the target value is greater than the middle element's value, then the search continues on the upper half of the array.

```ruby
array[mid] > target
#=> 5 > 1
# true
# search continues on lower half

array[mid] < target
#=> 5 < 1
#=> false
# this condition won't occur because it's false
```

The process continues, eliminating half of the elements, then comparing the target value to the value of the middle element of the remaining elements, until the target value is either found (and its position is returned), or until the entire array has been searched (and "not found", or `nil` is returned).

## Real-Life Example

<a href="https://study.cs50.net/binary_search" target="_blank">Searching for a name in a telephone book using binary search</a> (an awesome introduction to binary search).

## Challenges

1. Pair up! Have one partner pick a number between 1 and 100. The other partner should start at 50 and attempt to guess the number. The first partner should provide feedback of "higher", "lower", or "correct" to help guide the guesses to get to the chosen number.

2. After this real-life implementation:
  * Pseudocode the steps for implementing a binary search.
  * Swap solutions with another pair of students and exchange feedback.
  * Code your binary search solution in Ruby.

## Stretch Challenges

1. Implement a recursive solution (instead of iterative).

2. Implement a solution for an array of names (strings).

### Sample Data

```ruby
# integer data set
prime_numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541]

# string data set
wdi_24_students = ["Adam", "Alan", "André", "Carlos", "Cynthia", "Dave", "Eddy", "John", "Michael", "Stanley", "Steven", "Trung", "Victoria", "Zohar"]
```

## Resources

* <a href="https://en.wikipedia.org/wiki/Binary_search_algorithm" target="_blank">Binary search algorithm - Wikipedia</a>
* <a href="http://bigocheatsheet.com" target="_blank">Big-O Cheat Sheet</a>
* <a href="http://www.cs.cmu.edu/~15110-f12/Unit05PtB-handout.pdf" target="_blank">Binary Search - Carnagie Mellon University</a>
* <a href="https://rob-bell.net/2009/06/a-beginners-guide-to-big-o-notation" target="_blank">A beginner's guide to Big O notation - Rob Bell</a>
