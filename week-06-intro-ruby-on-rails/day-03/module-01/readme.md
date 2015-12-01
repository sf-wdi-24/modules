# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Ruby OOP

| Objectives |
| :-- |
| Distinguish between objects and classes in Ruby. |
| Define attributes and instance methods. |
| Explain the difference between instance and class variables. |

<img src="https://cloud.githubusercontent.com/assets/1329385/11281896/8aedc310-8eb1-11e5-8eff-a6a3a339e747.gif">

> Even an Object is an Object.

## Hashes

Let's create a new Hash

* Hashes are simple key/value stores.

<details>
  <summary>How can I organize my data using key/value pairs in Ruby?</summary>

  ```ruby
  # hash rocket notation
  # accessed like hash["key"] #=> value
  hash = {"name"=>"Napoleon", "fav_food"=>"steak", "skills"=>["archery", "combat", "egg farming"]}
  hash["name"] #=> "Napoleon"
  hash['skills'].first #=> "archery"
  test =  { 0 => "Zero", 1 => "One", 2 => "Two" }
  test[0] #=> "Zero"

  website = { 'url' => 'http://myblog.wordpress.com', 'author' => 'Melissa ', 'likes' => 3000 }
  website['url'] #=> 'http://myblog.wordpress.com'
  website['likes'] #=> 3000

  # symbol notation, use this more often
  # accessed like hash[:key] #=> value
  agent = {name: "James Bond", fav_food: "Vodka Martini",
  skills: ["hand to hand combat", "marksmanship", "espionage"]}

  agent[:name] #=> "James Bond"
  agent[:skills] #=> ["hand to hand combat", "marksmanship", "espionage"]
  ```
</details>

## Objects

Everything in Ruby is an Object; however, we almost never use plain vanilla Objects because there are more sophisticated implementations of them such a `String`, `Array`, `Integer` and `Hash`.

Different objects provide different types of functionality for storing data and performing behaviors. However, for more complex applications, classes (a certain kind of object) are used to model real-world interactions.

<details>
  <summary>How can we prove that the Hash we just created inherited from `Basic Object`?</summary>

  Use the `#is_a?` method to compare the hash with an object.
</details>

### Class Inheritance Tree

![Class inheritance](http://i.stack.imgur.com/rvcEi.png)

## Classes

<details>
  <summary>How do we create a class named Car that goes "Putt-Putt" when it's initialized?</summary>

  ```ruby
  class Car
    def initialize
      p "Putt-Putt"
    end
  end
  ```
</details>

## Attributes

```ruby
fiat = Car.new
fiat.color = "hot pink"
fiat.color
=> "hot pink"
```

<details>
  <summary>What should we do if we want to set attributes on the car, such as a paint color and year?</summary>

  ```ruby
  class Car
    attr_accessor :color
  end
  ```
</details>

## Methods

Do you remember the difference between methods and functions in JavaScript?

Methods ending in `?` are conventionally used to denote that they return a boolean value. <a href="https://github.com/bbatsov/ruby-style-guide#naming" target="_blank">Ruby Style Guide</a>.

<details>
  <summary>How would we create an instance method `color?` for our `Car` class instances, which tests whether the color matches what is passed in?</summary>

  ```ruby
  class Car
    attr_accessor :color

    def color?(other_color)
      return color == other_color
    end
  end
  ```
</details>

```ruby
# Example call.
alpha = Car.new
alpha.color = "orange"
alpha.color?("blue")
=> false
alpha.color?("orange")
=> true
```

## Initialization and Instance Variables

<details>
  <summary>What if I want to set the color of the car at the moment I'm creating it? How could I enable code like this?

  ```ruby
  lambo = Car.new("red")
  lambo.color
  => "red"
  ```
  </summary>

  ```ruby
  class Car
    attr_reader :color

    def initialize(color)
      @color = color
    end
  end
  ```
</details>

## Class Variables

<details>
  <summary>What if I wanted a running counter for all the cars I've ever created? Enable the code: `Car.total` which outputs the total number of all cars ever created.</summary>

  ```ruby
  class Car
    @@total = 0

    def initialize
      @@total += 1
    end

    def self.total
      @@total
    end
  end
  ```
</details>

## Quick Review

Think, pair, share...

  * What is a class?
    - What is an attribute?
    - What is a method?
  * What is the difference between:
    - an instance variable.
    - a class variable.
  * Why do we use classes?
  * What is inheritance?

## Inheritance

Given an `Vehicle` class that contains the method `accelerate` and attribute `speed`.

```ruby
class Vehicle
  attr_accessor :speed
  def initialize
    @speed = 0
  end

  def accelerate(speed)
    @speed += speed
  end
end
```

<details>
  <summary>How can I create a `Car` class while being DRY and not duplicating the method `accelerate`? Let's inherit from the `Vehicle` class above and make the car hella fast.</summary>

  ```ruby
  class Car < Vehicle
    def initialize
      @speed = 2
    end

    def accelerate(speed)
      @speed *= speed
    end
  end
  ```
</details>

## Exercise: Characters and Superheroes

Previously you worked with using inheritance to create some `Animal` and `People` classes. This exercise will review those concepts, using the `Character` and `Superhero` classes.

Superheroes are still Characters after all. In this exercise, you'll define:

  1. A `Character` class, with the following:
    * Attributes (instance variables defined in initialize method):
      * `name`: A string that holds the character's name
    * Instance Methods:
      * `location`: Takes a parameter `origin` prints out a message telling the character's `name` and where they are from (their `origin`)
      * `exercise` and `rest`: These two methods should NOT be passed any arguments. Instead, they will set an instance variable `@state` to the string `"ready"` or `"tired"` respectively.
    - *Note:* What type of `attr` method will be needed to `read` the name and state variables?

  2. A `Superhero` class, with the following characteristics:
    * Inherits from `Character`
    * Adds 2 new instance variables (which initialize takes as arguments):
      * `charisma`
      * `secret_identity`
    * Initializes using `super`, passing `name` as an argument
    - Adds 2 new methods:
      - `persuade`, which
        - takes another instance of the `Superhero` class as an argument
        - compares charisma of the character using the method to the character passed to the method as an argument
        - prints a message stating whether the character calling the method was able to persuade the other character or not
      - `study_rhetoric`, which increments `charisma` and optionally prints a message about the character's new charisma level
    - Superheroes must keep their identities secret! Make sure your `Superhero` class *overrides* the existing `greet` method (in `Character`) so that a `Superhero` doesn't reveal their true `"name"`

**BONUS:**

* Sometimes superheroes must reveal who they are to the public. Add an instance method called `reveal` that prints out a superhero's name and the secret identity they used in the following format: "I am Green Arrow. But you know me better as Oliver Queen." (Hint: look up how to interpolate strings in Ruby)
* Add a `class variable` called `count` that keeps track of all the superheroes you create.
