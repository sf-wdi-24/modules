# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Angular $http & ng-resource

| Objectives |
| :--- |
| Request remote resources with `$http`. |
| Interact with REST APIs using `ng-resource`. |
| CRUD items on a REST API. |

## Angular `$http`

![Docs](https://cloud.githubusercontent.com/assets/1329385/12429176/b05c7eea-be9d-11e5-8da4-18b968e8cd72.gif)

We **should** know jQuery's `$.get` and `$.ajax` by now.

<details>
  <summary>What would you call these methods?</summary>

  Methods which make remote HTTP calls asynchronously from our browser. They allow us to request information over HTTP without interrupting the UI thread.
</details>

In our projects, we've used these methods often. We can still use these but Angular built its own version called `$http`.

Let's look at an example of how it is used and walk over the separate components.

<a href="https://jsfiddle.net/eerwitt/wwo7vthb/" target="_blank">Echo App</a>

You must be able to answer these questions.

* Where is `echoApp` defined?
* What is the name of the `ng-app` used on this page?
* Where is `EchoCtl` defined?
* What is the name of the `ng-controller` used on the page?
* How did we inject (include) required libraries for a controller?
* How did we make a GET request to an API?
* How did we set the API's URL?
* Where is the success callback defined?
* How do we use promises in our code?
* Where is the error callback defined?
* How do we set `results` to be the response from an API?

## `ng-resource` and REST APIs

Built on the top of the `$http` service, Angular’s `$resource` is a service that lets you interact with RESTful backends easily. `$resource` is similar to models in Rails.

Let's explore a Pokémon REST API using `ng-resource`.

<a href="http://jsfiddle.net/eerwitt/s50xs57x/" target="_blank">Pokémon App</a>

You must be able to answer these questions.

* Where is `pokemonApp` defined?
* What is the name of the `ng-app` used on this page?
* Where is `PokemonCtl` defined?
* What is the name of the `ng-controller` used on the page?
* How did we inject (include) required libraries for a controller?
* How did we create the `Pokemon` resource?
* How did we make a GET request to an API?
* How did we customize the results returned from getting a list of Pokémon?
* How did we set the API's URL?
* Where is the success callback defined?
* How do we use promises in our code?
* Where is the error callback defined?
* How do we update the page to show `pokemon` returned from the API?
* How did we get `caterpie`'s information?
* Could we delete `caterpie`?

## Your Turn

We've gone over how to work with remote servers using Angular. Now it is your turn to create a web-app using Angular which speaks to a remote server.

### MVP

Your web-app will work with books found on <a href="https://github.com/sf-wdi-24/crud-api" target="_blank">super-crud API</a> and has a few requirements.

1. List all books.
1. Creates a book with form values.
1. Get a book by ID.
1. Update a book based on ID and form input.
1. Delete books based on ID in response to a button being clicked.
1. Must have at least two routes.
