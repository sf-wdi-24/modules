# Debugging JavaScript

| Objectives |
| :--- |
| Inspect a variable's state using Chrome's JavaScript Debugger. |
| Summarize why a debugger is useful while developing software. |
| Analyze a debugger's watch list to find an out of scope variable. |

**It's OK if you don't know what all the terms in the objective mean, you will by the end of this module.**

# What is a debugger?

> A debugger or debugging tool is a computer program that is used to test and debug other programs. [Debugger Wikipedia Entry](https://en.wikipedia.org/wiki/Debugger)

It is software to help remove bugs from software.

But. What is a *bug*?

> The terms "bug" and "debugging" are popularly attributed to Admiral Grace Hopper in the 1940s.[1] While she was working on a Mark II Computer at Harvard University, her associates discovered a moth stuck in a relay and thereby impeding operation, whereupon she remarked that they were "debugging" the system. [Debugging Wikipedia](https://en.wikipedia.org/wiki/Debugging)

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

* Launch from inspecting element
* Launch from keyword

# Set a break point in Chrome's JavaScript Debugger

* Debugging with console logging.
* What is a break point.
* Why set a break point.
* Ask people to try setting a breakpoint.
* Use the `debugger` keyword to set a breakpoint.

# Inspect a variable's state while execution is paused

* Look at a variables value
* Inspect an object
* Update an object

# Continue execution of the program

* When to continue

# Stepping in and over code

* Investigate deeper
* Ignore misleading statements

# Using the watch list in Chrome's JavaScript Debugger

* Create for loop
* Show outer scope, and inner scope

# Conclusion

* Challenge to try using the debugger.
* Compare difficulty of debugging something more complex.
* Practice with this tool will help in the projects you create and your ability to do them quicker.
* Next time your program does something unexpected, try using the debugger.

## References

* <a href="https://en.wikipedia.org/wiki/State_%28computer_science%29" target="_blank">Computer State Wiki</a>
* <a href="https://pragprog.com/magazines/2012-04/sand-piles-and-software" target="_blank">Sand Piles and Software</a>
