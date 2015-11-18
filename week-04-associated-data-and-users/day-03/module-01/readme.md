# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> OAuth / Third-Party Login

**Objective:** Today, you'll be using <a href="http://oauth.net/2" target="_blank">OAuth</a> to implement third-party login (specifically, GitHub login) in your <a href="https://github.com/sf-wdi-24/express-microblog" target="_blank">express-microblog</a> app.

If you'd like to work with fresh code, feel free to fetch the <a href="https://github.com/sf-wdi-24/express-microblog/tree/solution-auth" target="_blank">solution-auth branch</a> before getting started on the tutorial.

## Tutorial: Microblog with GitHub Login

Adapted from <a href="http://mherman.org/blog/2013/11/10/social-authentication-with-passport-dot-js/#.VkWaBd-rSRs" target="_blank">Social Authentication With Passport.js</a>.

### Register OAuth

1. Register your app with GitHub <a href="https://github.com/settings/applications/new" target="_blank">here</a>.

  **Make sure to set the Homepage URL to `http://localhost:3000/` and the Authorized callback URL to `http://localhost:3000/auth/github/callback`.**

  ![screen shot 2015-11-13 at 00 12 50](https://cloud.githubusercontent.com/assets/7833470/11142837/0e6e7c6e-89a5-11e5-8e6e-eded72b4c721.png)

  Once you click "Register application", find your "Client ID" and "Client Secret" (top right). You'll need these for step #3.

2. Change directories into your `express-microblog` app, and make a new branch called `oauth`.

  ```zsh
  ➜  cd express-microblog
  ➜  git checkout -b oauth
  ```

3. Create a new file in the root directory of your app called `oauth.js`.

  ```zsh
  ➜  touch oauth.js
  ```

  Add the following code:

  ```js
  /*
   * oauth.js
   */

  var ids = {
    github: {
      clientID: 'YOUR_GITHUB_ID',
      clientSecret: 'YOUR_GITHUB_SECRET',
      callbackURL: 'http://localhost:3000/auth/github/callback'
    }
  };

  module.exports = ids;
  ```

### Install, Require, & Configure Dependencies

1. Install <a href="https://github.com/jaredhanson/passport-github" target="_blank">passport-github</a>.

  ```zsh
  ➜  npm install --save passport-github
  ```

2. Require `passport-github` and `oauth.js` in `server.js`.

  ```js
  /*
   * server.js
   */

  // require express and other modules
  var express = require('express'),
      app = express(),
      bodyParser = require('body-parser'),
      mongoose = require('mongoose'),
      cookieParser = require('cookie-parser'),
      session = require('express-session'),
      passport = require('passport'),
      LocalStrategy = require('passport-local').Strategy,

      // NEW ADDITIONS
      GitHubStrategy = require('passport-github').Strategy,
      oauth = require('./oauth.js');
  ```

3. Also in `server.js`, update your `serializeUser` and `deserializeUser` callback functions:

  ```js
  /*
   * server.js
   */

  ...

  // passport config
  passport.use(new LocalStrategy(User.authenticate()));
  // EXISTING LINES - COMMENT THESE OUT
  // passport.serializeUser(User.serializeUser());
  // passport.deserializeUser(User.deserializeUser());

  // ADD THESE INSTEAD
  // serialize and deserialize
  passport.serializeUser(function (user, done) {
    done(null, user);
  });
  passport.deserializeUser(function (obj, done) {
    done(null, obj);
  });
  ```

4. Right under `serializeUser` and `deserializeUser`, configure `passport-github`. This allows users to log in to your application with their GitHub accounts.

  ```js
  /*
   * server.js
   */

  ...

  // serialize and deserialize

  ...

  // passport-github config
  passport.use(new GitHubStrategy({
    clientID: oauth.github.clientID,
    clientSecret: oauth.github.clientSecret,
    callbackURL: oauth.github.callbackURL
  }, function (accessToken, refreshToken, profile, done) {
    process.nextTick(function() {
      return done(null, profile);
    });
  }));
  ```

### Login Routes

1. Add the following routes to `server.js` for a user to log in with GitHub:

  ```js
  /*
   * server.js
   */

  ...

  // AUTH ROUTES

  ...

  app.get('/auth/github', passport.authenticate('github'), function (req, res) {
    // the request will be redirected to github for authentication,
    // so this function will not be called
  });

  app.get('/auth/github/callback', passport.authenticate('github', { failureRedirect: '/login' }),
    function (req, res) {
      console.log(req.user);
      res.redirect('/profile');
    }
  );
  ```

  The first route is what a user will request to indicate they'd like to log in with GitHub (you'll use this one in the view), and the second route is where GitHub redirects the user after authenticating them. After the redirect, your application will handle logging in the user and creating them in the database if they're not already signed up.

2. Now, it's time to edit your signup and login forms to take advantage of GitHub login:

  ```html
  <!-- signup.hbs -->

  <form method="POST" action="/signup">
    ...
  </form>
  
  <!-- button (link) to sign up with github (same as logging in with github) -->
  <a href="/auth/github" class="btn btn-block btn-default">Sign Up with GitHub</a>
  ```

  ```html
  <!-- login.hbs -->

  <form method="POST" action="/login">
    ...
  </form>

  <!-- button (link) to log in with github -->
  <a href="/auth/github" class="btn btn-block btn-default">Log In with GitHub</a>
  ```

3. At this point, test out your GitHub login. You should first be redirected to GitHub, then to your profile page if it works.

  ![screen shot 2015-11-13 at 05 36 52](https://cloud.githubusercontent.com/assets/7833470/11147126/b1aa5b1e-89c8-11e5-98f1-058ea56a7ec4.png)

  ----------

  ![screen shot 2015-11-13 at 05 37 21](https://cloud.githubusercontent.com/assets/7833470/11147125/b1a6f654-89c8-11e5-90db-294e1d13d94b.png)

  If this doesn't work, use the error messages you're getting to guide your debugging.

### Creating a New User

1. At this point, you can log in a user with GitHub, but you also want to check if that user is already in your database. If not, you want to create a new account for them. The first step is to add `oauthID` to your `UserSchema`:

  ```js
  /*
   * models/user.js
   */

  ...

  var UserSchema = new Schema({
    // ADD OAUTH ID
    oauthID: Number,
    username: String,
    password: String
  });
  ```

2. Next, update the `GitHubStrategy' so that it saves the user if they don't already exist in the database:

  ```js
  /*
   * server.js
   */

  ...

  // passport-github config
  passport.use(new GithubStrategy({
    clientID: oauth.github.clientID,
    clientSecret: oauth.github.clientSecret,
    callbackURL: oauth.github.callbackURL
  }, function (accessToken, refreshToken, profile, done) {
    User.findOne({ oauthID: profile.id }, function (err, foundUser) {
      if (foundUser) {
        done(null, foundUser);
      } else {
        var newUser = new User({
          oauthID: profile.id,
          username: profile.username
        });
        newUser.save(function (err, savedUser) {
          console.log('saving user...');
          done(null, savedUser);
        });
      }
    });
  }));
  ```

3. Finally, update the serialization/deserialization again and move it AFTER the config section:

  ```js
  /*
   * server.js
   */

  ...

  // passport-github config

  ...

  // serialize and deserialize
  passport.serializeUser(function (user, done) {
    console.log('serializeUser:', user._id);
    done(null, user._id);
  });
  passport.deserializeUser(function (id, done) {
    User.findById(id, function (err, user) {
      console.log(user);
      done(null, user);
    });
  });
  ```

## Stretch Challenges

* Figure out what other information GitHub gives you about the user (name, avatar, etc.), and pick a couple other attributes to save to the database. Display the additional attributes on the user profile page as well. **Hint:** Try `console.log`-ing `profile` in your `passport-github` config or use the debugger.
* Keep practicing with as many OAuth providers as you want! Use <a href="http://mherman.org/blog/2013/11/10/social-authentication-with-passport-dot-js/#.VkWaBd-rSRs" target="_blank">this tutorial</a> as a guide.
