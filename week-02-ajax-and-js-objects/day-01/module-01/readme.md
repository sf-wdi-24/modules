# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60">  Debugging JavaScript

| Objectives |
| :--- |
| Inspect a variable's state using Chrome's JavaScript Debugger. |
| Summarize why a debugger is useful while developing software. |
| Analyze a debugger's watch list to find an out of scope variable. |

**It's OK if you don't know what all the terms in the objective mean, you will by the end of this module.**

# What does bug and debugging mean?

<a href="http://i.imgur.com/6usagmh.gif" target="_blank"><img src="http://i.imgur.com/6usagmh.gif" alt="How I feel while programming."></a>

> The terms "bug" and "debugging" are popularly attributed to Admiral Grace Hopper in the 1940s. While she was working on a Mark II Computer at Harvard University, her associates discovered a moth stuck in a relay and thereby impeding operation, whereupon she remarked that they were "debugging" the system. <a href="https://en.wikipedia.org/wiki/Debugging" target="_blank">Debugging Wikipedia</a>

# What is a debugger?

> A debugger or debugging tool is a computer program that is used to test and debug other programs. <a href="https://en.wikipedia.org/wiki/Debugger" target="_blank">Debugger Wikipedia Entry</a>

It is software to help remove bugs from software. The software comes with many features which are designed to ease your ability to track down bugs and fix them.

# Why use a debugger?

> Debugging is twice as hard as writing the code in the first place. Therefore, if you write the code as cleverly as possible, you are, by definition, not smart enough to debug it. <a href="http://www.amazon.com/gp/product/0070342075" target="_blank">Brian W. Kernighan</a>

Have you written code which doesn't seem to work and it's all the computers fault? You've reached the limit of your patience because the stupid computer won't do what you said. Well, unfortunately it wasn't the computer's fault, <a href="http://blog.codinghorror.com/the-first-rule-of-programming-its-always-your-fault/" target="_blank">it's always your fault</a>.

Using a debugger will reduce the stress caused by your program not doing what you expect. It is a tool you will utilize when something strange is happening and you need to find out why.

## The "real" world.

![Move Fast and Break Things](https://imgs.xkcd.com/comics/move_fast_and_break_things.png)

Have you ever received a broken product? Maybe a refrigerator which keeps food nice and warm instead of cold? It sucks but does it seem a little better when the refrigerator maker fixes it quickly?

When you deliver software to your boss, a client or your customers they expect it to "work". This often isn't the case, something will be broken and there is an assumption that you will fix it quickly.

Sometimes your software doesn't make it to anyone. It is stuck in an unfinished state where you give up on it. One of the most common reasons I've seen to leave work unfinished was caused by a bug which couldn't be figured out.

## Debug my coffee.

Let's work together to figure out why my coffee tastes bad. I usually make a "perfect" cup of coffee.

My perfect cup of coffee includes these things:

* Super hot water.
* Super fresh coffee grounds.
* 2 creamers.
* 2 sugars.

http://jsfiddle.net/eerwitt/uxazkv8m/


# Launching Chrome's JavaScript Debugger

There are a few ways to launch the JavaScript debugger (and Chrome development tools). Each can be useful in different scenarios.

* Launch the debugger using `⌘ + ⌥ + j`.
    * Quick and easy, the default method.
* Launch the debugger by right clicking on an HTML element, then select "Inspect Element" and click the console tab.
    * Useful when you want to interact with the element using `$0`.
* Launch the debugger by using the keyword `debugger` in a JavaScript script.
    * Useful when you are working on a large script and need to set a breakpoint.

```js
debugger
```

# Set a break point in Chrome's JavaScript Debugger

Let's walk over the flow described in detail <a href="https://developer.chrome.com/devtools/docs/javascript-debugging#breakpoints" target="_blank">on the JavaScript debugging page</a>.

# Inspect a variable's state while execution is paused

Open today's <a href="https://github.com/sf-wdi-24/debugging-challenges" target="_blank">debugging challenge</a> and we'll inspect a variables state.

# Continue execution of the program

Let's walk over more of the tools mentioned <a href="https://developer.chrome.com/devtools/docs/javascript-debugging" target="_blank">on the JavaScript debugging page</a>.

# Challenges

* <a href="https://github.com/sf-wdi-24/debugging-challenges" target="_blank">Debugging Challenge</a>

## References

* <a href="https://developer.chrome.com/devtools/docs/javascript-debugging" target="_blank">Chrome Developer Tools</a>
* <a href="https://en.wikipedia.org/wiki/State_%28computer_science%29" target="_blank">Computer State Wiki</a>
* <a href="https://pragprog.com/magazines/2012-04/sand-piles-and-software" target="_blank">Sand Piles and Software</a>
* <a href="https://remysharp.com/2015/10/14/the-art-of-debugging" target="_blank">The Art of Debugging</a>
