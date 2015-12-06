# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Ruby Data Types & Variables

### Objectives

*After this reading, students will be able to:*

- Identify and describe use cases for Ruby's data types
- Describe the different types of variables (locals, instance, constants) in Ruby & when to use them
- Run a Ruby file in the command line

## Intro

Now that we've gotten your feet wet with HTML, CSS, and JavaScript, you've got a taste of what it's like to start building for the web – and we're about to kick it up a notch.

Originally, the web was meant just as a place for documents – HTML pages that linked to each other, that was it.

But as developers started creating more and more pages, and desiring more and more interactivity with those pages, we got to a point historically where we started writing programs that created HTML for us. That was where the concept of web development frameworks came from, and undoubtedly one of the most prolific has been Ruby on Rails – one of the first frameworks to use the language of Ruby to build web applications.

We're not going to jump right into Rails immediately, we're going to build up to it over the course of the next week, and make sure you have an understanding of the concepts that go into building it first.

But even before _that_, let's get our hands dirty with some straight **Ruby**. It's super readable and easy to get started with. You're gonna like it a lot.

### "Matz is Nice And So We Are Nice"

Ruby was created by Yukihiro Matsumoto a.k.a. "Matz" in the mid-1990s. It is an object-oriented scripting language built on-top of C which Matz created to help programmers enjoy coding!

> <cite>"I hope to see Ruby help every programmer in the world to be productive, and to enjoy programming, and to be happy. That is the primary purpose of Ruby language."</cite>

## The Beauty of Ruby

There are a few general points to know about Ruby, and then we're going to be comparing the details of writing Ruby to what you already know in JavaScript.

We'll go over a bunch of basics you need to know in the next two days.

One of the things that's important to people who write code in Ruby is how the code _reads_. Rubyists are known for wanting beautiful code, and writing it in a way that reads as much like normal English as possible. That's part of what makes it great for beginners -  it's instantly readable.

Check out this example:

```ruby
def make_a_sentence(words)
  words.join(' ') + "!"
end

make_a_sentence(['You', 'are', 'already', 'experts'])
# => "You are already experts!"
```

Without knowing anything about Ruby you can probably sort of understand how all this works. Nice, right?

> **Awesome Detail:** You might notice something interesting – where are the semicolons? You don't need them!

> Ruby is a lot more forgiving than JavaScript to newbies when it comes to details like that. In the end you'll find you have an appreciation for both, but for now let's relish forgetting the ';'

## Data Types

**Question:** What data types have you guys been using in JavaScript? Let's write them on the board.

- **Booleans** are written as `true` and `false`
- **Numbers** are written as `12` or `9.45`
- **Strings** are written as `"awesome"`
- **Arrays** are written as `['x','y','z']`
- **Objects** are written as `{key: 'value', thing: true, stuff: [1,2,3]}`

Now, let's see which of those are similar in Ruby, and which are different.

- `true` or `false` are still booleans _(technically **TrueClass** / **FalseClass**)_
- `nil`, the equivalent of _nothing_ _(technically **NilClass**)_
- there's no Undefined object. _If something is undefined it'll just say so._
- `16.2` is a **Float** and`1` is an **Integer** _(technically a FixNum, but you can consider it the same thing)_
- `"hello world"` is still a **String**
- `[1,2,3,4]` is still an **Array**
- `{keys: ['some', 'values'] }` is called a **Hash**, but works the same

Most importantly, **in Ruby, _everything_ is an object**. We'll talk about that in more detail later, but that means that each of the above data types have methods & properties just like our JS objects did.

#### Let's recap our data types in Ruby:

- **Booleans** are written as `true` and `false`
- **Integers** are written as `12`
- **Floats** are written as `9.45`
- **Strings** are written as `"awesome"`
- **Arrays** are written as `['x','y','z']`
- **Hashes** are written as `{key: 'value', thing: true, stuff: [1,2,3]}`

#### Duck-typing

Unlike JavaScript, Ruby has both and Integer and a Float class. This creates some interesting results! Let's take a look in IRB:

What happens if we do:

```ruby
5 / 2
=> 2
```

Have we broken Ruby? No, we have given ruby two Integers (numbers with no decimal places) so ruby gives us an Integer back.

However, if we divide an Integer by a Float:

```ruby
5 / 2.0
=> 2.5
```

This is called "Type Coercion" also known as "Duck Typing"; Ruby now knows that we want a Float back.

If an object quacks like a duck (or acts like a string), just go ahead and treat it as a duck (or a string).

#### Converting between data-types

If we want to convert one data type to another in Ruby, there are some built-in methods that we can use. We'll take a look at built-in methods in more detail in a later lesson, however for the minute let's use them and see the result:

```ruby
# Converting an Integer to a String
1.to_s
=> "1"

# Converting a String to an Integer
"10".to_i
=> 10
```

These type-conversion methods usually start with `.to_`.

#### Oh look, comments.

It's worth noting that will comments in JS look like this:

```js
// I'm a comment
```

Ruby's are like this:

```ruby
# No, I'm a comment
```

Since you guys will be making a habit of commenting your code (so that other developers can read it and understand why you wrote it how you did), that'll be useful.

#### Fun Tip: Our strings have a superpower!

One super awesome trick that you will undoubtedly use all the time comes from our friend, the **String** object.

It's called **string interpolation** – and it lets us build complicated strings without having to add them together the old fashioned way.

We used to have to do this:

```ruby
first = "Ben"
last = "Franklin"
first + " " + last # => Ben Franklin
```

That works, but this is way cooler:

```ruby
first = "Ben"
last = "Franklin"
"#{first} #{last}" # => Ben Franklin
```

So so useful. It works with anything – any code can run in those brackets, and it'll evaluate and turn into a string. Right??

## Variables

Just like JavaScript (and literally every programming language), **we're gonna need some variables to hold stuff.**

_Unlike_ JavaScript, Ruby's variables don't need to be declared.

Where you're now used to:

```js
var genius = "me";
```

We can skip right to the good stuff:

```ruby
genius = "me"
```

Important to know how to use 'em. But that's only one type of variable, and there are a few.

### Types of Variables

Variables, of course, are just placeholders.

Let's talk about the different types of variables you'll encounter in Ruby. You'll need to use all of them at some point, but some more than others.

In these examples, we'll defined a variable, and then we'll write a tiny quick method that just spits that variable out, to see if it works.

#### Local Variable

A local variable (lower_snake_case) is a quick placeholder, and gets forgotten as soon as your method or function is over.

```ruby
some_variable = "donuts"

def some_method
  some_variable
end

some_variable # => "donuts"
              # because we're using it in the same place we defined it

some_method   # Run our method, when it was defined outside that method –
              # NameError: undefined local variable [blah blah blah]
```

These are great when you just need to temporarily store something or quickly give something a readable variable name, but won't need it later.

#### Instance Variable

An instance variable (lower_snake_case) is a variable that is defined in an instance of an object. That's not meant to be a fancy term - an instance is just an example of an object, one thingy in the great world of things.

```ruby
@some_variable = "donuts" # "donuts"

def some_method
  @some_variable
end

@some_variable # => "donuts"
some_method # => "donuts"
```

Remember that it works this way, because when we get to Objects & Methods later this week, you'll see that instance variables let us store a variable once and use it however many methods we need inside an object.

#### Constant

Mostly, we're able to change what a variable's holding if we so choose – constants are designed for the opposite. Constants are meant to be placeholders that _never change_.

```ruby
SOME_CONSTANT = "donuts" # "donuts"

def some_method
  SOME_CONSTANT
end

SOME_CONSTANT # => "donuts"
some_method # => "donuts"

SOME_CONSTANT = "awesome" # warning: already initialized constant
```

We can use a constant anywhere in a Ruby application – inside a method, outside a method, across objects & a whole app. But keep in mind, it's meant to be defined _only once_, so we'll use it for things like storing application settings, or other stuff we don't intend to change.

## Ruby & ruby

Until now, we have been running and debugging our HTML, CSS and JavaScript files using the browser. However, when using Ruby, we run our code using the command-line Ruby interpreter called ruby (with a lowercase 'r'). But don't worry, the process of writing our code and checking for errors is exactly the same!

So, let's create our first Ruby file and run it with ruby. First, let's create a new `.rb` file and open it with Sublime:

```bash
touch my_first_ruby_file.rb
subl .
```

Now, inside this file let's add:

```ruby
puts "Hello, I am running Ruby with ruby!"
```

**Pro Tip:** Despite being slightly different, at this point you can think of `puts` as similar to `console.log`.

Finally, run the file using:

```bash
ruby my_first_ruby_file.rb
```

## Conclusion

We'll get to see a lot more of Ruby over the next couple days, and the next couple weeks. Here are some questions to ponder:

- What data types does Ruby have, and what are some differences from JavaScript's types?
- What 3 types of variables did we talk about? What do you use each one for?
- What do you like more about Ruby so far? What do you like more about JS?
