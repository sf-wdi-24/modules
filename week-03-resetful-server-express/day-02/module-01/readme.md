# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> Intro to Express

| Objectives |
| :--- |
| Explain the request response cycle |
| Use npm (node package manager) to initialize a node project |
| Write a local Node.js web server with Express |
| Add Handlebars to an Express app |

### Motivation (Why?)

Express is a cutting-edge, unopinionated, server-side JavaScript framework that runs on a Node.js server. It is a very, very popular and trending framework with a bevy of modules you can add to it.

### What is Node?
- Node.js is a webserver that operates on the V8 Google Chrome JavaScript runtime, allowing you to write server-side code in JavaScript.
- Node.js provides the ability to handle requests and issue responses.
- It is fast.
- It is fast largely because it is asynchronous, meaning code can run in parallel without "blocking" the call stack (the list of other concurrent commands).

### NPM and NPM Init
- NPM stands for Node Package Manager, and is a tool that allows us to easily download community-built Node packages.
- Initialize new Node project with NPM: `npm init`.
- Install NPM packages: `npm install --save express`.
- NPM works with package.json, which is a list of project information and dependencies that can be installed on other computers and servers.

### Express JS
- Express is an framework built on top of Node.js that makes development of web servers more intuitive and quicker.
- Express allows us to easily set up routes that will trigger actions such as rendering pages or returning JSON.

### Hello World in Express

```javascript
var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.send('Hello World!');
})

var server = app.listen(3000);
```

### What is Node Good For?
- Node really shines when it comes to heavy input-output type operations.
- Realtime services like chat applications or conferencing platforms benefit from using Node.
- APIs are also input/output heavy, and they also tend to work with JavaScript out of the box (think JSON). What better platform than Node?

### Request Response Cycle

Remember that the interwebs is many clients querying many servers. We've done a lot with clients and APIs, and now we want to write the server side code that handles the request and then responds with some data.

![request](http://i.imgur.com/YXgj8.png)

**In Express**

Let's look at a basic `get` method in an express app.

```js
// server.js
  var taquerias = [
    { name: "La Taqueria" },
    { name: "El Farolito" },
    { name: "Taqueria Cancun" }
  ]
```

```js
  app.get('/api/taquerias', function (req, res) {
    res.json(taquerias);
  });
```

Note that the `app` object has a method called `.get()` which takes two arguments: a url and a callback function. The callback takes two arguments. The `req`, and `res`. These stand for "Request" and "Response" from the request response cycle. We'll be console logging these objects in the exercises.

### Game Plan

Today's <a href="https://github.com/sf-wdi-24/express-practice" target="_blank">exercises</a> are set up a bit like a tutorial to walk you through:

  * creating a new project with Node and Express
  * creating routes for clients to make requests to your server
  * using server-side HTML templates to send responses with data and HTML at the same time
  * storing data on the server
  * responding to GET requests with simple strings (`res.send`), HTML templates (`res.render`), or JSON data (`res.json`)
  * serving static files (images, css...)


### Docs, Resources, Further Reading

1. <a href="http://expressjs.com/starter/installing.html" target="_blank">Starting an Express Project</a>
2. <a href="http://expressjs.com/starter/hello-world.html" target="_blank">Express Hello World</a>
3. <a href="http://expressjs.com/starter/static-files.html" target="_blank">Express Static Files</a>
4. <a href="http://expressjs.com/4x/api.html#res.render" target="_blank">Express res.render()</a>
