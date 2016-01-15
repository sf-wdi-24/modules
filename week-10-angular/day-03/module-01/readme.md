# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Angular Routing

In a client-side framework like Angular, routing is managed not by the server, but by the client itself. Angular detects the path of your URL and conventionally maps that URL to a controller and template.

## Background

Angular first shipped with a simple routing module that let you connect one URL with one controller and one template. Very quickly developers in the Angular community wanted to go beyond this simple coupling and leverage Angular's ability to nest controllers, views, and scopes together to make more complex and modular client-side applications. The Angular community decided to extract the standard Angular routing module into its own separate module called `ngRoute`.

Angular's built-in `ngRoute` will most likely have all the routing features you need for your apps as you're first learning Angular. As your Angular apps become more robust, it's worth looking into the third-party `ui-router` module, which supports nested views, multiple named views, and "states".

<a href="http://stackoverflow.com/questions/21023763/angularjs-difference-between-angular-route-and-angular-ui-router">Difference between angular-route and angular-ui-router</a>

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

myApp.config(['$stateProvider', '$urlRouterProvider', function ($stateProvider, $urlRouterProvider) {

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

1. Include the CDN for ngRoute in your `index.html`, after the Angular CDN:

  ```html
  <!-- index.html.erb -->

  <!DOCTYPE html>
  <html ng-app="sampleApp">
  <head>

    <!-- angular -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.8/angular.min.js"></script>

    <!-- angular route -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular-route.min.js"></script>

    <!-- custom script (angular app) -->
    <script type="text/javascript" src="app.js"></script>

  </head>
  <body>
    ...
  </body>
  </html>
  ```

1. Now you need to load the `ngRoute` module into your application.
  ```js
    angular.module('starter', ['ngRoute'])
  ```

1. Now we're ready to set up our routes!

** a quick note on naming conventions -- modules like `ng-route` will sometimes be written as `ngRoute`. They are referring to the same module, just in different contexts. **


## Setting up our Templates
As you can probably imagine, as our app grows, our single `html` file is going to get very big and messy. To combat this, we're going to turn our `index.html` into a "layout template." Like in Rails, this template will be the common template for all the views in our application. Other "partial templates" are then included into this layout template depending on the current "route" -- the view that is currently displayed to the user.

To create application routes, we are going to use `ng-route`. `ng-route` helps us wire together controllers, view templates, and the current URL location.

1. Create a folder in the top level of your app called `templates`.
1. Create a new file called `todos.html` and put it in the `templates` folder.
1. In `index.html`, move the code between the `<body></body>` tags to your new `todos.html` file.
1. In `index.html` add an `ng-view` directive in the `body`.
  ```html
  <body ng-controller="MainCtrl">
        <div ng-view></div>
  </body>
  ```

## Configure our Routes

1. Using the `.config()` method, we request the `$routeProvider` to be injected into our config function and use the `$routeProvider.when()` method to define our routes. Open up your `app.js` file. We're going to dot-chain our route information off our app. Put this code at the top of the file right below where you define the app.

  ```js
  angular.module('starter', ['ngRoute'])
  .config(['$routeProvider',
      function($routeProvider) {
        $routeProvider.
          when('/', {
            templateUrl: 'templates/todos.html',
            controller: 'TodoIndexCtrl'
          }).
          otherwise({
            redirectTo: '/'
          });
      }]);
  ```
  **Remember** to rename your `TodoCtrl` to `TodoIndexCtrl` - Gotta keep things **RESTful**.

## Setting up our Controllers

1. Create a new file in your top level called `controllers.js`.
1. Add the file to your `<head>` `<script src="controllers.js"></script>`
1. Move your `MainCtrl` from `app.js` to this new file.
  ```js
  angular.module('starter.controllers', [])
  .controller('MainCtrl', ['$scope', '$rootScope',
      function($scope, $rootScope) {
        ...
      }
  ])
  ```
1. Move your `TodoCtrl` from `app.js` to this new file.
  ```js
  .controller('TodoIndexCtrl', ['$scope',
      function($scope) {
        ...
      }
  ])
  ```

1. Inject `starter.controllers` in to your app like this:

  ```js
    angular.module('starter', ['ngRoute', 'starter.controllers'])
  ```

1. Use `console.log` to see if your controllers are working.

## Accessing URL Params

Using `ngRoute` we will want to access URL parameters in a controller, like when you want to use an `:id` to GET a single resource or when you want to. We'll inject `$routeParams`

```js
app.controller("GuitarDetailsController", ['$scope','$http','$routeParams',
 function($scope, $http, $routeParams)
  {
    $http.get('js/data.json').success (function(data){
      $scope.guitarVariable = data;
      $scope.whichGuitar = $routeParams.guitarID;
    });
  }]
);
```

## Resources

* <a href="https://docs.angularjs.org/api/ngRoute">Angular API Reference - ngRoute</a>
* <a href="http://angular-ui.github.io/ui-router">Angular UI-Router Docs</a>
* <a href="https://github.com/angular-ui/ui-router/wiki">Angular UI-Router Wiki</a>
