# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Interview Workshop: Algorithm Design

| Objectives |
| :--- |
| Increase an algorithm's efficiency by storing more information. |
| Detail reasons for trading space for time with algorithms. |

![It's bigger on the inside.](http://25.media.tumblr.com/1fb0904fc342da6132256d95c6dca30c/tumblr_mw82dpzuqA1s5ju90o1_500.gif)

## Space/Time Tradeoff

Working with algorithms will require an attention to how they run on a computer. We'll simplify a computer into two major components.

**Processor**: Time

**Memory**: Space

When we write an algorithm we've been paying attention to how quickly we can get the information we expect. Often we'd store extra information in order to be able to speed up how quickly we find the information.

An example of this can be found when we discussed indexing with Elasticsearch. We'd index a document with one process (`indexer`) then search it with another (the search API). In this case, we'd store more information (indexing) so that we can search quicker. This is an example of trading space for time.

Some systems can't store as much information so we may make the tradeoff in the other direction. Instead of saving processing time we'd instead save memory space. This may come up while working on mobile applications or embedded devices where memory isn't as large as on a personal computer.

### TL;DR

We can make an algorithm **quicker** by taking up **more space**.

We can make an algorithm take up **less space** by **making it slower**.

* <a href="https://en.wikipedia.org/wiki/Space%E2%80%93time_tradeoff" target="_blank">Space/Time Tradeoff</a>

## Exercise

### Step 1

Create an algorithm which returns the number of occurrences for each word in this paragraph using an array:

> Skateboard messenger bag echo park bespoke schlitz, keytar kinfolk salvia aesthetic 8-bit readymade taxidermy cold-pressed. Messenger bag man bun everyday carry tacos drinking vinegar, humblebrag pitchfork organic williamsburg sriracha godard tattooed tousled literally. Hammock cronut readymade twee. Celiac cornhole everyday carry butcher roof party green juice williamsburg. Tofu yuccie hashtag, skateboard affogato photo booth wayfarers tousled PBR&B DIY 3 wolf moon jean shorts normcore authentic. Chia twee lo-fi four loko, biodiesel trust fund franzen echo park tofu williamsburg chillwave. You probably haven't heard of them selvage organic, bicycle rights shabby chic waistcoat hammock tilde.

### Step 2

Update your algorithm from <a href="#user-content-step-1">Step 1</a> to use a HashTable instead of an array.

### Step 3

We've been making our algorithms run faster by using hash data structures often. These structures are convenient and how they're built will highlight an example of a space/time tradeoff.

Let's look at how HashTables work and as a class attempt to implement our own rudimentary HashTable.

* <a href="https://www.youtube.com/watch?v=h2d9b_nEzoA" target="_blank">What is a HashTable</a>
