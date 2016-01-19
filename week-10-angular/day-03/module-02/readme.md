# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Angular $http & ng-resource

| Objectives |
| :--- |
| Request remote resources with `$http`. |
| Interact with REST APIs using `ngresource`. |
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

[Echo App](https://jsfiddle.net/eerwitt/wwo7vthb/)

You must be able to point out where these pieces happen in the code:

* `echoApp` is defined.
* The name of the `ng-app` for this page.
* `EchoCtl` is defined.
* The name of the `ng-controller` for this page.
* Injecting (including) required libraries for a controller.
* Making a GET request to an API.
* The API's URL.
* Promises when an API request has finished.
* Error callback.
* Setting the `results` to be the response from an API.

## `ng-resource` and REST APIs

Built on the top of the `$http` service, Angular’s `$resource` is a service that lets you interact with RESTful backends easily. `$resource` is similar to models in Rails.

Let's explore a Pokémon REST API using `ng-resource`.

[Pokemon App](http://jsfiddle.net/eerwitt/s50xs57x/)
