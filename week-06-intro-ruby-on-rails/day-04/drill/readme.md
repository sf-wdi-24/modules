# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Ruby Bubble Sort

## Bubble Sort Refresher
Pre-work: <a href="https://www.youtube.com/watch?v=lyZQPjUT5B4" target="_blank">First, some Hungarian ("Csángó") folk dance.</a>

Bubble sort is one of the first sorting algorithms you should try and master.  It essentially forces larger elements to 'sink' to the bottom/back while inadvertently 'floating' smaller elements to the top/front of a list.  This is done with numerous comparisons between one element in an array and its neighbor.  

### Sort the list using Bubble Sort: [5,4,2,3,1,6]

#### Iteration 1
Look at the first two elements in the list.

0: [**5, 4**,2,3,1,6]  

Is 5 > 4 ? Yes! Swap!

If an element on the left (5) is greater than the element on the right (4), the two elements 'swap' locations

1: [4,**5,2**,3,1,6]  

2: [4,2,**5,3**,1,6]  

3: [4,2,3,**5,1**,6]  

4: [4,2,3,1,**5,6**]  


**Important:** We now know that the last element in the list is the largest element in the list. There's no need to do a comparison with that number ever again.


#### Iteration 2

0: [**4,2**,3,1,5,~~6~~]

1:  [2,**4,3**,1,5,~~6~~]

2:  [2,3,**4,1**,5,~~6~~]

3:  [2,3,1,**4,5**,~~6~~]

Stop!

Remember: we know that the last element is the largest number in the list.  There is no need to compare against that number ever again.  We also now know that the **second** to last number is the second-largest number; no need to move that one ever again as well. (Detect a trend?)

### Iteration 3

0: [**2,3**,1,4,~~5,6~~]  

If an element on the left has met a larger or equal element, we look at its bigger neighbor and now compare the larger neighbor to it's neighbor on the right.  The process is continued until we reach this iteration's established end.

1: [2,**3,1**,4,~~5,6~~]

2: [2,1,**3,4**,~~5,6~~]

Stop!

We don't stop sorting until we hit this iteration's established end.

### Iteration 4

0: [**2,1**,3,~~4,5,6~~]

1: [1,**2,3**,~~4,5,6~~]

Stop!

### Iteration 5
0: [**1,2**,~~3,4,5,6~~]

Stop!

When there is only one element (the first element) left in our unsorted list, it is already sorted for us as a freebie!

### List is now sorted using Bubble Sort: [1,2,3,4,5,6]

![](http://cdn2.crunchify.com/wp-content/uploads/2013/01/BubbleSort-Algorithm-Crunchify.jpg)

### Now write your own bubble <a href="https://github.com/sf-wdi-24/ruby-bubble-sort" target="_blank">sort</a>!

Run the tests in the `spec` folder, and write your code in `bubble_sort.rb`.

Keep in mind all the different ways you can explore your code:

**From the Command Line**:  
```ruby
ruby bubble_sort.rb # just make sure you're printing some output!
```

**In the REPL**:  
```ruby
irb
# or
pry
```

```ruby
pry > require "./bubble_sort.rb"
pry > bubble_sort([3,2,1])  # => when we start this returns nil
```

**Using Rspec Tests**:   
```bash
rspec
# or
rspec spec/bubble_sort_spec.rb
# or, run an individual test
rspec -e "handles zero"
```
If you need guidance for the challenges <a href="https://github.com/sf-wdi-24/ruby-bubble-sort/tree/solutions" target="_blank">here</a> are the solutions.
