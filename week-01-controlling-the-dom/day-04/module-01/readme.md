# Intro DOM Manipulation & jQuery

| Objectives |
| :--- |
| Explain the benefits of using jQuery for DOM manipulation |
| Identify the main differences between jQuery and Vanilla JS |
| Select DOM elements using CSS selectors and jQuery |
| Use jQuery to dynamically change the DOM |

## What is the DOM?

DOM stands for **Document Object Model**. It's a fancy way of describing what's going on in your browser when you visit a website. You may think a webpage is just a chunk of HTML, CSS, and JavaScript code. But, there's an important step between a webpage being pure data (text) and being a rendered page users can explore. Everything you interact with in the browser can be represented as a JavaScript object. For example, this paragraph is an object, and it's full of information about being an HTML `<p>` tag.

### DOM Analogy: The Human Body

* HTML = Skeleton
* Javascript = Muscles, Brain, and Organs
* CSS = Skin and Clothing

![muscles](https://cloud.githubusercontent.com/assets/7833470/10700126/8e2997da-7970-11e5-96ba-1e5eaf793394.jpg)

## Intro to jQuery

jQuery is a **powerful, easy-to-use JavaScript library**. It was invented in 2005 and has made our lives as developers better ever since. The slogan for jQuery is "write less, do more". jQuery is a great toolbox that provides convenient functions we can use as opposed to writing the functionality we need from scratch.

*We use jQuery because it's:*

* **Convenient:** solves problems developers commonly face.
* **Less Buggy:** ensures JavaScript DOM manipulation works the same, cross-browser.
* **Modern:** brings JavaScript DOM manipulation into the 21st century.
* **Popular:** 26.95% of all sites use jQuery!

### jQuery vs. Vanilla JS

It's important to note that any DOM manipulation done with jQuery can also be done with pure (vanilla) JavaScript. Some argue <a href="http://youmightnotneedjquery.com" target="_blank">you might not need jQuery</a>. It can be overkill, depending on what you're doing.

Take a look at this <a href="http://bl.ocks.org/joyrexus/5322252" target="blank">Comparison of jQuery and Vanilla JS</a>. Here are some of the basic differences:

**Selecting Elements**

```js
// jquery
var divs = $('div');

// vanilla js
var divs = document.querySelectorAll('div');
```

**Selecting Elements by Class**

```js
// jquery
var content = $('.content');

// vanilla js
var content = document.getElementsByClassName('content');
```

**Selecting Elements by Id**

```js
// jquery
var about = $('#about');

// vanilla js
var about = document.getElementById('about');
```

**Creating Elements**

```js
// jquery
var newDiv = $('<div></div>');
$('body').append(newDiv);

// vanilla js
var newDiv = document.createElement('div');
document.body.appendChild(newDiv);
```

### Including jQuery

To use jQuery, you must include the library in your page. The quickest way to include jQuery in your project is to copy the link to the CDN (content delivery network) and put it into a script tag at the bottom of your HTML `<body>`. You can get the CDN by searching for "jQuery" on <a href="https://cdnjs.com" target="_blank">cdnjs</a>.

**Important:** Your JavaScript file MUST come after jQuery in the order you require scripts. This is because the page loads in order, so the jQuery library must be loaded before you can use any of it's functionality.

``` html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
</head>
<body>
  <!-- html code here -->

  <!-- jquery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

  <!-- custom script -->
  <script type="text/javascript" src="main.js"></script>
</body>
</html>
```

Sites like GitHub, CSS-Tricks, and jquery.com (!) all include the jQuery library on their page. This means all you have to do is open up the Chrome Developer Console on one of those sites, and you can start experimenting with jQuery on the page.

### Using jQuery

You know you're working with jQuery any time you see a `$` in your code.

As you're working with jQuery to manipulate DOM elements, you are almost always either *getting* or *setting* a value. Memorize this pattern:

* `$('css-selector).someJqueryMethodName()` - **get** a value
* `$('css-selector).someJqueryMethodName(setterValue)` - **set** a value

For example, if you are viewing this `readme` on GitHub, you can try the following in your Chrome Developer Console:

* `$('article').text()` - **get** the `readme`'s text (it lives inside of an `article` tag)
* `$('article').text("Boo!")` - **set** the `readme`'s text to "Boo!"

Let's try another:

* `$('article').css("background-color")` - **get** the background color
* `$('article').css("background-color", "blue")` - **set** the background color to blue

### Documentation

Check out the `.text()` and `.css()` methods in the jQuery API Documentation: <a href="http://api.jquery.com/text" target="_blank">text</a>, <a href="http://api.jquery.com/css" target="_blank">css</a>

* Pay close attention in the documentation - there's one section that talks about how to *get* text, and there's another section that talks about how to *set* text.
* `.text()` and `.css()` are not native javascript methods! They only work on jQuery-wrapped DOM Elements (that's what that `$` is doing).

For more cool DOM manipulation tricks, you'll need to hit the docs:

* <a href="http://api.jquery.com" target="_blank">jQuery API Documentation</a>
  * <a href="http://api.jquery.com/category/manipulation" target="_blank">DOM Manipulation Methods</a>
  * <a href="http://api.jquery.com/category/traversing" target="_blank">Tree Traversal Methods</a>

## Challenges

### Draw a Tree

1. Draw the structure of the sf-wdi-24 github repository.
2. Draw the structure of the following HTML document:

  ``` html
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>My Site</title>
  </head>
  <body>
    <div class="header">
      <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/about">About</a></li>
        <li><a href="/contact">Contact</a></li>
      </ul>
    </div>

    <div class="section">
      <h1>Welcome to my site!</h1>
      <img src="say-cheese.jpg">
      <p>Words and <a href="/">links</a></p>
    </div>

    <div class="footer">
      <small>Copyright 2015 Jon Doe.</small>
    </div>
  </body>
  </html>
  ```

  * How many children does the `<div>` with class `header` have?
  * What is the direct child of the `<p>` element?
  * What is the direct parent of the `<p>` element?

### CSS Selectors

For the following code blocks, come up with as many CSS selectors as you can think of to select the HTML elements in **red**, and *only* the elements in red.

**Code Block #1**

<img src="https://cloud.githubusercontent.com/assets/7833470/10717913/b94098a2-7b22-11e5-8115-decf62e0b65b.png" style="border:1px solid #ddd">

**Code Block #2**

<img src="https://cloud.githubusercontent.com/assets/7833470/10717912/b9405ed2-7b22-11e5-9a64-07a19d7473d7.png" style="border:1px solid #ddd">

**Code Block #3**

<img src="https://cloud.githubusercontent.com/assets/7833470/10717909/b93ebabe-7b22-11e5-95a6-605fb5ca9312.png" style="border:1px solid #ddd">

**Code Block #4**

<img src="https://cloud.githubusercontent.com/assets/7833470/10717911/b940228c-7b22-11e5-84f5-0ee1b941f45e.png" style="border:1px solid #ddd">

**Code Block #5**

<img src="https://cloud.githubusercontent.com/assets/7833470/10717910/b93fc8dc-7b22-11e5-8fc7-44d9f96e3fab.png" style="border:1px solid #ddd">

### jQuery Selectors

1. Use jQuery to select the element containing the words "Hello There" with as many different selectors as you can think of:

  ``` html
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Example 1</title>
  </head>
  <body>
    <div id="greeting">Hello There</div>
  </body>
  </html>
  ```

2. How would you *get* the value "Hello There"?
3. How would you change (or *set*) the value to "Hola"?
4. How would you add an `<h1>` to the page that says "A Spanish Greeting"?
5. How would you add a second greeting ("Que tal?") below the first?
6. How would you add the class "section" to both greetings?

### Indiana Jones And the Temple of DOM

Go to the <a href="https://generalassemb.ly" target="_blank">General Assembly homepage</a>, and open your Chrome Developer Console.

1. Select the huge text splashed across the front page.
  * *Get* its text.
  * Change (*set*) its text to "Indiana Jones and the Temple of DOM"
  * Add a `<small>` tag containing the text "(Rated G)" to the end of the line.
2. Turn the big red button blue.
3. Select the image to the right of the "Full-Time Courses" section (the one with the red-cushioned chair).
  * *Get* its image `src` (image url).
  * Swap out the image for this <a href="https://cloud.githubusercontent.com/assets/7833470/10717957/17c7ef00-7b24-11e5-8fea-4484b908f8a7.gif" target="_blank">GIF of Indiana Jones</a>.
4. Change the text of *every* paragraph on the page to: "Snakes. Why did it have to be snakes?"
5. **Bonus:** Combine all your code into a single function called `changeAllTheThings`. When you call the function, it should make all your changes to the page. (You'll want to use a Script Snippet in your Chrome Developer Console for this. `cmd + option + J > Sources Tab > Snippets Sub-Tab`)

<!-- ## Stretch Challenges

TODO: Write disappearing boxes challenge in JSFiddle -->

## Resources

* <a href="https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Getting_started/Selectors" target="_blank">Getting Started with CSS Selectors</a>
* <a href="https://css-tricks.com/multiple-class-id-selectors" target="_blank">Multiple Class / ID and Class Selectors</a>
* <a href="https://www.codecademy.com/tracks/jquery" target="_blank">Codecademy jQuery Track</a>
