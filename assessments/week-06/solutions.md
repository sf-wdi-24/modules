# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> WDI 24 - Week 6 Assessment [SOLUTIONS]

1. Declare a variable called `favorite_food`, and set it equal to your favorite food. Concatenate your `favorite_food` variable with the string, "My favorite food is ".

  ```ruby
  favorite_food = "ice cream"
  "My favorite food is #{favorite_food}."
  ```

2. Write a regular expression that matches any number (**digit**) in the string "Here are 10 ways Lyon is better than Paris."

  ```ruby
  /\d/
  ```

3. Write a method called `fly` that takes a `speed` parameter and returns the speed multiplied by 2.

  ```ruby
  def fly(speed)
    speed * 2
  end
  ```

4. Create a class that represents a `Gemstone` with the instance variables `category` and `color`. Initialize these variables in the `Gemstone` class using parameters.

  ```ruby
  class Gemstone
    def initialize(category, color)
      @category = category
      @color = color
    end
  end
  ```

5. Create an instance of your `Gemstone` class created above with the `category` "Mineral Variety" and the `color` "red".

  ```ruby
  Gemstone.new("Mineral Variety", "red")
  ```

6. Define and briefly describe each letter in **MVC**.

  **M** - Model: represents data objects in your application

  **V** - View: presentation layer; pages user sees and interacts with on your site

  **C** - Controller: handles user requests and controls what happens in response; interaction between Model and View

7. Briefly describe the purpose of each of the following commands/files/directories in a Rails app:

  **Gemfile** - file that lists gems (similar to modules or libraries) included in your Rails app

  **bundle install (or bundle)** - command that installs all gems listed in your `Gemfile` into your Rails app

  **rails server (or rails s)** - command that starts Rails's built-in server on localhost:3000 (similar to running `nodemon`)

  **config/routes.rb** - file where you define all the routes for your Rails app

  **app/controllers/** - directory that holds all controllers for your Rails app

8. What is **ActiveRecord**, and how will we use it with Ruby on Rails?

  ActiveRecord is the ORM (Object Relational Mapping) that comes built into Rails. We'll use it to query our database in our Rails apps.
