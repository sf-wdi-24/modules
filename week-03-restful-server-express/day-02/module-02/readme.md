# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60">  Intro to Express continued:

<img src="https://cloud.githubusercontent.com/assets/1329385/11004643/4eab3f6a-846e-11e5-9076-ebbeddd861e3.gif" />

## Routes, Params, and Queries

| Objectives |
| :---- |
| Explain parsing URL params and using query string params. |
| Apply routing knowledge to build an Express application with dynamic routes. |
| Explain the usefulness of middleware (e.g., `body-parser`). |

## Pre-reading

* <a href="http://code.tutsplus.com/tutorials/http-the-protocol-every-web-developer-must-know-part-1--net-31177" target="_blank">HTTP Intro</a>

## General thought

<details>
  <summary>Why would you make your own server instead of using a service like Parse?</summary>
  Some people argue it is for control. When you use a service you are becoming locked in to a vendor (vendor lockin) which isn't necessarily a bad thing. The downside to vendor lockin is that you are subject to any changes they make which could destroy your business.

  Another viewpoint is that using a PaaS or SaaS service costs more money when you grow. This is a true statement but depends on "if you grow" instead of "when". If your project is a small school project then it won't matter if you use Parse, but if you're working for a funded startup with customers it may cost more to use Parse than it does to pay your salary and hosting.

  My viewpoint is that each service uses the same terminology. By building your own small API you can learn how those services work and better utilize them.
</details>

<details>
  <summary>Do you know what PaaS, IaaS, SaaS and BaaS stand for?</summary>
  <a href="http://lmgtfy.com/?q=PaaS%2C+SaaS+and+IaaS" target="_blank">More Information on PaaS, SaaS and IaaS</a>.
</details>

## Terminology

* HTTP
* Resource path
* Query string
* HTTP verb
* Status code
* Middleware

## Outline

* Intro (continued) to Express
* Routing
  * HTTP GET
  * Request Params
* Query Params
  * Middleware
* Calculator App

## What Can We Do with Express?

Let's brainstorm and come up with some ideas.

### Setup

Let's start with a simple **Express** application.

* Make a directory and `server.js`

  ```zsh
  mkdir quick_example
  cd quick_example/
  touch server.js
  ```

* Then create a `package.json`. Use the first line below or `npm init`.

  ```zsh
  npm init
  npm install --save express
  npm install --save hbs
  subl .
  ```
The folder structure will be as follows:

```
/quick_example
    /node_modules
        /express
            ...
    server.js
    package.json
```

Now we need to write some code for our simple application.

`server.js`
```js
// requirements
var express = require('express'),
  app = express();

// a "GET" request to "/" will run the function below
// NOTE anyone know how we can better comment this code? *cough* jsdoc *cough*
app.get("/", function (req, res) {
  // send back the response: 'Hello World'
  res.send("Hello World");
});

// start the server
app.listen(3000, function () {
  console.log("Go to localhost:3000/");
});

```

Now you can start the server:

```zsh
node server.js
```

## What is Routing?

Building an application will require us to have a firm grasp of something we call **routing**.  Each **route** is a combination of a **Request Type** and **Path**.

| Request Type | Request Path | Response
| :--- | :--- | :--- |
| `GET` | `/` | `Hello World` |
| `GET` | `/burgers` | `Hamburger`, `Cheese Burger`, `Dble Cheese Burger` |
| `GET` | `/tacos` | `Soft Taco`, `Crunchy Taco`, `Super Taco` |


Let's build these into our application:

`server.js`
```js
var express = require('express'),
  app = express();

var burgers = [
  "Hamburger",
  "Cheese Burger",
  "Dble Cheese Burger"
];

var tacos = [
  "Soft Taco",
  "Crunchy Taco",
  "Super Taco"
];

app.get("/", function (req, res) {
  res.send("Hello World");
});

app.get("/burgers", function (req, res) {
  //send all the burgers     
  res.send(burgers.join(", "));
});

app.get("/tacos", function (req, res) {
  //send all the tacos       
  res.send(tacos.join(", "));
});

app.listen(3000, function () {
  console.log("Go to localhost:3000/");
});

```

## Request (Url) Parameters

What if we want to create an app that can dynamically say hello to anyone?

* Using **url parameters** add a dynamic route to the application, indicated by `:` and the variable name you want to use, we'll use `:name` for the example below.

```js
// another example of some simple middleware
// call this function on every route with the param of 'name'
app.param('name', function(request, response, next) {
  // get name from params
  var name = request.params.name;
  // capitalize the name
  var capitalizedName = name[0].toUpperCase() + name.slice(1).toLowerCase();
  // set the value of the name to the capitalized version
  request.params.name = capitalizedName;
  // pass control to the next middleware function
  next();
})

app.get("/greet/:name", function (req, res) {
  res.send( "Hello, " + req.params.name );
});
```

Here we are seeing the first introduction to parameters that the application can identify. In the following route `:name` is considered a route parameter. We can access it using `req.params.name`.

| Request Type | Request Path | Response
| :--- | :--- | :--- |
| `GET` | `/greet/:name` | `Hello, :name` |


## Query Params

Generally, you don't want to cram everything into a route. Just imagine when there are multiple parameters in route. Or maybe we don't care about getting the order of the parameters correct. Luckily, there are **query parameters** you can include with each request.

Let's see query params in action. Go to <a href="https://google.com/search?q=kittens&tbm=isch" target="_blank">https://google.com/search?q=kittens&tbm=isch</a>

* `?` denotes the beginning of the query parameters.
* `=` indicates an assignment; anything to the left is the key, while the right represents the value.
* `&` allows for the input of multiple parameters, separating each.

Let's add our first route to practice query params.

```js
app.get("/thank", function (req, res) {
  var name = req.query.name;
  res.send("Thank you, " + name);
});
```

Reset your server and go to <a href="localhost:3000/thank?name=jane" target="_blank">localhost:3000/thank?name=jane</a>. Note how we can now define parameters in the url after a `?`.

## Middleware

What is middleware? <a href="http://expressjs.com/guide/using-middleware.html" target="_blank">In terms of Express</a>, middleware is a function with access to the request object (req), the response object (res), and the next middleware in the application’s request-response cycle, commonly denoted by a variable named next.

Middleware can:

* Execute any code.
* Make changes to the request and the response objects.
* End the request-response cycle.
* Call the next middleware in the stack.

You can create your own middleware, or use third-party modules. That's right, there are tons of useful middlewares that are already out there which you can use to handle common challenges like authentication, validations, and parsing.

The <a href="https://github.com/expressjs/body-parser" target="_blank">`body-parser`</a> module is an example of some middleware that makes Express awesome. You can use it to parse out params from the POST'd form. This provides a different way to collect data instead of relying on URL or query params.

`server.js`
```js
var express = require('express');
var bodyParser = require('body-parser');
var hbs = require('hbs');

var app = express();
app.set('view engine', 'hbs');

// bodyParser.urlencoded() returns a function that will be called later in the app.post() route
var parseUrlencoded = bodyParser.urlencoded({extended: false});

// store for cities in memory (as long as server is running)
var cities = [];

app.get('/cities', function(req, res) {
    res.render('cities', {cities: cities});
})

// passing multiple middleware functions to this route; they are executed sequentially.
// NOTE does it matter what we call the request and response parameter for our callback?
app.post('/cities', parseUrlencoded, function (request, response) {
  //                ^- middleware -^
  var city;
  var name = request.body.name;
  var description = request.body.description;
  city = { name: name, description: description}
  cities.push(city);

  // passing local variables to be used in your template
  response.render('cities', { cities: cities});
});
```

Is there something missing from this code?

We haven't installed the `body-parser` package.

And we need a template to display the cities.

Now we'll break up into groups and fix this code by adding the `body-parser` module then creating a handlebars template to display cities.

## Summary

We learned about:

* Routing to different resources, i.e. `/burgers` and `/tacos`.
* Using dynamic parameters, i.e. `/burgers/:index` and `/tacos/:index` to request specific data.
* Using query parameters for dynamic requests to serve up dynamic responses.
* What middleware is and why it is helpful.


This will be essential knowledge for building and interacting with applications that contain multiple resources, such as users, posts, comments, etc.


## Resources

1. <a href="http://expressjs.com/starter/installing.html" target="_blank">Starting an Express Project</a>
2. <a href="http://expressjs.com/starter/hello-world.html" target="_blank">Express Hello World</a>
3. <a href="http://expressjs.com/starter/basic-routing.html" target="_blank">Express Basic Routing</a>

