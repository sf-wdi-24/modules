# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Angular Routing

| Objectives |
| :--- |
| Discuss the differences between server-side and client-side routing  |
| Implement client-side routing in a single-page app using Angular's `ngRoute` module |

In a client-side framework like Angular, routing is not managed by the server, but by the client itself. Angular detects the path of your URL and maps that URL to a controller and template.

## Background

Angular first shipped with a simple routing module that let you connect one URL with one controller and one template. Very quickly developers in the Angular community wanted to go beyond this simple coupling and leverage Angular's ability to nest controllers, views, and scopes together to make more complex and modular client-side applications. The Angular community decided to extract the standard Angular routing module into its own separate module called `ngRoute`.

Angular's built-in `ngRoute` will most likely have all the routing features you need for your apps as you're first learning Angular. As your Angular apps become more robust, it's worth looking into the third-party `ui-router` module, which supports nested views, multiple named views, and "states".

<a href="http://stackoverflow.com/questions/21023763/angularjs-difference-between-angular-route-and-angular-ui-router" target="_blank">Difference between angular-route and angular-ui-router</a> [Stack Overflow]

Note that Angular is updating `ngRoute` to compete with some of the features of `ui-router`, but it won't be released until Angular v. 1.5. See this <a href="https://medium.com/angularjs-meetup-south-london/angular-just-another-introduction-to-ngnewrouter-vs-ui-router-72bfcb228017#.uvb7zouk7" target="_blank">Introduction to ngNewRouter vs ui-router</a> [Medium].

#### ngRoute

```js
// app.js

var app = angular.module('sampleApp', ['ngRoute']);

app.config(['$routeProvider', function ($routeProvider) {
  $routeProvider
    .when('/books', {
      templateUrl: 'templates/books/index.html',
      controller: 'BooksIndexCtrl'
    })
    .when('/books/:bookId', {
      templateUrl: 'templates/books/show.html',
      controller: 'BooksShowCtrl'
    })
    .otherwise({
      redirectTo: '/books'
    });
}]);
```

#### ui-router

```js
// app.js

var app = angular.module('sampleApp', ['ui.router']);

app.config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise('/books');

  $stateProvider
    .state('booksIndex', {
      url: '/books',
      templateUrl: 'templates/books/index.html',
      controller: 'BooksIndexCtrl'
    })
    .state('booksShow', {
      url: '/books/:bookId',
      // alternate syntax
      // url: '/books/{bookId}',
      templateUrl: 'templates/books/show.html',
      controller: 'BooksShowCtrl'
    });
}]);
```

## ngRoute Setup

#### Add ngRoute to your Angular app

1. Include the CDN for `ngRoute` in your `index.html`, after the Angular CDN:

  ```html
  <!-- index.html -->

  <!DOCTYPE html>
  <html ng-app="sampleApp">
  <head>
    <base href="/">

    <!-- angular -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.8/angular.min.js"></script>

    <!-- angular route -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular-route.min.js"></script>

    <!-- custom script (angular app) -->
    <script type="text/javascript" src="app.js"></script>

  </head>
  <body>
    ...
  </body>
  </html>
  ```

2. Include the `ngRoute` module in your Angular app's list of dependencies:

  ```js
  // app.js

  var app = angular.module('sampleApp', ['ngRoute']);
  ```

#### Create templates for your app's "views"

As your app grows, your single `index.html` file is going to get very big and messy. To combat this, you're going to turn your `index.html` file into a "layout template." Similar to the application layout in your Rails apps, this file will be the shared layout for all views in your application. Depending on the current route, the Angular router (`ngRoute`) will include the correct template, or view, in the layout to be displayed to the user.

1. Create a folder in the top level of your application called `templates`.

  ```zsh
  ➜  mkdir templates
  ```

2. Create some templates for the different "views" in your application. We'll start with templates for the homepage and the about page. Make sure to create your templates inside the `templates` folder.

  ```zsh
  ➜  touch templates/home.html
  ➜  touch templates/about.html
  ```

3. In `index.html`, add the `ng-view` directive inside the `<body>` tag (`ng-view` acts just like the `<%= yield %>` block in the Rails application layout).

  ```html
  <!-- index.html -->

  <body>
    <div ng-view></div>
  </body>
  ```

#### Configure your routes

1. Right after you define your Angular app, use the `.config` method to set up your routes. Your routes are configured by injecting `$routeProvider` into `config`'s dependencies and using the `$routeProvider.when()` method to define your routes.

  ```js
  // app.js

  var app = angular.module('sampleApp', ['ngRoute']);

  app.config(['$routeProvider', function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'templates/home.html',
        controller: 'HomeCtrl'
      })
      .when('/about', {
        templateUrl: 'templates/about.html',
        controller: 'AboutCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  }]);
  ```

#### Set up your controllers

Each route that you just set up points to its own controller, which contains it's own scope. Following the homepage and about page example above, you'll need two controllers, `HomeCtrl` and `AboutCtrl`.

1. After configuring your routes, define your controllers in `app.js`:

  ```js
  // app.js

  var app = angular.module('sampleApp', ['ngRoute']);

  app.config(['$routeProvider', function ($routeProvider) {
    ...
  }]);

  app.controller('HomeCtrl', ['$scope', function ($scope) {
    ...
  }]);

  app.controller('AboutCtrl', ['$scope', function ($scope) {
    ...
  }]);
  ```

If you're having trouble getting your routes to work, the first thing to check is the spelling and file path of the `templateUrl` and the spelling of your controller (also double check that you properly defined the controller).


#### Accessing URL params

In some cases, you'll want to use `ngRoute` to access URL parameters in a controller, just like you're used to doing on the server-side. Say we have an application that keeps track of books for the local library. The route `/books/:bookId` should `show` one particular book based on the `bookId`.

```js
var app = angular.module('sampleApp', ['ngRoute']);

app.config(['$routeProvider', function ($routeProvider) {
  $routeProvider
    .when('/books/:bookId', {
      templateUrl: 'templates/books/show.html',
      controller: 'BooksShowCtrl'
    });
}]);

app.controller('BooksShowCtrl', ['$scope', '$routeParams', function ($scope, $routeParams) {
  var bookId = $routeParams.bookId;
  // use `bookId` to find specific book
}]);
```

## Challenges

Work on the <a href="https://github.com/sf-wdi-24/angular-routing-lab" target="_blank">Angular Routing Lab</a>

## Resources

* <a href="https://docs.angularjs.org/api/ngRoute" target="_blank">Angular API Reference - ngRoute</a>
* <a href="https://github.com/angular-ui/ui-router" target="_blank">Angular UI-Router</a>
* <a href="http://stackoverflow.com/questions/21023763/angularjs-difference-between-angular-route-and-angular-ui-router" target="_blank">Difference between angular-route and angular-ui-router</a> [Stack Overflow]
* <a href="https://medium.com/angularjs-meetup-south-london/angular-just-another-introduction-to-ngnewrouter-vs-ui-router-72bfcb228017#.uvb7zouk7" target="_blank">Introduction to ngNewRouter vs ui-router</a> [Medium]
