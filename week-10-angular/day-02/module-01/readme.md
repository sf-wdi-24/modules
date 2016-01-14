# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Intro Angular

| **Learning Objectives** |
| :---- |
| Grok Angular's philosophy |
| Initialize Angular in an HTML view |
| Experiment with templating & expressions |
| Organize your code with controllers |
| Pass data between the View & Controller with $scope|
| Implement 2-way data binding |


## Highlights of AngularJS

<a href="https://docs.angularjs.org/guide/introduction" target="_blank">Angular Guide Introduction</a>

* A "framework for dynamic web apps"
* "Lets you use HTML as your template language"
* Will "extend HTML's syntax"
* "Handles all of the DOM and AJAX glue code you once wrote by hand and puts it in a well-defined structure"
* Is "opinionated about how a CRUD application should be built"
* Comes with "Data-binding, basic templating directives, form validation, routing, deep-linking, reusable components and dependency injection"
* "Angular simplifies application development by presenting a higher level of abstraction to the developer"
* "Not every app is a good fit for Angular. Angular was built with the CRUD application in mind."
* "Angular is built around the belief that declarative code is better than imperative when it comes to building UIs and wiring software components together, while imperative code is excellent for expressing business logic."

## HTML Setup

1. Create a new directory `ngFun`.

2. Create a new file `index.html` and link your html file to angular `<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>`.

3. In your HTML try changing the `<body>` to `<body ng-app>`. This will tell your HTML page to use use angular.

4. Create an empty `app.js` file in your `index.html` and require it in your `<head>` after angular.

5. Let's name our app `ngFun`. To do this we can create an empty angular module.

6. `app.js`

    ```js
    var app = angular.module("ngFun", []);
    ```

6. Now update your `body` element to `<body ng-app="ngFun">`.

Sweet, we're up and running!

## Templates & Expressions

Angular creates it's views by templating directly into HTML with expressions. This is it's declarative way of building the UI.

Try writing any regular javascript expression in side double curly brackets, such as: `{{ <someExpression> }}` and see what your HTML evaluates to. What happens what you express:

* `4 * 4`
* `"hola!".toUpperCase()`
* `['s','w','e','e','t','n','e','s','s'].join("")`

## Controllers & Scope

Controllers contain all the business logic for our application.

We can seed our application with some data, but first we have to create a controller.

`app.js`

```js
app.controller("PokemonCtrl", function() {
	//logic here
});
```

Most applications will have several controllers that map to a particular resource. In this case we're using Pokemon.

To use our controller in our View we have to declare it somewhere. Create a new `div` tag that will house our Pokemon Controller.

`index.html`

```html
<div ng-controller="PokemonCtrl">
	<!--placeholder for now-->
</div>
```

In order to pass data or behavior to our HTML view we need to use the object `$scope`. It is the interface to pass data and behavior into our views. Both the View and Controller share access to the $scope object.

![scope](http://devgirl.org/wp-content/uploads/2013/03/concepts-controller.png)

Let's register some Pokemon with $scope!

```js
app.controller("PokemonCtrl", function($scope){
  $scope.pokemon = [
    {
      Ndex: 25,
      name: 'Pikachu',
      type: 'Electric'
    },
    {
      Ndex: 10,
      name: 'Caterpie',
      type: 'Bug'
    },
    {
      Ndex: 39,
      name: 'Jigglypuff',
      type: 'Fairy'
    },
    {
      Ndex: 94,
       name: 'Gengar',
      type: 'Ghost'
    },
    {
      Ndex: 143,
      name: 'Snorlax',
      type: 'Normal'
    }
  ];
});
```

Great, now let's see if we can see them in our view by referencing the `pokemon` variable inside an expression and wrapping it in a `pre` tag.

```html
<div ng-controller="PokemonCtrl">
	<pre>{{ pokemon }}</pre>
</div>
```

That's cool, but it doesn't look very great. What if we could format our data so that the View knows to render it as JSON?

### Challenge

* Pass a new variable `catchphrase` from the Controller to the View. Set it's value as "gotta catch 'em all!" and use an angular filter to uppercase it in the View.



### ng-Model

Our user wants to be able to input their name in a field, so that the application acknowledges them as the trainer for these Pokemon.

Above our list of Pokemon, but still inside our `PokemonCtrl` `div` tag, let's create an input field for our trainers name.

```html
<div ng-controller="PokemonCtrl">

  <span>Enter your name:</span>
  <input/>

  <pre>{{ pokemon | json }}</pre>
</div>
```

If we want our input field to map its value to an attribute `name` on a `trainer` object we could add an `ng-model` directive to it.

```html
<input ng-model="trainer.name"/>
```

### Challenge

* How could we create a default value for the trainer's name so that when the page loads it is set to `Ash`?



### Challenge

Rendering the JSON Pokemon in a bootstrap table, where each attribute is a column. The final result should look like this:

![pokemon-table](http://i.imgur.com/or1CwF7.png)

Hint: Bootstrap CDN
