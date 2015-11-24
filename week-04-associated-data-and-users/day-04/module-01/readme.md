# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Web Sockets

A **web socket** is an open connection between a client and a server. Traditionally, we need to use HTTP to communicate between client and server, which involves the request/response cycle. With a web socket, the connection between client and server is always on, and "events" pass freely between the two.

*Web sockets are particularly useful for real-time communication such as chat applications, push notifications, and live-streaming data.*

<a href="http://socket.io" target="_blank">Socket.io</a> is a web socket library that works well with our Node/Express stack.

**Objective:** Today, you'll be using Socket.io to build your own chat application!

## Tutorial: Socket Chat App

Adapted from <a href="http://socket.io/get-started/chat" target="_blank">Socket.io's chat app example</a>.

### Express App Set-Up

1. Make sure you're in your `develop` folder, and make a new directory called `socket-chat`. Change directories into `socket-chat`, and run `npm init` to initialize the directory as a Node project.

  ```zsh
  ➜  mkdir socket-chat
  ➜  cd socket-chat
  ➜  npm init
  ```

2. Install `express`, `body-parser`, `hbs`, and `socket-io`.

  ```zsh
  ➜  npm install --save express body-parser hbs socket.io
  ```

3. Set up your file structure.

  ```zsh
  ➜  touch server.js
  ➜  touch .gitignore
  ➜  mkdir views
  ➜  touch views/index.hbs
  ➜  mkdir public
  ➜  touch public/main.css
  ➜  touch public/main.js
  ```

  Your file structure should now look like this:

  ```
  | socket-chat
    | node_modules
    | public
      - main.css
      - main.js
    | views
      - index.hbs
    - .gitignore
    - package.json
    - server.js
  ```

  *Remember to add `node_modules` to your `.gitignore`!*

4. In `server.js`, require your dependencies, and set up your server to listen on port 3000. **Note:** You need to create a Node `http` server for your socket connection to work!

  ```js
  /*
   * server.js
   */

  // require express and other modules
  var express = require('express'),
      app = express(),
      http = require('http').Server(app), // node http server
      bodyParser = require('body-parser'),
      io = require('socket.io')(http);

  // listen on port 3000
  http.listen(3000, function() { // node http server
    console.log('server started');
  });
  ```

5. Also in `server.js`, set up your middleware and view engine.

  ```js
  /*
   * server.js
   */

  ...

  // configure bodyParser (for receiving form data)
  app.use(bodyParser.urlencoded({ extended: true }));

  // serve static files from public folder
  app.use(express.static(__dirname + '/public'));

  // set view engine to hbs (handlebars)
  app.set('view engine', 'hbs');

  ...
  ```

6. Make a route for your homepage that renders your `index` view.

  ```js
  /*
   * server.js
   */

  ...

  // homepage route
  app.get('/', function (req, res) {
    res.render('index');
  });

  ...
  ```

7. Set up your HTML boilerplate in `index.hbs`. You should include Bootstrap, jQuery, `main.css`, and `main.js`.

  ```html
  <!-- index.hbs -->

  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">

    <!-- set viewport to device width to make site responsive -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- bootstrap css -->
    <link type="text/css" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- custom styles -->
    <link rel="stylesheet" type="text/css" href="main.css">

    <title>Socket Chat</title>
  </head>
  <body>
    <h1>Hello world<h1>

    <!-- jquery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

    <!-- bootstrap js -->
    <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <!-- custom script -->
    <script type="text/javascript" src="main.js"></script>
  </body>
  </html>
  ```

8. At this point, you should start your server (`nodemon`), and go to `http://localhost:3000` in the browser. Debug any errors you run into.

  ```zsh
  ➜  nodemon
  ```

### Socket.io Set-Up

1. Now it's time to set up the socket connection on the server. Add the following code to `server.js`:

  ```js
  /*
   * server.js
   */

  ...

  // connect to socket
  io.on('connection', function(socket){
    console.log('a user connected');

    socket.on('disconnect', function() {
      console.log('user disconnected');
    });
  });

  ...
  ```

  This listens for users (clients) connecting and disconnecting to the web socket. Once you set up the socket connection on the client (steps 2-3), you'll see these messages every time a user connects or disconnects.

2. To set up the socket connection on the client, add the `socket.io` client-side library to `index.hbs` BEFORE you require `main.js`:

  ```html
  <!-- index.hbs -->

  ...

  <body>

    ...

    <!-- socket.io -->
    <script type="text/javascript" src="/socket.io/socket.io.js"></script>

    <!-- custom script -->
    <script type="text/javascript" src="main.js"></script>
  </body>
  </html>
  ```

  Note that the `socket.io` client-side library is a *relative path*. This is because the client-side library gets installed directly in your app when you install `socket.io` with `npm`.

3. To finish setting up the socket connection on the client, add the following code to `main.js`:

  ```js
  /*
   * main.js
   */

  // wait for DOM to load before running JS
  $(function() {

    // connect to socket
    var socket = io();

  });
  ```

  Open `http://localhost:3000` in multiple browser tabs, then check your terminal where you have `nodemon` running. What do you see? Now close some of the tabs, and look at the terminal again. Now you're ready to use the socket to pass messages between your client and server!

4. The first thing you need is a form in `index.hbs` for the user to type a message. You also need an element on the page to list all the messages.

  ```html
  <!-- index.hbs -->

  ...

  <body>
    <!-- list of messages -->
    <ul id="messages"></ul>

    <!-- form to send a new message -->
    <form id="send-msg">
      <input type="text" id="new-msg" placeholder="Your message" autofocus>
      <input type="submit" value="Send">
    </form>

    ...

  </body>
  </html>
  ```

5. When a user submits a new message, you want to send that message to the socket:

  ```js
  /*
   * main.js
   */

  $(function() {

    ...

    // submit form to send a message
    $('#send-msg').on('submit', function (event) {
      event.preventDefault();

      // get new message from form input
      var newMsg = $('#new-msg').val();

      // send new message to socket (server)
      socket.emit('chat message', newMsg);
    });

  });
  ```

6. The `socket.emit()` action on the client sends the message to the server. What you want to happen next is the server should receive the message and broadcast it out to all connected clients. Update your `io.on('connection')` event in `server.js` to receive and broadcast messages:

  ```js
  /*
   * server.js
   */

  ...

  // connect to socket
  io.on('connection', function (socket) {
    console.log('user connected');

    // receive and broadcast chat messages
    socket.on('chat message', function (msg) {
      console.log('message:', msg);
      io.emit('chat message', msg);
    });

    socket.on('disconnect', function() {
      console.log('user disconnected');
    });
  });

  ...

  ```

7. There's just one more thing you need to do! Any time a connected client receives a new message, append that message to the view. To make that happen, add an event-listener for chat messages:

  ```js
  /*
   * main.js
   */

  // receive message from socket (server)
  socket.on('chat message', function (msg) {
    $('#messages').append($('<li>' + msg + '</li>'));
  });
  ```

## Stretch Challenges

* Use Handlebars client-side templating to append new chat messages to the view.
* Allow users to enter a username that displays next to all their messages.
* Broadcast a message to connected users when someone connects or disconnects.
* Add "{user} is typing" functionality.
* Show a list of all users online.

## Resources

<a href="http://socket.io" target="_blank">Socket.io</a>
