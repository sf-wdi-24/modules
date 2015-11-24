# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Intro Rails

| Objectives |
| :--- |
| Articulate the Rails philosophy and the MVC pattern. |
| Start a Rails project with no database, and create routes that render dynamic templates. |
| Distinguish between Express and Rails. |

## Rails Philosophy

**Rails values:**

* DRYness
* Separation of concerns and modularity
* Abstraction and encapsulation
* Convention over configuration

## Separation of Concerns

In writing a large application, it's important to establish something known as **separation of concerns**, *writing modular code that focuses on one aspect within the application.* The benefit of this is similar to the idea of **compartmentalization** with respect to a production line, which allows for *more rapid development* by being able to **divide and conquer** the construction of a product.

## MVC

Rails uses an **MVC** architecture.

**M** odel - The model refers to the data objects in our application. It's the object-oriented approach to design. The data in our database will be the most common type of object our models will represent.

**V** iew - The view is the presentation layer. It's what the user sees and interacts with, essentially the web pages. The HTML, the CSS, and the JavaScript. The controller processes and responds to user events, such as clicking on links and submitting forms.

**C** ontroller - The controller makes decisions based on user requests, and then it controls what happens in the response. It controls the interaction between our models and our views.

![mvc](https://cloud.githubusercontent.com/assets/7833470/11377666/dfa363ae-929b-11e5-9b39-c93ff5347a99.png)

## Railstaurant Metaphor

* **Client:** a customer eating in the restaurant
* **Rails:** the kitchen
* **Request:** the customer's order
* **Router:** the waiter
* **Controller:** the chef
* **Model:** a recipe
* **Database:** the giant, walk-in refrigerator with ingredients
* **View:** plating the dish to look pretty
* **Response:** the waiter serving the dish to the customer

## Rails App Setup

#### Rails New

Run `rails new your_app_name` from your Terminal to create a new Rails project.

#### Gems

Gems are like Node packages (modules). You can put any gem you'd like to use in your project in your `Gemfile`. Run `bundle install` from your Terminal anytime you change your `Gemfile` to install the added gems into your app. You need to restart your Rails server after installing new gems.

#### Bundler

Bundler is a separate gem from Rails and can be used outside of Rails, but Rails depends on it to manage the RubyGems that your application needs. There are two files that matter to bundler: `Gemfile` and `Gemfile.lock`. `Gemfile` contains configuration information about what gems are part of our project; it is similar to the `package.json` file in Node.

Bundler looks at the `Gemfile`, loading all the included gems in addition to each gem's dependencies. It then generates a manifest file that is stored in `Gemfile.lock`. **Never** edit `Gemfile.lock`!

So how do you tell Bundler to take your `Gemfile` and generate `Gemfile.lock`? Run `bundle install` in your Terminal. When you create a new Rails app, it will automatically `bundle install` in the Terminal unless you specify otherwise.

## Running Rails Server

1. Create a new rails app from the Terminal with `rails new intro_rails --skip-activerecord`. (The last flag tells the application not use Active Record, which is Rails's built-in ORM. We'll learn more about it this afternoon.)
2. Change directories into your `intro_rails` app.
3. Run `rails server` or just `rails s` from the Terminal, and see what happens.
4. This will start a server on `localhost:3000`. Go there in the browser, and see what it says...

## Rails File Structure

![whol4dq](https://cloud.githubusercontent.com/assets/7833470/11381832/3f659a16-92b3-11e5-829d-be029b3566c9.png)

## Routing

* Write logic to define routes in `routes.rb`.
* Let's say when a user sends a `GET` request to the root route, `/`, we want the `site` controller's `index` method to run. In order to do that we could write:

  ```ruby
  #
  # config/routes.rb
  #

  get "/", to: "site#index"
  ```

Save the file, and navigate to your root route in the browser, `localhost:3000`. What error do you get?

**Tip:** run `rake routes` in the Terminal from the root directory of your Rails app to see a list of all your app's routes.

## Controllers

If you did the last step correctly, you should see an error message: "Uninitialized constant SiteController". This means we need to create a controller with the name `site`, since that's where we told our route to go in the first place!

From the Terminal, run `rails generate controller site`.

Reload `localhost:3000` again, and find a different error message: "The action 'index' could not be found for SiteController". We created the site controller correctly, but there is no `index` method defined. Let's make one:

```ruby
#
# app/controllers/site_controller.rb
#

class SiteController < ApplicationController
  def index
  end
end
```

Wow, another error! "Missing template site/index...". Since we have a `site` controller and an `index` method, Rails automatically tries to render a view with the path `app/views/site/index.html.erb`. A directory called `app/views/site` should already exist; it was generated when the site controller was generated (thanks Rails!). Inside of that directory, create the file `index.html.erb`. Inside `index.html.erb`, add some HTML:

```html
<!-- app/views/site/index.html.erb -->

<h1>I make internets with Rails</h1>
<img src="http://i.giphy.com/SPZFhfUJjsJO0.gif" alt="learning internet" style="width: 300px">
```

Check out out `localhost:3000` in the browser one more time.

## Rendering Views

This will not change the behavior we just set up, but you may wish to be more explicit in our controller by stating to `render` the template `index`:

```ruby
#
# app/controllers/site_controller.rb
#

def index
  render :index
end
```

## ERB

`.html.erb` files are templates that are processed with embedded Ruby, `.erb`, to generate an `.html` file. This is known as **server-side templating**. ERB enables Rails to serve dynamic views based on the data in our app.

Let's say we want to pass a random number to our view from 0-100. Try adding this to your HTML:

```html
<!-- app/views/site/index.html.erb -->

<h1>I make internets with Rails</h1>
<p>Random number is: <%= Random.new.rand(100) %></p>
<img src="http://i.giphy.com/SPZFhfUJjsJO0.gif" alt="learning internet" style="width: 300px">
```

Woah, what is happening?! Ruby code is evaluated, and the result is printed into our HTML. The `<%` symbols escape our HTML. Templating with `<%` will *evaluate* the code, while `<%=` will *interpolate* the result.

## Passing Data to the View

There's certainly some business logic happening in our `index` view. This is bad. Our view should only be concerned with presenting the data, not actually generating it. We currently have a violation of **separation of concerns**. To fix this, let's move the `Random.new.rand(100)` code to the controller and save it to a variable. Then, we will pass the variable to the view.

```ruby
#
# app/controllers/site_controller.rb
#

class SiteController < ApplicationController
  def index
    @random = Random.new.rand(100)
    render :index
  end
end
```

Notice we did not create a variable named `random`. Instead we created an instance variable named `@random`. The **@** is VERY important. Normal variables do not have a scope that reaches the view; only **instance variables have a scope that reaches the view**.

Finally, we can refactor the `app/views/site/index.html.erb` file so that it uses this new variable:

```html
<!-- app/views/site/index.html.erb -->

<h1>I make internets with Rails</h1>
<p>Random number is: <%= @random %></p>
<img src="http://i.giphy.com/SPZFhfUJjsJO0.gif" alt="learning internet" style="width: 300px">
```

## Challenges

1. Create a new route: a `GET` request to `/about` that hits the controller#action `site#about`.
2. Have `site#about` render a view in `app/views/site/about.html.erb`.
3. Set a variable equal to your favorite programming language in your `site#about` controller method, and have the controller pass that variable to the view.
4. Update the `app/views/site/about.html.erb` view template to show the variable you passed in. Your view should now display your favorite programming language!
5. Create an array of your favorite programming libraries and/or frameworks in your `site#about` controller method. Pass them into your view and iterate through each of them inside a `<ul>` tag. Create an `<li>` tag for each favorite language/framework.
