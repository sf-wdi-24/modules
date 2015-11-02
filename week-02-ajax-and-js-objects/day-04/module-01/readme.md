# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60">  JavaScript Prototypes

| Objectives |
| :--- |
| Extend a JavaScript object with prototypes. |
| Find libraries which use prototypes. |
| Explain `this` and scope changes of it. |

## Why all these objects?

![Nesting](http://i.imgur.com/ef4TAV9.gif)

We've been working with JavaScript `Object`s more and this will increase. Why?

Programmers might be lazy but they're organized. Organization in programming allows easy communication of ideas and isolation of logic. We learned the importance of isolation in debugging earlier this week.

To quote <a href="https://remysharp.com/2015/10/14/the-art-of-debugging" target="_blank">Remy Sharp</a> on debugging.

* Replicate.
* Isolate.
* ELIMINATE!

Isolating a bug was difficult but if we create code which is modular (isolating logic) we may have less difficulty tracking down future problems. We may even avoid future problems ¯\_(ツ)_/¯. Maybe tests?

Using objects we're able to isolate and encapsulate logic. It isn't perfect and is a common topic in programming language design and architectural patterns. These conversations often end via Godwin's law due to the intense convictions many developers carry with them.

We don't need to entertain these conversations, instead we need to understand and use what exists to express our ideas.

## Object practice

Let's practice creating some JavaScript `Object`s using custom `constructor` functions.

Try these steps on your own first, then check the details to see if you did the same thing.

1. Create a constructor which accepts two parameters `name`, `age` and `fluffiness` for an `Object` called `Dog`.

<details>
  <summary>Create a constructor which accepts the parameters `name`, `age` and `fluffiness` for an `Object` called `Dog`.</summary>
  ```js
  function Dog(name, age, fluffiness) {
  }
  ```
</details>

## Great, more abstract OOP stuff, what is a prototype?

> Prototype-based programming is a style of object-oriented programming in which behaviour reuse (known as inheritance) is performed via a process of cloning existing objects that serve as prototypes. <a href="https://en.wikipedia.org/wiki/Prototype-based_programming" target="_blank">Prototype-based_programming</a>

JavaScript is a prototype-based programming language. Part of this design decision was actually <a href="https://www.computer.org/csdl/mags/co/2012/02/mco2012020007.pdf" target="_blank">brought about based on marketing</a> requirements.

> If I had done classes in JavaScript back in May 1995, I would have been told that it was too much like Java or that JavaScript was competing with Java … I was under marketing orders to make it look like Java but not make it too big for its britches … [it] needed to be a silly little brother language.

## Let's mess with some prototypes

We should have an understanding of decisions driving prototypes, but let's start using them.

In something which executes JavaScript, try typing in this.

```js
var Chaos = function Chaos(level) {
  this.level = level;
  this.havoc = function () {
    for(var i = 0; i < Math.random() * 10; i++) {
      console.log("CHAOS!");
    }
  }
}

var myChaos = new Chaos(2);
myChaos.havoc();
```

We've done this before, can you see anything wrong with it? Any idea what `new` is doing?

## `this`, `new` && `prototype`

When we make objects in JavaScript, they're also functions. What happens when we do this?

```js
console.log(this);
function Carpet() {
  this.magic = false;
  console.log(this);
}

Carpet();
new Carpet();
```

Guess what will be logged in the JavaScript console and share with at least one other person what you think before running it.

*Spoiler* `this` went from being the `window` or global state to being an object's internals. `this` changes around because of the `new` keyword and how `this` is `bound`. When we use the `new` keyword we follow a path similar to <a href="http://eddmann.com/posts/how-the-new-keyword-works-in-javascript/" target="_blank">this</a> and <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/new" target="_blank">this</a>.

* We create an object, a more formal way of doing `{}` and give it a default set of information.
  * `var obj = Object.create(Carpet.prototype);`
* We `apply` our new `obj` to the original `function` which changes `this` to point at `obj` instead of `window`.
  * `var ret = Carpet.apply(obj);`

Aha! Now we see the `prototype`, it is behind the scenes of `new`.

**Warning** side note on `.apply`. You'll often see `.apply` and `.call` in JavaScript. They are functions which change what `this` points to.

```js
function fly() {
  console.log(this);
  if (this.magic) {
    console.info("We're flying!");
  } else {
    console.warn("Falling.");
  }
}

fly(); // Falling.

var magicCarpet = {"magic": true};
fly.call(magicCarpet) // We're flying!
```

## Using prototypes to make a library

Although prototypes are designed as part of the OO nature of JavaScript, they aren't as often used in the same way. Recently, this is becoming a common trend with different JavaScript frameworks including their own Data Abstraction Layer.

So why are prototypes important?

Because we use JavaScript frameworks and libraries often. Libraries like jQuery, Bootstrap or countless others. Often the best way to quickly implement something for your site is via an existing open source library. Understanding how these libraries work allow us to extend and fix their functionality.

Let's make a small library together.

## Chaos Library v0.2.a-1

We're going to make a chaotic library to highlight using prototypes in extending the library.

```js
var Chaos = function Chaos(level) {
  this.level = level;
}

Chaos.prototype.havoc = function () {
  if (this.level > 2) {
    console.warn("We're causing havoc!");
  } else {
    console.info("No havoc, let's take a break.");
  }
}
```

Now I can try out my little library.

```js
var myChaos = new Chaos(1);
myChaos.havoc();
```

This is great but I actually want all levels of chaos to trigger havoc. In order to do this, I *only* need to change its prototype.

```js
Chaos.prototype.havoc = function () {
  console.warn("WE ALWAYS CAUSE HAVOC!");
}
```

What will happen when I run `myChaos.havoc()` without creating it again?

```js
myChaos.havoc()
```

It causes havoc now. This means that anytime I edit the prototype for a type of object it will change all the instances of that object immediately. It will also change the behaviour of new instances.

```js
var yourChaos = new Chaos(0);
yourChaos.havoc();
```

## Github explore JS libraries which use prototypes

* <a href="https://github.com/jquery/jquery/blob/15ac848868e993dfe5ccd7751a94f5c8edc288bc/src/core.js#L38" target="_blank">jQuery</a>
* <a href="https://github.com/twbs/bootstrap/search?utf8=%E2%9C%93&q=prototype" target="_blank">Bootstrap</a>
* Seriously, everything including <a href="https://github.com/mozilla/KitchenSink/search?utf8=%E2%9C%93&q=prototype" target="_blank">the kitchen sink</a>

## Challenges

### Create a library using prototypes.

In this challenge we will go through the process of creating a small library. Your library is named by you and must include five functions which are added to the library via its `prototype`. The contents of those functions are up to you but must be kept under 5 lines of code per function.

#### MVP

* 5 `function`s with less than 5 lines of code each.
* A name which is reflected in the filename and name of the object.
* Each `function` must be added via the object's prototype.

#### Bonus

* Use another student's library and extend its functionality using prototypes.
