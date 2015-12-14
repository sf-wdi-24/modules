# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Ruby Binary Search - Solutions

```ruby
##
# Input should be a sorted array of integers and a target value.
#
# Output should be the index of the target value if found or `false` if not found.
#
# Find the low, high, and mid indexes of the input array.
#
# Keep looping while the low index is less than the high index.
#
# If the target value is equal to the value at the mid index, return the mid index.
#
# If the target value is greater than value at the mid index:
# Set the low index to the mid index + 1.
# Set the mid index to the sum of the high index and the low index, divided by two.
#
# Else if the target value is less than value at the mid index:
# Set the high index to the mid index - 1.
# Set the mid index to the sum of the high index and the low index, divided by two.

##
# Binary search iterative solution
#
def binary_search_iterative(array, target)

  # declare variables for low, high, and mid indexes
  low = 0
  high = array.length - 1
  mid = (low + high) / 2

  # while low index is less than high index
  while low <= high do
    return mid if target == array[mid]
    puts "low: #{low}, mid: #{mid}, high: #{high}"

    if target > array[mid]
      # move lower bound up to mid + 1, recalculate new mid
      low = mid + 1
      mid = (low + high) / 2
    elsif target < array[mid]
      # move upper bound down to mid - 1, recalculate new mid
      high = mid - 1
      mid = (low + high) / 2
    end
  end

  # if target not found, return false
  return false
end

##
# Binary search recursive solution
#
def binary_search_recursive(array, target, low = 0, high = array.length - 1)

  # if target not found, return false
  return false if low > high

  # declare variable for mid index
  mid = (low + high) / 2

  return mid if target == array[mid]
  puts "low: #{low}, mid: #{mid}, high: #{high}"

  if array[mid] > target
    high = mid - 1
  else
    low = mid + 1
  end

  if target > array[mid]
    # move lower bound up to mid + 1
    low = mid + 1
  elsif target < array[mid]
    # move upper bound down to mid - 1
    high = mid - 1
  end

  binary_search_recursive(array, target, low, high)
end

sample_array = [1, 2, 5, 6, 8, 10, 22, 33, 37]
puts binary_search_iterative(sample_array, 2)
puts binary_search_recursive(sample_array, 2)
puts binary_search_iterative(sample_array, 54)
puts binary_search_recursive(sample_array, 54)

even_array = [1, 2, 5, 6, 8, 10, 22, 33, 37, 40]
puts binary_search_iterative(even_array, 37)
puts binary_search_recursive(even_array, 37)
```
