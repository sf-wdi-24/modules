# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Ruby Binary Search

Binary search is a type of search method used to find the position (index) of a target item in a sorted array.

```ruby
def binary_search(array, target)
  # your code here
end

sample = [0, 1, 3, 5, 8, 13, 21]
target = 1

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

The process continues, eliminating half of the elements, then comparing the target value to the value of the middle element of the remaining elements, until the target value is either found (and its position is returned), or until the entire array has been searched (and `false` is returned).

## Real-Life Example

<a href="https://study.cs50.net/binary_search" target="_blank">Searching for a name in a telephone book using binary search</a> (an awesome introduction to binary search).

## Challenges

1. Pair up! Have one partner pick a number between 1 and 100. The other partner should start at 50 and attempt to guess the number. The first partner should provide feedback of "higher", "lower", or "correct" to help guide the guesses to get to the chosen number.

2. After this real-life implementation:
  * Pseudocode the steps for implementing binary search.
  * Swap solutions with another pair of students and exchange feedback.
  * Code your binary search solution in Ruby.

## Stretch Challenge

* Implement a recursive solution (instead of iterative).

## Resources

* <a href="https://en.wikipedia.org/wiki/Binary_search_algorithm" target="_blank">Binary search algorithm - Wikipedia</a>
* <a href="http://bigocheatsheet.com" target="_blank">Big-O Cheat Sheet</a>
* <a href="http://www.cs.cmu.edu/~15110-f12/Unit05PtB-handout.pdf" target="_blank">Binary Search - Carnegie Mellon University</a>
* <a href="https://rob-bell.net/2009/06/a-beginners-guide-to-big-o-notation" target="_blank">A beginner's guide to Big O notation - Rob Bell</a>
