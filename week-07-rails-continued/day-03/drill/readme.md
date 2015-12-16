# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Climb a Tree (Breadth-First Search)

Breadth-first search is an algorithm for searching through graphs, looking for one or more nodes that meet some search criteria. Breadth-first search is a general searching strategy - it doesn't make any assumptions about the relationships among nodes' keys (in contrast, think of a binary search tree, where each node's left subtree contains smaller keys and each node's right subtree contains larger keys). In fact, we can search by criteria that aren't based on keys at all.

**Breadth-first search chooses a start node and "visits" every node of a graph in order of how many edges the node is from that start.** In a tree, we pick the root as the start node. We'll also consider each node to be the same "length." In graph terms, that means the "weight" of each edge is the same. Breadth-first search only works for graphs with unweighted edges or graphs where all the edge weights are the same.

Breadth-first search spreads across the tree or graph, moving outward one step at a time from its start location.

![animated_bfs](https://cloud.githubusercontent.com/assets/7833470/11636443/fe1209e6-9cd0-11e5-8993-c77cf19e49ee.gif)

## Challenges

1. In English, describe how you would use breadth-first search to find any node with a given key. Your algorithm should assume you have a tree data structure and that you can access each node's key and its array of children. (Do not assume it's a binary search tree.) Assume you're given a target key to search for, and your method should return the first node that matches the target key.

2. On the whiteboard, pseudocode a breadth-first search method. Assume you have a tree data structure that allows the following operations:

  * Given a tree or node, get the key of the node with `.key`
  * Given a tree or node, get the children of the node with `.children`

3. Fork and clone the <a href="https://github.com/sf-wdi-24/ruby-breadth-first-search" target="_blank">starter code</a> into your `develop` folder. Implement the `breadth_first_search` method in `tree.rb`. Run the tests with the `rspec` command in the Terminal. **Make sure all tests run green before continuing.**

4. In English or pseudocode, how would you modify your breadth-first search method to work on a binary search tree?

5. Binary search trees can be faster than arrays at keeping data sorted when you insert and remove nodes, but only if the binary search tree is *balanced*, because a balanced tree has the minimum possible number of levels to store all its nodes. You can check if a tree is balanced by looking at where it has "missing children," or room where nodes could have a child but don't. A tree is balanced if all of the missing children are at the very bottom level of the tree or just one level higher. In English or psuedocode, how could you use breadth-first search to check whether a binary search tree is balanced?

6. In English or psuedocode, how could you modify breadth-first search to return a group of matching nodes?

## Stretch Challenge

* In English or pseudocode, how could you modify breadth-first search to return a parent node that's two nodes above the target key? Three nodes above? **Example:**

  ```ruby
  # return parent node two nodes above target key
  my_tree.breadth_first_parent_search("A", 2)
   
  # return parent node three nodes above target key
  my_tree.breadth_first_parent_search("E", 3)
  ```
