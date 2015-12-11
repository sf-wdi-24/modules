# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Grow a Tree

<img src="https://cloud.githubusercontent.com/assets/1329385/11750847/88a1bdd8-9fea-11e5-8efb-f2feab151083.gif">

## Grow a Tree

We've been discussing trees and using them constantly in class. Have you noticed?

Let's take yesterday's module as an example, when we created an `INDEX` in PostgreSQL it defaulted to be a special type of index. The default indexing method is `btree` which we can find out by looking at the <a href="http://www.postgresql.org/docs/9.2/static/sql-createindex.html" target="_blank">PostgreSQL `CREATE INDEX` Documentation</a>.

<details>
  <summary>What do you think `btree` stands for? **Hint** programmers are lazy.</summary>

  Binary Tree.
</details>


## The Challenge

We've spoken about these trees long enough, now it's time for you to grow one with the aid of your fellow students.

### Minimum Requirements

1. You must provide two classes which model your tree.
  * `Tree` which encapsulates the root node of a tree and controls access to nodes in a tree.
  * `Node` each node in the tree with access to its children in the tree.
1. You must create an instance of your `Tree`.
  * Require a root node to be sent on the initialization of your Tree.
  * Allow access to read the root node but not write to it.

Planter for your tree may be found <a href="https://github.com/sf-wdi-24/grow-a-tree" target="_blank">Grow a Tree</a>. Fork, clone and checkout the code locally to get started.

You're not done until the tests pass.

## Extended

People grow trees and they're a core data structure used in computers. We use them everywhere.

Let's do a quick dive into PostgreSQL to see how they implement trees. Maybe this will give you some ideas for the drill tomorrow.

Oh, and this code you may not recognize syntax but I'm hoping you'll be able to recognize a few things.

The <a href="https://github.com/postgres/postgres/blob/71fc49dfe1d99bd83cd99c2e7a39f93e07d19310/src/backend/lib/rbtree.c" target="_blank">Red/Black Binary Search Trees of PostgreSQL</a>.

**NOTE** if you document your code like PostgreSQL, we'll be nicer.
