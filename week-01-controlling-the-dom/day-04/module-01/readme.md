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

You can only use jQuery if it's included in your page.

The quickest way to include jQuery in your project is to grab the jQuery library using a "CDN" (a blazing fast "content delivery network") and dropping it into a script tag in the head of your html (just google "jQuery cdn" and copy paste!):

``` html
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
    </head>
    <body>
        <!-- Nothing here yet! -->
    </body>
</html>

```

Sites like: github.com, css-tricks.com, and jquery.com (!) all include the jQuery library on their page. This means all you have to do is open up your Chrome Developer Console on one of those sites, and you can start playing with jQuery on the page

### Using jQuery

You know you're working with jQuery any time you see a `$` in your code.

As you're working with jQuery to manipulate DOM elements, you are almost always either *getting* or *setting* a value. Memorize this pattern:  
- `$("CSS Selector").someJqueryMethodName()` - **getting** a value
- `$("CSS Selector").someJqueryMethodName(setterValue)` - **setting** a value

For example, if you are viewing this readme on github.com, then you can try the following in your Chrome Developer Console:  
- `$('article').text()` -- **get** the text of the readme (it lives inside of an `article` tag)
- `$('article').text("Boo!")` -- **set** the text of the readme to "Boo!"

Wowa!

Let's try another:  
- `$('article').css("background-color")` -- **get** the background color
- `$('article').css("background-color", "blue")` -- **set** the background color to blue.

### Documentation

Check out the `.text()` and `.css()` methods in the jQuery API Documentation: [text](http://api.jquery.com/text/), [css](http://api.jquery.com/css/).
- Pay close attention in the documentation: there's one section that talks about how to "get" text, and there's another section that talks about how to "set" text.
- `.text()` and `.css()` are not native javascript methods! They only work on jQuery-wrapped DOM Elements (that's what that `$` is doing).

For more cool DOM manipulation tricks, you'll need to hit the docs:
- jQuery API [Documentation]([jquery.com](jquery.com))
    - [Manipulation Methods](http://api.jquery.com/category/manipulation/)
    - [Tree Traversal Methods](http://api.jquery.com/category/traversing/)

## Challenges

#### Nature Drawing 101: Draw a Tree!
1. Draw the structure of the sf-wdi-21 github repository
2. Draw the struture of the following HTML document:

``` html
<!DOCTYPE html>
<html>
  <head>
    <title>My Site</title>
  </head>
  <body>
    <header>
      <ul>
        <li><a href="/">Home</a></li>
        <li><a href="/about">About</a></li>
        <li><a href="/contact">Contact</a></li>
      </ul>
    </header>

    <section>  
      <h1>Welcome to my site!</h1>
      <img src="/static/say_cheese.jpg">
      <p>Words and <a href="/">links</a></p>
    </section>

    <footer>
      <small>Copyright 2015 Jon Doe.</small>
    </footer>
  </body>
</html>
```

* How many children does `header` have?
* Name a direct child of the `p` element.
* Name a direct parent of the `p` element
* What is the parent of the `html` element?

#### CSS Selector Challenge
Please refer to [this google doc](https://docs.google.com/document/d/1sKbuZaSio1o65iRdkNpB03pwJfJj98GPHUJQsoKJmE4/edit?usp=sharing).

For each page, come up with as many CSS Selectors as you can think of to select the html elments in **red**, and *only* the elements in red.

#### jQuery Selector Challenge

Use jquery to select the element containing the words "Hello There" with as many different selectors as you can think of:

``` html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Ex 1</title>
</head>
<body>
   <div id="greeting">Hello There</div>
</body>
</html>
```

1. How would you *get* the value "Hello There"?
2. How would you change (or *set*) the value to "Hola"?
3. How would you add an h1 to the page that says "A Spanish Greeting"?
4. How would you add a second greeting ("Que tal?"), below the first?
5. How would you add the class "blue" to both greetings?

#### Indiana Jones And the Temple of DOM

Go to the [General Assembly homepage](https://generalassemb.ly/) and open your Chrome Developer Console.

1. Grab the huge text splashed across the front page.
    * Get its current text.
        * Change it to "Indiana Jones and the Temple of DOM"
    * Add a `small` tag containing the text "(Rated G)" at the end of the line.
1. Turn the big red button blue.
1. Change the background of the first section heading to yellow.
1. Make the GA icon 100 pixels tall.
1. Grab the first big image on the right (the one with the red-cushioned chair).
    * Get its current image src. (image url)
    * Swap it for this GIF of [Indiana Jones](http://media2.giphy.com/media/MS0fQBmGGMaRy/giphy.gif).
1. Change the text of *only* the first paragraph to: "Snakes. Why did it have to be snakes?"
    * Now, change the text of *every* paragraph to the same quote.

1. Bonus: Combine all your code into a single function called `changeAllTheThings`. When you call the function, it should make all your changes to the page.

## Resources

* <a href="https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Getting_started/Selectors" target="_blank">Getting Started with CSS Selectors</a>
* <a href="https://css-tricks.com/multiple-class-id-selectors" target="_blank">Multiple Class / ID and Class Selectors</a>
* <a href="https://www.codecademy.com/tracks/jquery" target="_blank">Codecademy jQuery Track</a>
