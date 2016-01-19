# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Angular Directives

| Objectives |
| :--- |
| Review Angular app setup |
| Extend your app's functionality with Angular's built-in directives |

## What are directives?

> At a high level, directives are markers on a DOM element (such as an attribute, element name, comment or CSS class) that tell AngularJS's **HTML compiler** (`$compile`) to attach a specified behavior to that DOM element (e.g. via event listeners), or even to transform the DOM element and its children. <a href="https://docs.angularjs.org/guide/directive#what-are-directives-" target="_blank">AngularJS Developer Guide</a>

In Angular, we **add behavior to HTML** by using directives. A directive is a marker on an HTML tag that tells Angular to run or reference JavaScript code.

Angular directives start with the prefix `ng-`. You've already seen a couple built-in directives:

* `ng-app`: turns ordinary HTML into an Angular application.
* `ng-controller`: attaches a controller to the view (or a specific section of the view).

Two more that you will use often:

* `ng-model`: binds a form element's value to a property on `$scope`.
* `ng-repeat`: iterates over a collection.

Here is a full <a href="https://docs.angularjs.org/api/ng/directive" target="_blank">list of Angular's built-in directives</a>.

### ngModel

Assume you have the following Angular app set up for a trainer to manage their Pokémon. Here is the HTML snippet containing your Angular app:

```html
<!-- index.html -->

<!DOCTYPE html>
<html ng-app="pokemonApp">
<head>
  ...

  <!-- angular -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.8/angular.min.js"></script>

  <!-- custom script (angular app) -->
  <script type="text/javascript" src="app.js"></script>

</head>
<body ng-controller="PokemonCtrl">

  ...

</body>
</html>
```

And here is the JavaScript code that initializes your Angular app and adds the collection of Pokémon to `$scope`:

```js
// app.js

var app = angular.module('pokemonApp', []);

app.controller('PokemonCtrl', ['$scope', function ($scope) {
  $scope.pokemon = [
    {
      nDex: 25,
      name: 'Pikachu',
      type: 'Electric'
    },
    {
      nDex: 10,
      name: 'Caterpie',
      type: 'Bug'
    },
    {
      nDex: 39,
      name: 'Jigglypuff',
      type: 'Fairy'
    },
    {
      nDex: 94,
       name: 'Gengar',
      type: 'Ghost'
    },
    {
      nDex: 143,
      name: 'Snorlax',
      type: 'Normal'
    }
  ];
}]);
```

You want the user to be able to input their name in a form field so that the application acknowledges them as the trainer for these Pokémon. You can use the `ngModel` directive to bind the form input to another element on the page:

```html
<!-- index.html -->

<body ng-controller="PokemonCtrl">

  <h2>Trainer: {{trainer.name}}</h2>

  <span>Enter your name:</span>
  <input type="text" ng-model="trainer.name">

</body>
```

This "binds" the value of `trainer.name` between the form input and the `h2` tag. Whenever the user types something in the form, the `h2` tag's text will automatically update.

Using `ngModel` with `trainer.name` adds a `trainer` object to `$scope`. If you were to inspect `$scope` using the debugger, it would look something like this:

```js
$scope = {
  trainer: {
    name: "Whatever the user typed in the form."
  }
}
```

What if you wanted to set a default value for the trainer's name so that when the page loads, it's set to "Ash"?

You can set a default value in the Angular templating parameters:

```html
<!-- index.html -->

<body ng-controller="PokemonCtrl">

  <h2>Trainer: {{trainer.name || "Ash"}}</h2>

  <span>Enter your name:</span>
  <input type="text" ng-model="trainer.name">

</body>
```

Or directly on `$scope` in the controller:

```js
// app.js

var app = angular.module('pokemonApp', []);

app.controller('PokemonCtrl', ['$scope', function ($scope) {
  $scope.trainer = {
    name: "Ash"
  };

  $scope.pokemon = [
    {
      nDex: 25,
      name: 'Pikachu',
      type: 'Electric'
    },
    ...
  ];
}]);
```

### ngRepeat

You can use `ngRepeat` to iterate through the collection of Pokémon and display them on the page!

```html
<!-- index.html -->

<body ng-controller="PokemonCtrl">

  <div ng-repeat="poke in pokemon">
    <p>{{poke.name}}</p>
  </div>

</body>
```

### Filtering Data

In addition to directives, Angular also has built-in  <a href="https://docs.angularjs.org/api/ng/filter" target="_blank">filter components</a> that format data for displaying it to the user.

You can use the <a href="https://docs.angularjs.org/api/ng/filter/orderBy" target="_blank">orderBy</a> filter to sort the Pokémon by nDex number:

```html
<!-- index.html -->

<body ng-controller="PokemonCtrl">

  <div ng-repeat="poke in pokemon | orderBy:'nDex'">
    <p>{{poke.name}}</p>
  </div>

</body>
```

You can use the <a href="https://docs.angularjs.org/api/ng/filter/filter" target="_blank">filter</a> filter to allow users to search the list of Pokémon by typing any Pokémon attribute (name, nDex, etc.). Notice the use of `ng-model` to bind the value of the search field to the filter on the collection.

```html
<!-- index.html -->

<body ng-controller="PokemonCtrl">

  <span>Search Pokémon:</span>
  <input type="text" ng-model="searchPokemon">

  <div ng-repeat="poke in pokemon | orderBy:'nDex' | filter:searchPokemon">
    <p>{{poke.name}}</p>
  </div>

</body>
```

## Challenges

Work on the <a href="https://github.com/sf-wdi-24/intro-angular-lab" target="_blank">Intro Angular Lab</a> (which is also tonight's homework).

## Resources

* <a href="https://docs.angularjs.org/guide/directive#what-are-directives-" target="_blank">AngularJS Developer Guide - Directives</a>
* <a href="https://docs.angularjs.org/api/ng/directive" target="_blank">AngularJS API Reference - Directives</a>
* <a href="https://docs.angularjs.org/api/ng/filter" target="_blank">AngularJS API Reference - Filter Components</a>
