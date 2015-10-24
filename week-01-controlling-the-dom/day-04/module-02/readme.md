# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> DOM Context & Event-Binding

## DOM Events

| Objectives |
| :---- |
| Explore DOM events and their triggers. |
| Attach event listeners to DOM Elements using jQuery. |
| Respond to events using jQuery and `this`. |

### Events are always happening!

![Click Event](http://www.createursoftware.net/Windows/XP/img/tous/gif/clicking.gif)

In chrome we can use the following utility function to log events occurring in the window:

```js
monitorEvents(window, ["click", "keypress", "resize", "scroll"])
``` 

Here are some more native events:

* `click`
* `mouseenter` (i.e. "hover")
* `mouseleave`
* `load`
* `DOMContentLoaded`
* `keydown`, `keypress`, `keyup`
* `scroll`
* `resize`

Events tell us information, not just that a "click" occurred but: where, when and what was clicked...

* `x` and `y` screen coordinates.
* DOM element that got clicked.
* Time (timestamp) when it happened.

### Got FOMO? Then you need event listeners.

Let's listen for a click on our `greeting` div:

```js
$("#greeting").on("click", function handleClick(event){
  alert("Clicked!!");
};
```

We can also listen for other types of events like hovering (but do we want "mouseover", "mouseenter" or "mouseleave"!?):

```js
$("#greeting").on("mouseover", function handleMouseover(event){
  console.log("You hovered on", this);
};

```

So long as we know the name of the event we're listening for, we can "attach" or "bind" an event listener to our element!

### Callbacks & Event Listeners

When you pass a function into a function (recursive), we call the second function a "callback" function. This is a scary and confusing way of saying, "here are some instructions for you to follow later". This pattern is used a lot in jQuery.

In jQuery we often use a pattern called "Event Binding", we also talk about "Event Listeners".

| metaphor                                      | example               |
|----------------------------------------------:|----------------------:|
| A subject (the thing doing the listening).    | `$("p")`              |
| A trigger (the "event" to listen for).        | `.on("mouseover", ...)`    |
| An action (how to respond).                   | `function handleHover(){ ... }`   |

All together this looks like:

```js
$("p").on("mouseover", function handleHover(event){
    console.log("hi mousey!");
})
```

Sometimes you will see this shorthand:

```js
$("p").mouseover(function(event){
    console.log("hi mousey!");
})
```

* `.mouseover(...)` is the equivalent of `.on("mouseover", ...)`
* A function without a name is called an "anonymous function".

####Pop Quiz
In the last example:

1. What is the subject?
1. What are we waiting for?
1. What is the action?
1. When is the `handleHover` function actually executed?

### Events and Default Behavior

As a digital native, you take these behaviors for granted.

* When you "submit" a form, you want it to send your data somewhere.
* When you "click" on a link, you expect to navigate to a new page.

Try this on the <a href="https://generalassemb.ly/" target="_blank">GA homepage</a>:

```js
var $links = $("a"); // every link on the page
$links.on("click", function handleClick(event){
    alert("You just clicked a link. You are about to be redirected.");
};
```

Redirecting to a new page is the *default behavior* of anchor tags (`a` elements). How would we stop this behavior? What if we need to "prevent (the) default"?

We have two options: we can `return false` or we can use a special method called `.preventDefault()`.

**`.preventDefault()`** (preferred because it is explicit):

```js
$("a").on("click", function handleClick(event){
    event.preventDefault();
    // more code down here
};
```

**`return false`** (this works too!):

```js
$("a").on("click", function handleClick(event){
    // more code up here
    return false;
};
```

**Exercises**

Hijack the big red button on the <a href="https://generalassemb.ly/" target="_blank">GA homepage</a>!

When you click the button...

1. Prevent the default link behavior, and print "Clicked!" to the console.
2. Use `$(this)` to change the text of the link to say "1".
3. Display the number of times the link has been clicked. If I click it again it should say "2".

# Exercises

[Event Exercise](https://github.com/sf-wdi-24/events_lab)
