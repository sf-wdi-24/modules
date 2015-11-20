def bubble_sort(array)
  # set a flag stating that the array is not sorted
  sorted = false
  until sorted
    # until sorted is true
    sorted = true
    # iterate n-1 times over the array, n is the count of elements in the array
    (array.count - 1).times do |index|
      # if the value of element at the current index
      # is greater than the element next to it
      if array[index] > array[index + 1]
        # swap the values at those indices
        # note: this uses multiple assignments in one line
        array[index], array[index + 1] = array[index + 1], array[index]

        # could also do:
        # left = array[index]
        # right = array[index + 1]
        # array[index] = right
        # array[index + 1] = left

        # set sorted to false (because the array isn't sorted yet)
        sorted = false
        # so the until loop starts again
      end
    end
  end
  # return the sorted array
  array
end


# def bubble_sort(array)
#       swapped = true
#       length = array.length-1
#       while swapped do
#           i = 0
#           swapped = false
#           while i <length
#               n = i +1
#               if array[i] > array[n]
#                   temp = array[i]
#                   array[i]= array[n]
#                   array[n] = temp
#                   swapped = true
#               end
#              i+=1
#           end
#       end
#       return array
# end
