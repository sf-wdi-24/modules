# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Deploying to Heroku with Node.js & MongoDB

## Before You Do Anything

1. Make sure your app is under version control with `git`.  If you're not sure if your project is under version control yet, you definitely haven't been committing often enough. Run `git status` to check if your project directory is a git repo. If not, run `git init` to make it into one, then commit everything you have so far.

2. If you haven't already, sign up for a <a href="https://www.heroku.com" target="_blank">Heroku account</a>.

3. If you haven't already, install the <a href="https://toolbelt.heroku.com" target="_blank">Heroku toolbelt</a>.

## Create Your Heroku App

1. Add a new remote to your project repository that points to Heroku's servers. **Your project must be a git repo to continue.**

  In the Terminal, from your project's root directory, run:

	```zsh
	➜  heroku create YOUR_APP_NAME
	```

  If you don't supply a name for your app, Heroku will create a random one for you. We strongly suggest giving your app a name to personalize it and reflect its purpose.

2. Also in the Terminal, from your project's root directory, run:

  ```zsh
  ➜  git remote -v
  ```

  You should see something like this:

  ```zsh
  heroku	https://git.heroku.com/YOUR_APP_NAME.git (fetch)
  heroku	https://git.heroku.com/YOUR_APP_NAME.git (push)
  origin	https://github.com/YOUR_GITHUB_USERNAME/YOUR_GITHUB_REPO_NAME.git (fetch)
  origin	https://github.com/YOUR_GITHUB_USERNAME/YOUR_GITHUB_REPO_NAME.git (push)
  ```

## Prepare Your App for Deploy

1. In the Terminal, from your project's root directory, create a `Procfile`. "Procfile" should have a capital "P", it should not have an extension, and it should be in the same folder as your main server file (usually `server.js`).

  ```zsh
  ➜  touch Procfile
  ```

2. Also in the Terminal, from your project's root directory, run:

  ```
  ➜  echo 'web: npm start' >> Procfile
  ```

3. Open your project in Sublime. In your `server.js` file, where you start your server, change the `port` argument in your `app.listen` function so that it looks for a `proccess.env.PORT` environment variable first.

  ```js
  /*
   * server.js
   */

  app.listen(process.env.PORT || 3000);
  ```

4. Check your `package.json` to make sure all your dependencies are present. If something is missing, install it. For example, run the following if you're using `express` and `body-parser` but don't have them listed under `"dependencies"`:

  ```zsh
  ➜  npm install --save express body-parser
  ```

5. Now add a `start` script for your application in your `package.json`:

  ```js
  /*
   * package.json
   */

  {
    ...

    "scripts": {
      "start": "node server.js"
    },

    ...
  }
  ```

  This is assuming your main application file is called `server.js`. If your main file is called something else, adjust the script to use your file name.

## Add Heroku MongoLab

1. In the Terminal, from your project's root directory, add a Mongo database to your Heroku app:

  ```zsh
   ➜  heroku addons:create mongolab
  ```

  At this point, the terminal may ask you to enter a credit card number. Heroku charges for some services or if you go over certain data limits. With the tools you're using and the size of your project's database, everything should be free. Heroku requires you to add a card when you first set up your MongoLab link *just in case* you eventually go over the free plan limits. If you had to enter in a credit card, run the `heroku addons:create mongolab` command again.

2. Back in Sublime, add the following to the `mongoose.connect` method in `server.js`:

  ```js
  /*
   * server.js
   */

  mongoose.connect(
    process.env.MONGOLAB_URI ||
    process.env.MONGOHQ_URL ||
    'mongodb://localhost/YOUR_LOCAL_DATABASE_NAME'
  );
  ```

## Deploy to Heroku

1. You should be all set up now, so add and commit your changes, then push to Heroku:

  ```zsh
  ➜  git status
  ➜  git add -A
  ➜  git commit -m "ready for deploy"
  ➜  git push origin master
  ➜  git push heroku master
  ```

2. If all went well, you should be able to visit your live application by running:

  ```zsh
  ➜  heroku open
  ```

## Debugging

Hopefully your app works on Heroku, however, you may see a sad page that looks like this...

![heroku-application-error](https://cloud.githubusercontent.com/assets/7833470/10436335/9a97efce-70da-11e5-87ba-bdb4ae0c8596.png)

1. If this happens to you, check your Heroku logs in the Terminal:

  ```zsh
  ➜  heroku logs
  ```

2. Scan all of the logs for error messages. If you see obvious error messages, goole what they mean. If you still can't find a solution, now would be a good time to ask an instructor for help.

## Add Your API Keys

1. Set environment variables on Heroku:

  *Change MY_API_KEY to your variable name and your actual key*

  ```zsh
  ➜  heroku config:set MY_API_KEY=0932nv8d17vhd72o2e8cfv82csd9n1dcd98
  ```

2. Check that it worked:

  ```zsh
  ➜  heroku config
  MY_API_KEY: 0932nv8d17vhd72o2e8cfv82csd9n1dcd98
  ```

3. If you made a mistake and need to unset an API key:

  ```zsh
  ➜  heroku config:unset MY_API_KEY
  Unsetting MY_API_KEY and restarting myapp... done, v13
  ```

## Heroku Doc References

* <a href="https://devcenter.heroku.com/articles/getting-started-with-nodejs#introduction" target="_blank">Getting Started with Node.js on Heroku</a>
* <a href="https://devcenter.heroku.com/articles/mongolab" target="_blank">MongoLab</a>
