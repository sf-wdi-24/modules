# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Intro Rails - Solutions

1. Create a new route: a `GET` request to `/about` that hits the controller#action `site#about`.

  ```ruby
  #
  # config/routes.rb
  #

  get "/about", to: "site#about"
  ```

2. Have `site#about` render a view in `app/views/site/about.html.erb`.

  ```ruby
  #
  # app/controllers/site_controller.rb
  #

  class SiteController < ApplicationController
    def about
    end
  end
  ```

  *Also create a view `app/views/site/about.html.erb`*. The `site#about` controller method automatically renders the `about.html.erb` view.

3. Set a variable equal to your favorite programming language in your `site#about` controller method, and have the controller pass that variable to the view.

  ```ruby
  #
  # app/controllers/site_controller.rb
  #

  class SiteController < ApplicationController
    def about
      @favorite_language = "Ruby"
    end
  end
  ```

4. Update the `app/views/site/about.html.erb` view template to show the variable you passed in. Your view should now display your favorite programming language!

  ```html
  <!-- app/views/site/about.html.erb -->

  <h1>About Me</h1>
  <h4>Favorite Programming Language: <%= @favorite_language =%></h4>
  ```

5. Create an array of your favorite programming libraries and/or frameworks in your `site#about` controller method. Pass them into your view and iterate through each of them inside a `<ul>` tag. Create an `<li>` tag for each favorite language/framework.

  ```ruby
  #
  # app/controllers/site_controller.rb
  #

  class SiteController < ApplicationController
    def about
      @favorite_language = "Ruby"
      @favorite_frameworks = ["Express", "Angular", "Rails"]
    end
  end
  ```

  ```html
  <!-- app/views/site/about.html.erb -->

  <h1>About Me</h1>
  <h4>Favorite Programming Language: <%= @favorite_language =%></h4>
  <h4>Favorite Frameworks:</h4>
  <ul>
    <% @favorite_frameworks.each do |framework| %>
      <li><%= framework %></li>
    <% end %>
  </ul>
  ```
