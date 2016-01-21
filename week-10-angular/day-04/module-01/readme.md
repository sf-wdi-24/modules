# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> MEAN Stack & Rails Angular

| Objectives |
| :--- |
| Discuss the use cases for MEAN Stack and Rails Angular |
| Connect your client-side Angular application to both an Express and Rails server |

The great thing about Angular is that it's back-end-agnostic. Since Angular was built with CRUD in mind, as long as your Angular app can query RESTful API endpoints, it doesn't matter the stack of the server. As you've already seen, you don't even need to have your own server to get your Angular app working.

If you're going to build your own server from scratch to connect to your Angular app, you have many options, but we'll look at the two back-end stacks we've learned in the course so far - Mongo/Express/Node (MEN) and Ruby on Rails with Postgres.

## MEAN Stack Setup

#### Base Application

1. Create a new Node/Express application:

  ```zsh
  ➜  mkdir mean_sample
  ➜  cd mean_sample
  ➜  touch server.js
  ➜  npm init
  ```

2. Install the following `node_modules`:

  ```zsh
  ➜  npm install --save express body-parser hbs mongoose
  ```

3. Set up your Express boilerplate:

  ```js
  /*
   * server.js
   */

  // require express and other modules
  var express = require('express'),
      app = express(),
      bodyParser = require('body-parser'),
      mongoose = require('mongoose');

  // configure bodyParser (for receiving form data)
  app.use(bodyParser.urlencoded({ extended: true }));

  // serve static files from public folder
  app.use(express.static(__dirname + '/public'));

  // set view engine to hbs (handlebars)
  app.set('view engine', 'hbs');

  // connect to mongodb
  mongoose.connect('mongodb://localhost/mean_sample');

  // listen on port 3000
  app.listen(3000, function() {
    console.log('server started');
  });
  ```

4. Set up your folder structure for your assets and views. It should look something like this:

  ```
  | mean_sample
    | node_modules
      ...
    | public
      | scripts
      | styles
    | views
      - index.hbs
  ```

  Make sure to create an `index.hbs` file inside the `views` folder. Your `index.hbs` will serve as the "layout" for your Angular app.

#### Server Routes

1. Since `index.hbs` is the "layout" for your Angular app, you want the server to respond with this view every time a route is requested. This will allow Angular to handle routing on the client-side.

  You can use `app.get('*')` to send every server-requested route to `index.hbs`:

  ```js
  /*
   * server.js
   */

  app.get('*', function (req, res) {
    res.render('index');
  });
  ```

#### Requiring Angular

1. Require the CDNs for Angular and `ngRoute` in `index.hbs`:

  ```html
  <!-- views/index.hbs -->

  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="/">

    <!-- angular -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.8/angular.min.js"></script>

    <!-- ngRoute -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.min.js"></script>

    <title>MEAN Sample</title>
  </head>
  <body></body>
  </html>
  ```

#### Configuring Your Angular App

1. Create a new JavaScript file `public/scripts/app.js`. This is where you'll put all the logic for your Angular app.

2. Make sure to require your newly created `app.js` in `index.hbs`:

  ```html
  <!-- views/index.hbs -->

  <head>
    ...

    <!-- angular -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.8/angular.min.js"></script>

    <!-- ngRoute -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.min.js"></script>

    <!-- custom script (angular app) -->
    <script type="text/javascript" src="scripts/app.js"></script>    
  </head>
  ```

3. Add the `ng-app` directive in the `<html>` tag in `index.hbs`:

  ```html
  <!-- views/index.hbs -->

  <!DOCTYPE html>
  <html lang="en" ng-app="sampleApp">
  <head>
    ...
  </head>
  <body></body>
  </html>
  ```

4. Add the `ng-view` directive inside the `<body>` tag in `views/index.hbs`:

  ```html
  <!-- views/index.hbs -->

  <body>
    <nav class="navbar navbar-default">
      ...
    </nav>
    <div ng-view></div>
  </body>
  ```

  **Note:** Since this file serves as the "layout" for your Angular app, it's a good idea to place any shared code here, like a navbar.

5. Configure your Angular app in `app.js`:

  ```js
  /*
   * public/scripts/app.js
   */

  var app = angular.module('sampleApp', ['ngRoute']);
  ```

#### Adding Templates

1. Make a `templates` directory inside `public`, and create a template:

  ```
  ➜  mkdir public/templates
  ➜  touch public/templates/home.html
  ```

#### Configuring Angular Routes

1. Configure your Angular routes in `app.js` to hook everything up:

  ```js
  /*
   * public/scripts/app.js
   */

  app.config(['$routeProvider', '$locationProvider',
    function ($routeProvider, $locationProvider) {
      $routeProvider
        .when('/', {
          templateUrl: 'home.html',
          controller: 'HomeCtrl'
        })
        .otherwise({
          redirectTo: '/'
        });

      $locationProvider.html5Mode({
        enabled: true,
        requireBase: false
      });
    }
  ]);
  ```

2. Configure your controller with some test data, so you can check to see if the route, template, and controller are properly connected:

  ```js
  /*
   * public/scripts/app.js
   */

  app.controller('HomeCtrl', ['$scope', function ($scope) {
    $scope.homeTest = "Welcome to the homepage!";
  }]);
  ```

#### Miscellaneous Setup

1. To allow `body-parser` to send and receive JSON data, add this line to `server.js`:

  ```js
  /*
   * server.js
   */

  ...

  // configure bodyParser (for receiving form data)
  app.use(bodyParser.urlencoded({ extended: true }));
  // ADD THIS LINE
  app.use(bodyParser.json());

  ...

  ```

#### CRUD

Now that your Angular app is all set up, it's time to CRUD a resource! You'll need:

1. CRUD routes for your resource:

  ```js
  /*
   * server.js
   */

  ...

  /*
   * API routes
   */

  app.get('/api/todos', function (req, res) {
    ...
  });

  app.post('/api/todos', function (req, res) {
    ...
  });

  app.get('/api/todos/:id', function (req, res) {
    ...
  });

  app.put('/api/todos/:id', function (req, res) {
    ...
  });

  app.delete('/api/todos/:id', function (req, res) {
    ...
  });

  /*
   * Load `views/index.hbs` file
   * when any route is requested from the server
   */

  app.get('*', function (req, res) {
    res.render('index');
  });

  ...

  ```

2. CRUD actions that render JSON:

  ```js
  /*
   * server.js
   */

  ...

  /*
   * API routes
   */

  app.get('/api/todos', function (req, res) {
    Todo.find(function (err, allTodos) {
      if (err) {
        res.status(500).json({ error: err.message });
      } else {
        res.json(allTodos);
      }
    });
  });

  app.post('/api/todos', function (req, res) {
    var newTodo = new Todo(req.body);
    newTodo.save(function (err, savedTodo) {
      if (err) {
        res.status(500).json({ error: err.message });
      } else {
        res.json(savedTodo);
      }
    });
  });

  ...

  ```

3. The Angular `$http` or `$resource` service to interact with your JSON API endpoints. See the module on <a href="https://github.com/sf-wdi-24/modules/tree/master/week-10-angular/day-03/module-02" target="_blank">http and ng-resource</a> for reference. Instead of calling an external API, you're now querying your own application's server.

## Rails Angular Setup

#### Base Application

1. Create a new Rails application with a Postgres database:

  ```zsh
  ➜  rails new rails_angular_sample -Td postgresql
  ➜  cd rails_angular_sample
  ➜  rake db:create
  ```

2. Remove `turbolinks` from your Rails app (`Gemfile`, `application.js`, and `application.html.erb`).

3. Create a `SiteController` with an `index` action. You'll also need to create `site/index.html.erb` inside `app/views`. Your `site#index` will serve as the "layout" for your Angular app.

#### Server Routes

1. Since `site#index` is the "layout" for your Angular app, you want the server to respond with this view every time a route is requested. This will allow Angular to handle routing on the client-side.

  You can use `get '*path'` to send every server-requested route to `site#index`:

  ```ruby
  #
  # config/routes.rb
  #

  Rails.application.routes.draw do
    root 'site#index'
    get '*path', to: 'site#index'
  end
  ```

#### Requiring Angular

1. As you've seen before, there are many ways to require assets in Rails. If you'd like, you can require the CDNs for Angular and `ngRoute` directly in the application layout:

  ```html
  <!-- app/views/layouts/application.html.erb -->

  <!DOCTYPE html>
  <html>
  <head>
    <%= csrf_meta_tags %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="/">

  	<%= stylesheet_link_tag :application, media: :all %>

    <!-- angular -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.8/angular.min.js"></script>

    <!-- ngRoute -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.min.js"></script>

    <%= javascript_include_tag :application %>

    <title>RailsAngularSample</title>
  </head>
  <body>
  	<%= yield %>
  </body>
  </html>
  ```

2. Another option is to download the files for Angular and `ngRoute` and include them in the asset pipeline.

  To download via CURL in the Terminal:

  ```zsh
  ➜  curl https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.8/angular.min.js > vendor/assets/javascripts/angular.min.js
  ➜  curl https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.min.js > vendor/assets/javascripts/angular-route.min.js
  ```

  And require in `application.js`:

  ```js
  /*
   * app/assets/javascripts/application.js
   */

  //= require angular.min
  //= require angular-route.min
  ```

#### Configuring Your Angular App

1. Create a new JavaScript file `app/assets/javascripts/app.js`. This is where you'll put all the logic for your Angular app.

2. Whether or not you're using the asset pipeline for Angular and `ngRoute`, make sure to require your newly created `app.js` in `application.js`:

  ```js
  /*
   * app/assets/javascripts/application.js
   */

  //= require angular.min
  //= require angular-route.min
  //= require app
  ```

3. Add the `ng-app` directive in the `<html>` tag in the application layout:

  ```html
  <!-- app/views/layouts/application.html.erb -->

  <!DOCTYPE html>
  <html ng-app="sampleApp">
  <head>
    <%= csrf_meta_tags %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="/">

  	<%= stylesheet_link_tag :application, media: :all %>
    <%= javascript_include_tag :application %>

    <title>RailsAngularSample</title>
  </head>
  <body>
  	<%= yield %>
  </body>
  </html>
  ```

4. Add the `ng-view` directive inside the `<body>` tag in `app/views/site/index.html.erb`:

  ```html
  <!-- app/views/site/index.html.erb -->

  <body>
    <nav class="navbar navbar-default">
      ...
    </nav>
    <div ng-view></div>
  </body>
  ```

  **Note:** Since this file serves as the "layout" for your Angular app, it's a good idea to place any shared code here, like a navbar.

5. Configure your Angular app in `app.js`:

  ```js
  /*
   * app/assets/javascripts/app.js
   */

  var app = angular.module('sampleApp', ['ngRoute']);
  ```

#### Adding Templates

1. You can use the <a href="https://github.com/pitr/angular-rails-templates" target="_blank">angular-rails-templates</a> gem to add your Angular templates to the Rails asset pipeline.

  Require the gem in your `Gemfile`:

  ```ruby
  #
  # Gemfile
  #

  gem 'angular-rails-templates', '~> 0.1.5'
  ```

  **Note:** Version `0.1.5` is necessary to avoid conflicts with the latest version of `sprockets`.

2. Require `angular-rails-templates` in `application.js`, as well as the path to your Angular templates (which you'll create in the next step):

  ```js
  /*
   * app/assets/javascripts/application.js
   */

  //= require angular.min
  //= require angular-route.min
  //= require angular-rails-templates
  //= require_tree ../templates
  //= require app
  ```

  **Note:** Make sure you require your templates AFTER your Angular files and BEFORE `app.js`.

3. Make a `templates` directory inside `app/assets`, and create a template:

  ```
  ➜  mkdir app/assets/templates
  ➜  touch app/assets/templates/home.html
  ```

  At this point, you should `bundle install` and restart your Rails server if you haven't already.

4. Add the `templates` module to your Angular app's dependencies in `app.js`:

  ```js
  /*
   * app/assets/javascripts/app.js
   */

  var app = angular.module('sampleApp', ['ngRoute', 'templates']);
  ```

#### Configuring Angular Routes

1. Configure your Angular routes in `app.js` to hook everything up:

  ```js
  /*
   * app/assets/javascripts/app.js
   */

  app.config(['$routeProvider', '$locationProvider',
  	function ($routeProvider, $locationProvider) {
  	  $routeProvider
  	    .when('/', {
  	      templateUrl: 'home.html',
  	      controller: 'HomeCtrl'
  	    })
  	    .otherwise({
  	      redirectTo: '/'
  	    });

  	  $locationProvider.html5Mode({
  	    enabled: true,
  	    requireBase: false
  	  });
  	}
  ]);
  ```

2. Configure your controller with some test data, so you can check to see if the route, template, and controller are properly connected:

  ```js
  /*
   * app/assets/javascripts/app.js
   */

  app.controller('HomeCtrl', ['$scope', function ($scope) {
    $scope.homeTest = "Welcome to the homepage!";
  }]);
  ```

#### Miscellaneous Setup

1. Since Rails has extra security around submitting forms, there's some setup involved in the `ApplicationController` to allow your Angular app to submit data to the server:

  ```ruby
  #
  # app/controllers/application_controller.rb
  #

  class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery
    after_filter :set_csrf_cookie_for_ng

    protected
      def verified_request?
        super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
      end

    private
      def set_csrf_cookie_for_ng
        cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
      end

  end
  ```

#### CRUD

Now that your Angular app is all set up, it's time to CRUD a resource! You'll need:

1. CRUD routes for your resource:

  ```ruby
  #
  # config/routes.rb
  #

  Rails.application.routes.draw do
    root 'site#index'

    namespace :api, defaults: { format: :json } do
      resources :todos, except: [:new, :edit]
    end

    get '*path', to: 'site#index'
  end
  ```

2. A controller with CRUD actions that renders JSON:

  ```ruby
  #
  # app/controllers/api/todos_controller.rb
  #

  class Api::TodosController < ApplicationController
    def index
      @todos = Todo.all.order("created_at DESC")
      render json: @todos
    end

    def create
      @todo = Todo.new(todo_params)
      if @todo.save
        render json: @todo
      else
        render json: { errors: @todo.errors.full_messages.join(", ") }, status: :unprocessable_entity
      end
    end

    ...

    private
      def todo_params
        params.require(:todo).permit(:title, :description, :done)
      end

  end
  ```

3. The Angular `$http` or `$resource` service to interact with your JSON API endpoints. See the module on <a href="https://github.com/sf-wdi-24/modules/tree/master/week-10-angular/day-03/module-02" target="_blank">http and ng-resource</a> for reference. Instead of calling an external API, you're now querying your own application's server.

## Challenges

1. Follow the steps above to set up a new MEAN Stack application. Pause once you get a single Angular route (`/`) successfully connected to its template and controller.

2. Follow the steps above to set up a new Rails Angular application. Pause once you get a single Angular route (`/`) successfully connected to its template and controller.

## Stretch Challenges

1. Once your two apps are set up, pick one app, and build a JSON API to CRUD one resource (`todos` are always a good start). Test your API routes on Postman.

2. Use Angular `$http` or `$resource` to query your API endpoints from the client side to implement full CRUD in your single-page app.

3. If you finish CRUD for one of your apps, do the same thing for the other - build a JSON API, then query it from the client.
