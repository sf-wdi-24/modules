# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> OAuth / Third-Party Login

**Objective:** Today, you'll be using <a href="http://oauth.net/2">OAuth</a> to implement third-party login (specifically, GitHub login) in your <a href="https://github.com/sf-wdi-24/express-microblog" target="_blank">express-microblog</a> app.

If you'd like to work with fresh code, feel free to fetch the <a href="https://github.com/sf-wdi-24/express-microblog/tree/solution-auth" target="_blank">solution-auth branch</a> before getting started on the tutorial.

## Tutorial: Microblog with GitHub Login

Adapted from <a href="http://mherman.org/blog/2013/11/10/social-authentication-with-passport-dot-js/#.VkWaBd-rSRs" target="_blank">Social Authentication With Passport.js</a>.

### Install, Require, & Configure Dependencies

1. Change directories into your `express-microblog` app, and make a new branch called `auth`.

  ```zsh
  ➜  cd express-microblog
  ➜  git checkout -b auth
  ```

2. Install `cookie-parser`, `express-session`, `passport`, `passport-local`, and `passport-local-mongoose`.

  ```zsh
  ➜  npm install --save cookie-parser express-session passport passport-local passport-local-mongoose
  ```

  * **<a href="https://github.com/expressjs/cookie-parser" target="_blank">cookie-parser</a>:** parses cookies from the browser
  * **<a href="https://github.com/expressjs/session" target="_blank">express-session</a>:** stores logged-in user info in the session
  * **<a href="http://passportjs.org/docs" target="_blank">passport</a>:** authentication middleware for Node/Express
  * **<a href="https://github.com/jaredhanson/passport-local" target="_blank">passport-local</a>:** passport strategy for authenticating with username and password
  * **<a href="https://github.com/saintedlama/passport-local-mongoose" target="_blank">passport-local-mongoose</a>:** mongoose plugin that simplifies building username and password auth with passport

3. Require the newly installed dependencies in `server.js`.

  ```js
  /*
   * server.js
   */

  // require express and other modules
  var express = require('express'),
      app = express(),
      bodyParser = require('body-parser'),
      mongoose = require('mongoose'),

      //  NEW ADDITIONS
      cookieParser = require('cookie-parser'),
      session = require('express-session'),
      passport = require('passport'),
      LocalStrategy = require('passport-local').Strategy;
  ```

4. Also in `server.js`, tell Express to use the auth middleware you just installed.

  ```js
  /*
   * server.js
   */

  ...

  // middleware for auth
  app.use(cookieParser());
  app.use(session({
    secret: 'supersecretkey',
    resave: false,
    saveUninitialized: false
  }));
  app.use(passport.initialize());
  app.use(passport.session());
  ```

5. Right under your auth middleware in `server.js`, configure passport. This allows users to sign up, log in, and log out of your application.

  ```js
  /*
   * server.js
   */

  ...

  // passport config
  passport.use(new LocalStrategy(User.authenticate()));
  passport.serializeUser(User.serializeUser());
  passport.deserializeUser(User.deserializeUser());
  ```

  At this point, if you check your terminal, you'll see that your server crashed. This is because in your passport configuration, you're using a `User` model (`User.authenticate()`, etc.), which you haven't defined yet. Let's go ahead and do that now!

### User Model

1. Create a new file in `models` called `user.js`.

  ```zsh
  ➜  touch models/user.js
  ```

2. Open up `user.js`, and require `mongoose` and `passport-local-mongoose` at the top.

  ```js
  /*
   * models/user.js
   */

  var mongoose = require('mongoose'),
     Schema = mongoose.Schema,
     passportLocalMongoose = require('passport-local-mongoose');
  ```

3. Also in `user.js`, define the `UserSchema`. Users should have the attributes `email` and `password`.

  ```js
  /*
   * models/user.js
   */

  ...

  var UserSchema = new Schema({
    username: String,
    password: String
  });
  ```

4. Next, add `passportLocalMongoose` to your `UserSchema`. `passportLocalMongoose` takes care of hashing and salting the user's plain-text password when they sign up. It also takes of comparing the password the user enters when logging in to their hashed and salted password which is stored in the database.

  ```js
  /*
   * models/user.js
   */

  ...

  UserSchema.plugin(passportLocalMongoose);
  ```

5. The last step is to create your `User` model and export it.

  ```js
  /*
   * models/user.js
   */

  ...

  var User = mongoose.model('User', UserSchema);
  module.exports = User;
  ```

6. Back in `server.js`, require your `User` model (you can do this right under where you require your `Post` model).

  ```js
  /*
   * server.js
   */

  ...

  // require Post and User models
  var Post = require('./models/post'),
      User = require('./models/user');
  ```

### Sign Up Routes

1. Create a new view with a form for users to sign up.

  ```zsh
  ➜  touch views/signup.hbs
  ```

  Your signup form should look something like this:

  ```html
  <!-- signup.hbs -->

  <h2>Sign Up</h2>
  <br>
  <form method="POST" action="/signup">
    <div class="form-group">
      <input type="text" name="username" class="form-control" placeholder="Username" autofocus>
    </div>
    <div class="form-group">
      <input type="password" name="password" class="form-control" placeholder="Password">
    </div>
    <div class="form-group">
      <input type="submit" class="btn btn-block btn-primary" value="Sign Up">
    </div>
  </form>
  ```

  Take note of the `method` and `action` in the form. This combination of request type `POST` and URL `/signup` will correspond to a server route for signing up new users.

3. In `server.js`, you need two new routes for signing up new users: a route to render the `signup` view, and a route to handle the `signup` request when the user submits the form. Let's create the route to render the view first:

  ```js
  /*
   * server.js
   */

  ...

  // AUTH ROUTES

  // show signup view
  app.get('/signup', function (req, res) {
    res.render('signup');
  });
  ```

4. Now, let's create the route that handles signing up new users. Again, the code in this route will run when the user submits the signup form (since you already set `method` and `action` in the form to match this route).

  ```js
  /*
   * server.js
   */

  ...

  // AUTH ROUTES

  ...

  // sign up new user, then log them in
  // hashes and salts password, saves new user to db
  app.post('/signup', function (req, res) {
    User.register(new User({ username: req.body.username }), req.body.password,
      function (err, newUser) {
        passport.authenticate('local')(req, res, function () {
          res.send('signed up!!!');
        });
      }
    );
  });
  ```

5. Go to `http://localhost:3000/signup` in your browser. You should see the signup form. Fill out the form and hit submit. If it's working, you should see the "signed up!!!" message in your browser. If not, use the error messages you're getting to guide your debugging.

### Log In Routes

1. Create a new view with a form for users to login.

  ```zsh
  ➜  touch views/login.hbs
  ```

  Your login form should look something like this:

  ```html
  <!-- login.hbs -->

  <h2>Log In</h2>
  <br>
  <form method="POST" action="/login">
    <div class="form-group">
      <input type="text" name="username" class="form-control" placeholder="Username" autofocus>
    </div>
    <div class="form-group">
      <input type="password" name="password" class="form-control" placeholder="Password">
    </div>
    <div class="form-group">
      <input type="submit" class="btn btn-block btn-primary" value="Log In">
    </div>
  </form>
  ```

  Take note of the `method` and `action` in the form. This combination of request type `POST` and URL `/login` will correspond to a server route for logging in existing users.

3. In `server.js`, you need two new routes for logging in existing users: a route to render the `login` view, and a route to handle the `login` request when the user submits the form. Let's create the route to render the view first:

  ```js
  /*
   * server.js
   */

  ...

  // AUTH ROUTES

  ...

  // show login view
  app.get('/login', function (req, res) {
    res.render('login');
  });
  ```

4. Now, let's create the route that handles logging in existing useres. Again, the code in this route will run when the user submits the login form (since you already set `method` and `action` in the form to match this route).

  ```js
  /*
   * server.js
   */

  ...

  // AUTH ROUTES

  ...

  // log in user
  app.post('/login', passport.authenticate('local'), function (req, res) {
    res.send('logged in!!!');
  });
  ```

5. Go to `http://localhost:3000/login` in your browser. You should see the login form. Fill out the form with the username and password of the user you just created, then hit submit. If it's working, you should see the "logged in!!!" message in your browser. If not, use the error messages you're getting to guide your debugging.

### Log Out Route

1. You should also have a route for a user to log out. Set this up in `server.js` as well. You'll want to redirect the user to the homepage (`/`) after successfully logging out.

  ```js
  /*
   * server.js
   */

  ...

  // AUTH ROUTES

  ...

  // log out user
  app.get('/logout', function (req, res) {
    req.logout();
    res.redirect('/');
  });
  ```

### User Profile Page

1. At this point, it would be nice to show the user some information about their profile as opposed to a message about signing up or logging in. Create a new view for the user profile page:

  ```zsh
  ➜  touch views/profile.hbs
  ```

2. You don't have a ton of info about the user yet, so for now, display the `username` in the view. `{{user.username}}` is server-side templating with `hbs`! The next step is to set up a server route that renders this view with the user data already in it.

  ```html
  <!-- profile.hbs -->

  <h2>Welcome, {{user.username}}!</h2>
  <p>This is your profile page.</p>
  ```

3. In `server.js`, set up a route that renders the user profile page:

  ```js
  /*
   * server.js
   */

  ...

  // AUTH ROUTES

  ...

  // show user profile page
  app.get('/profile', function (req, res) {
    res.render('profile', { user: req.user });
  });
  ```

  **Note:** `{ user: req.user }` passes the currently logged-in user to the view using `hbs` server-side templating. The key (in this case `user`) has to match the name of the parameter in the view (also `user`). `req.user` is part of the `passport` middleware, and always returns the currently logged-in user, if there is one.

4. Go to `http://localhost:3000/profile` in your browser. You should see the welcome message displayed with your username (you may need to log in again for this to work).

5. The last step is to refactor your signup and login routes to redirect to the user profile page when a user successfully signs up or logs in:

  ```js
  /*
   * server.js
   */

  ...

  // AUTH ROUTES

  ...

  // sign up new user, then log them in
  // hashes and salts password, saves new user to db
  app.post('/signup', function (req, res) {
    User.register(new User({ username: req.body.username }), req.body.password,
      function (err, newUser) {
        passport.authenticate('local')(req, res, function () {
          // res.send('signed up!!!');
          res.redirect('/profile')
        });
      }
    );
  });

  ...

  // log in user
  app.post('/login', passport.authenticate('local'), function (req, res) {
    // res.send('logged in!!!');
    res.redirect('/profile')
  });
  ```

## Stretch Challenges

* Add a navbar to your site with links to "Sign Up", "Log In", "Profile", and "Log Out".
  * If a user is currently logged in, they should only see the "Profile" and "Log Out" links.
  * If a user is not logged in, they should only see the "Sign Up" and "Log In" links.
* Use the `req.user` middleware to *authorize* parts of your site
  * Logged-in users should NOT be able to see the sign up or login.
  * Users should only be able to see the profile page when logged in.

## Super Stretch Challenge

Implement a Mongoose relationship between users and blog posts: a user has many posts. Should posts be embedded or reference data? Logged-in users should be able to see a list of their blog posts on their profile page.