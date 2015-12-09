# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Climb a Tree (Breadth-First Search) - Solutions

## Challenges

1. In English, describe how you would use breadth-first search to find any node with a given key. Your algorithm should assume you have a tree data structure and that you can access each node's key and its array of children. (Do not assume it's a binary search tree.) Assume you're given a target key to search for, and your method should return the first node that matches the target key.

  ```
  - Keep track of the queue of nodes to check.
  - Set up the queue as an array that contains just the root node.
  - As long as there are nodes in the queue, check them one by one. To check a node:
    - Remove it from the front of the queue (important so you don't visit the same node over and over!).
    - Check if its key matches the target key:
      - If it does, you're done (return the current node).
      - If it doesn't, continue searching:
        - Add the current node's children to the end of the queue.
        - Repeat this process from the front of the queue.
  - If you've searched through the entire queue and didn't find a matching node, return nil.
  ```

2. On the whiteboard, pseudocode a breadth-first search method. Assume you have a tree data structure that allows the following operations:

  * Given a tree or node, get the key of the node with `.key`
  * Given a tree or node, get the children of the node with `.children`

  ```ruby
  Class Tree
    def breadth_first_search(target_key)
      queue = [self]
      
      # while queue is not empty
        # remove the first node from the queue
        # check if the current node's key equals the target key (and return it if so)
        # add the current node's children to the queue
        
      # if we finish the while loop without returning a node, return nil
    end
  end 
  ```

3. Fork and clone the <a href="https://github.com/sf-wdi-24/ruby-breadth-first-search" target="_blank">starter code</a> into your `develop` folder. Implement the `breadth_first_search` method in `tree.rb`. Run the tests with the `rspec` command in the Terminal. **Make sure all tests run green before continuing.**

  <a href="https://github.com/sf-wdi-24/ruby-breadth-first-search/tree/solution" target="_blank">ruby-breadth-first-search (solution branch)</a>

4. In English or pseudocode, how would you modify your breadth-first search method to work on a binary search tree?

  *Your breadth-first search algorithm would need to add the left child and the right child to the queue instead of assuming that the node has a chilren array.*

5. Binary search trees can be faster than arrays at keeping data sorted when you insert and remove nodes, but only if the binary search tree is *balanced*, because a balanced tree has the minimum possible number of levels to store all its nodes. You can check if a tree is balanced by looking at where it has "missing children," or room where nodes could have a child but don't. A tree is balanced if all of the missing children are at the very bottom level of the tree or just one level higher. In English or psuedocode, how could you use breadth-first search to check whether a binary search tree is balanced?

  *You'd have to modify the algorithm to add the left and right children, as above. Then you'd want to keep track of the first depths at which you encounter a missing left or right child. To do so, you can have the queue store hashes that include the node itself as well as its depth. When you find the first missing child, save its depth to a variable.*
  
  *As you move through the rest of the tree after the first missing child, you can check if the depth of another missing child is ever greater than the saved minimum missing child depth + 2. If it is, the tree is not balanced. If you finish going through the whole tree without figuring out it's not balanced, it must be balanced.*
  
  ```ruby
  class Tree
    ##
    # This pseudocode shows how to track depth as you search
    # but does not fully solve the balance checking question.
    def breadth_first_search(target_key)
      # store node *and depth* in queue
      queue = [{ node: self, depth: 0 }]
    
     # while queue is not empty
        # remove the first object from the queue
        # check if the current object's node.key equals the target key (and return it if so)
        # iterate through current object's node.children and add them to the queue
          # when adding children, increase depth by 1
    end
  end
  ```

6. In English or psuedocode, how could you modify breadth-first search to return a group of matching nodes?

  *You'd want to return an array of matching nodes instead of just the first matching node. Before starting to search the tree, set up an empty output array. Where you were returning a matching node before, now push it into the output array instead. After searching the entire tree, return the output array (returning an empty output array means there are no matches, just like returning `nil`).*