# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Deploying to Heroku with Rails & Postgres

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

1. Check your `Gemfile` to make sure you're using the `pg` gem:

  ```ruby
  #
  # Gemfile
  #

  gem 'pg'
  ```

2. Add the `rails_12factor` gem to your `Gemfile` in the production group:

  ```ruby
  #
  # Gemfile
  #

  group :production do
    gem 'rails_12factor'
  end
  ```

3. Run this command in your Terminal to bundle install locally:

  ```zsh
  ➜  bundle install --without production
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

  Your Terminal output should look something like this (but a little longer):

  ```zsh
  Initializing repository, done.
  Counting objects: 64, done.
  Delta compression using up to 4 threads.
  Compressing objects: 100% (53/53), done.
  Writing objects: 100% (64/64), 14.57 KiB | 0 bytes/s, done.
  Total 64 (delta 5), reused 0 (delta 0)

  -----> Ruby app detected
  -----> Compiling Ruby/Rails
  -----> Using Ruby version: ruby-2.0.0
  -----> Installing dependencies using 1.5.2
         New app detected loading default bundler cache
         Running: bundle install --without development:test --path vendor/bundle --binstubs vendor/bundle/bin -j4 --deployment
         Fetching gem metadata from https://rubygems.org/..........
         Fetching additional metadata from https://rubygems.org/..
         Using i18n (0.6.9)
         .
         .
         .
         Installing sass-rails (4.0.3)
         Installing rails (4.0.4)
         Your bundle is complete!
         Gems in the groups development and test were not installed.
         It was installed into ./vendor/bundle
         Bundle completed (11.82s)
         Cleaning up the bundler cache.
  -----> Writing config/database.yml to read from DATABASE_URL
  -----> Preparing app for Rails asset pipeline
         Running: rake assets:precompile
         I, [2014-05-02T18:02:09.672047 #732]  INFO -- : Writing /tmp/build_625a98e6-1b9e-4e57-ba48-8f9cd7bf7d18/public/assets/application-c8d048bf2b32f85ef4807549fa44b21b.js
         I, [2014-05-02T18:02:09.694428 #732]  INFO -- : Writing /tmp/build_625a98e6-1b9e-4e57-ba48-8f9cd7bf7d18/public/assets/application-d0b54dd563966c42aad5fd85b1c1f713.css
         Asset precompilation completed (6.52s)
         Cleaning assets
         Running: rake assets:clean
  -----> WARNINGS:
         Include 'rails_12factor' gem to enable all platform features
         See https://devcenter.heroku.com/articles/rails-integration-gems for more information.

  -----> Compressing... done, 21.4MB
  -----> Launching... done, v6
         http://thingsthingsthings.herokuapp.com/ deployed to Heroku

  To git.heroku.com/YOUR_APP_NAME.git
   * [new branch]      master -> master
  ```

2. **This is a common point for people to run into errors.** The most common error that happens here is your assets failing to compile. **If you have errors, try this possible solution:**

  * From the Terminal, precompile your assets:

    ```zsh
    ➜  rake assets:precompile
    ```

  * Add and commit new changes, then try pushing to Heroku again:

    ```zsh
    ➜  git status
    ➜  git add -A
    ➜  git commit -m "precompiling assets"
    ➜  git push origin master
    ➜  git push heroku master
    ```

3. Your deployed app has a separate database from your development environment. To set up your Heroku database, run your migrations in production:

  ```zsh
  ➜  heroku run rake db:migrate
  ```

4. If all went well, you should be able to visit your live application by running:

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

<!-- 1. If you haven't added your API keys locally, first read <a href="#" target="_blank">these instructions</a>.
@TODO: Create "how to" for dotenv-rails gem and link to it here -->

2. Set environment variables on Heroku:

  *Change `MY_API_KEY` to your variable name and your actual key*

  ```zsh
  ➜  heroku config:set MY_API_KEY=0932nv8d17vhd72o2e8cfv82csd9n1dcd98
  ```

3. Check that it worked:

  ```zsh
  ➜  heroku config
  MY_API_KEY: 0932nv8d17vhd72o2e8cfv82csd9n1dcd98
  ```

4. If you made a mistake and need to unset an API key:

  ```zsh
  ➜  heroku config:unset MY_API_KEY
  Unsetting MY_API_KEY and restarting myapp... done, v13
  ```

## Heroku Doc References

**Basic Heroku Rails, PostgreSQL Setup:**

* <a href="https://devcenter.heroku.com/articles/rails4" target="_blank">Rails 4 on Heroku</a>
* <a href="https://devcenter.heroku.com/articles/heroku-postgresql" target="_blank">Heroku Postgres</a>
* <a href="https://devcenter.heroku.com/articles/rake" target="_blank">Running Rake Commands</a>

**Adding Collaborators on Heroku:**

* <a href="https://devcenter.heroku.com/articles/sharing" target="_blank">Collaborating with Other Developers on Your App</a>

**Adding a Git Remote:**

Your Heroku collaborators should add the project's Heroku remote to their local git repositories.

*  <a href="https://help.github.com/articles/adding-a-remote/" target="_blank">Adding a remote (GitHub Help)</a>
