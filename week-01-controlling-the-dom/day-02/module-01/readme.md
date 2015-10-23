# HTML/CSS, Sublime Text

| Objectives |
| :--- |
| Hand-code well-structured HTML documents |
| Understand grid-based HTML structure |
| Write better CSS |
| Debug CSS more quickly |

## Discussion: CSS Basics

Answer the two questions assigned to your group. Feel free to do some research if you're not sure!

**Group 1:**
1. What does CSS stand for?
2. Explain the difference between an element, a class, and an id.

**Group 2:**
* Describe the concept of CSS specificity and how it is used.
* What are the three ways to implement CSS styling? Which one is best practice and why?

**Group 3:**
1. Explain the CSS Box Model.
2. What values can we use with the `display` property and what do they do?

**Group 4:**

1. What is the difference between `absolute`, `fixed`, `relative` and `static` positioning?
2. Explain floats and clears.

## Another Perspective

![calder-mobile](https://cloud.githubusercontent.com/assets/7833470/10673045/8edabf9c-78a8-11e5-9c61-5587d2389da9.jpg)

Many sources compare well-structured HTML to a tree. We can also think of it as a top-down architecture, like a mobile.

If you were asked to build this mobile with HTML and CSS, what classes and ids would you use?

## Emmet Sublime Plugin

Emmet is a web developer’s toolkit that can greatly improve your HTML and CSS workflow. It enables you to create HTML templates really quickly and will save you a lot of typing!

```html
h2.column-title>div#button-set>button*3^p
=>
<h2 class="column-title">
  <div id="button-set">
    <button></button>
    <button></button>
    <button></button>
  </div>
  <p></p>
</h2>

h2.column-title>ul>li.hello*4^p.caption
=>
<h2 class="column-title">
  <ul>
    <li class="hello"></li>
    <li class="hello"></li>
    <li class="hello"></li>
    <li class="hello"></li>
  </ul>
  <p class="caption"></p>
</h2>

h2.column-title>div#calendar>span>button
=>
<h2 class="column-title">
  <div id="calendar"><span><button></button></span></div>
</h2>
```

## Challenges

Fork and clone the <a href="https://github.com/sf-wdi-24/css-basics-challenges" target="_blank">css-basics-challenges</a> repo, and work through the challenges below. *Note you will have to link the CSS file first.*

1. Make an unordered HTML list of the following animals:  
  * mouse
  * canary
  * penguin
  * salmon
  * cat
  * goldfish
  * dog
  * sheep
  * parakeet
  * tuna

2. Apply the following colors to the list using ids:
  * mouse "color: gray"
  * canary "color: orangered"
  * penguin "color: black"
  * salmon "color: salmon"
  * cat "color: sienna"
  * goldfish "color: gold"
  * dog "color: tan"
  * sheep "color: steelblue"
  * parakeet "color: lime"
  * tuna "color: purple"

3. Add the following background colors to the list using classes:
  * mammal "lavenderblush"
  * bird "lightgray"
  * fish "lightyellow"

4. Make the mammals bold, the birds italic, and the fish underlined.

5. Create a new unordered list, and add a list item for each the following plants:
  * Dogwood Tree
  * Oak Tree
  * Saguaro
  * Kelp
  * Venus Fly Trap
  * Ent

6. Give all unordered lists a border with a width of 3 pixels, a color of plum, and a style of dotted. Also, give them a border radius of 5px.

7. Give all list items a top border with a width of 3 pixels, a color of seagreen, and a style of solid.

## Stretch Challenge

Modern web developers rarely start from scratch anymore. Many of us use frameworks such as Bootstrap, Foundation, Skeleton, Initializr and others. These frameworks take the architectural decision-making out of the process, allowing us to focus on more specific design, interface and development questions.

That said, there's still value in creating your own grid from scratch to solidify some of the most elusive concepts behind writing great HTML and CSS.

**Challenge:** Fork and clone the <a href="https://github.com/sf-wdi-24/css-grid-challenges" target="_blank">css-grid-challenges</a> repo, then add CSS styles try to match this design:

![ducky-design](https://cloud.githubusercontent.com/assets/7833470/10686168/389ac60e-7916-11e5-8e87-013509a89a38.png)

## Resources

* <a href="http://docs.emmet.io/cheat-sheet" target="_blank">Emmet Cheat Sheet</a>
