# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Auth Implementation

**Objective:** Today, you'll be implementing user authentication in your <a href="https://github.com/sf-wdi-24/express-microblog" target="_blank">express-microblog</a> app.

If you'd like to work with fresh code, feel free to fetch the <a href="https://github.com/sf-wdi-24/express-microblog/tree/solution" target="_blank">solution branch</a> before getting started on the tutorial.

## Tutorial: Microblog with User Auth

Adapted from <a href="http://mherman.org/blog/2015/01/31/local-authentication-with-passport-and-express-4/#.VkVw8t-rSRs" target="_blank">User Authentication With Passport and Express 4</a>

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
      passport = require('passport');
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

### Log In Routes

### User Profile Page

## Stretch Challenges

* Don't let logged in user sign up or log in again
* Redirect away from profile page if not logged in
