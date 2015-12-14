# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Challenge Solutions

Assume for the following challenges that you have a `binary_tree` data structure allowing you to:

* access the root node with `.root`.
* given any node, find the left child of that node with `.left_child`
* given any node, find the right child of that node with `.right_child`
* given any node, find the parent of that node with `.parent`

Also assume a `trie` data structure that allows you to:

* find the root with `.root`
* given any node, get a list of the node's children with `.children`
* given any node, find the node's parent with `.parent`

### Challenges - Binary Search Trees

1. Create a binary search tree from the following array: [0,1,2,3,4,5,6].

  *There are many possible solutions.  Here's a balanced one:*

  ```
         3
      /     \
     1       5
    / \     / \
   0   2   4   6
  ```

  *Here's another valid BST that's not balanced:*
  ```
        3
       / \
      2   4
     /     \
    1       5
   /         \
  0           6
  ```

2. Describe an algorithm to check if a particular number value is inside a binary search tree.  *Hint: start by checking if it's the value of the root.*

  *algorithm*:

  * start at root
  * for each node we look at
    * check the node's value against the value we're looking for
    * if they're equal, we've found the number inside the tree! we're done
    * otherwise if the node's value is less than our target number,  restart the process with this node's right child (move down the right subtree to check the nodes with greater values)
    * otherwise if the node's value is greater than our target number, restart the process with this node's left child (move down the left subtree to check the nodes with lesser values)
  * if we ever try to make one of those moves into a subtree where our target should be but find out that the subtree is empty, then we know the target number isn't in the tree

3. In a binary search tree, how can you find the minimum element? The maximum?

  *min algorithm: relies on the insight that the minimum will be the leftmost node in the tree (convince yourself!)*
    * start at root
    * for each node we look at
      * move to its left child
    * when we can't move anymore, we're at the minimum element in the tree

  *max algorithm: relies on the insight that the max is the rightmost node (convince yourself!)*
    * start at root
    * for each node we look at
      * move to its right child
    * when we can't move anymore, we're at the max

4. You run a website where users can assign creative names to colors. You store named colors as nodes in a self-balancing binary search tree, where the key of a node is the hex code of its color (for example: `#30af99`, `#c0ffee`). Each node also contains the name assigned to the color, the username of the user who named it, and the date and time when it was named. Users shouldn't be able to change the name of a color.  Pseudocode a `has_key` function to check if a particular hex value is already in the tree.  If the key is in the tree, your function should return `true`. If the key is not in the tree, your function should return `false`. Your function should take the tree and the hex color key as arguments.

       ```rb
       def has_key(tree, key):
         # start at root
         current_node = tree

         # go down the tree until we can't any more
         while current_node is not None:

           # each time we go down, move left if we're looking for a smaller key...
           if current_node.key > key:
             current_node = current_node.left
           # ... or move right if we're looking for a larger key
           elsif current_node.key < key:
             current_node = current_node.right
           # ... or if we've found the key, we're done!
           else:
             return true

         # if we get to the bottom without finding our key,
         # it must not be in the tree
         return false
      ```

### Actual Interview Questions

1. You're tasked with setting up a quiz that adapts to the user by displaying different questions based on the percent of questions the user has gotten right so far. If the user has above 70% right so far, the next question should be slightly harder. If the user has below 70% right, the next set question should be slightly easier.  Question difficulty is rated on a scale from 1 to 10. Describe how you could use a tree to run this quiz.

  *Stay tuned for the rest of tree week!*

1. Your job is to write a program that recognizes common words typed in on a 10-digit phone keypad (see the image below). Assume the user input comes to you as a sequence of numbers types into the phone.  Also assume you get a list of all the words you should include ahead of time. How would you structure your data?  

  ![phone keypad with letters](https://parentsof10.files.wordpress.com/2013/03/phone-keypad-picture-application.png)

  *Stay tuned for the rest of tree week!*
