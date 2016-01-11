# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Background Jobs with Delayed Job

## Why Use Background Jobs

Not every request in a web application needs to be processed right away. Especially in Rails, where requests are synchronous, it's important to prioritize requests where the user *needs* a response immediately. Actions like signing up, logging in, and creating any resource the user immediately interacts with need to happen as soon as the user sends the request.

However, actions like sending an email or "liking" a post or comment can afford to be delayed. It's normal to receive a welcome email several minutes after signing up for a website. For actions such as "liking" or "favoriting", we can "fake" a response on the front-end by changing the state of the DOM. That "like" or "favorite" doesn't need to be persistent in the database until the next time the user visits that page.

For any request that can afford to be delayed, we can use **background jobs** to add the action to a "queue" of actions that need to be processed at some point in the near future (usually several seconds to several minutes from the time the user makes the request). In production, this "queue" has dedicated memory on the server, meaning the jobs don't tie up memory needed for those immediate, synchronous requests in our application.

## Queue Systems

This tutorial focuses on using <a href="https://github.com/collectiveidea/delayed_job" target="_blank">Delayed Job</a> for background job queuing, but there are other technologies that do this as well. Delayed Job is very compatible with Active Record and Postgres, storing the queue of jobs that need processing directly in your Postgres database. This has the advantage of integrating seamlessly with your Rails app, but it's important to watch out for database overload (see these <a href="http://www.sitepoint.com/delayed-jobs-best-practices" target="_blank">best practices</a>).

Another option for background job queuing is <a href="https://github.com/resque/resque" target="_blank">Resque</a>, which takes advantage of the NoSQL key-value store <a href="http://redis.io" target="_blank">Redis</a> to queue background jobs. Resque requires a little more setup locally and in production, but it has the advantage of not affecting your database load.

## Delayed Job Setup

To practice setting up background jobs with Delayed Job, clone the starter code in <a href="https://github.com/sf-wdi-24/rails_background_jobs" target="_blank">rails_background_jobs</a>. You can see a working solution on the <a href="https://github.com/sf-wdi-24/rails_background_jobs/tree/delayed_job" target="_blank">delayed_job branch</a>.

You should follow the <a href="https://github.com/collectiveidea/delayed_job" target="_blank">Delayed Job docs</a> to get set up. Here is a summary of the setup steps:

1. Add `delayed_job_active_record` to your `Gemfile`:

  ```ruby
  #
  # Gemfile
  #
  gem 'delayed_job_active_record'
  ```

2. Run `bundle install`, and restart your server.

3. Run the following commands in the Terminal to create the jobs table:

  ```zsh
  ➜  rails g delayed_job:active_record
  ➜  rake db:migrate
  ```

4. Set the `queue_adapter` in `config/application.rb`:

  ```ruby
  #
  # config/application.rb
  #
  config.active_job.queue_adapter = :delayed_job
  ```

## Queuing Jobs

There are two main ways to add jobs to the queue:

1. Call `.delay.method(params)` on any object and it will be processed in the background:

  ```ruby
  # without delayed_job
  @user.activate!(user_params)

  # with delayed_job
  @user.delay.activate!(user_params)
  ```

2. If a method should always be run in the background, you can call `handle_asynchronously` after the method declaration:

  ```ruby
  class User
    def activate!(params)
      # long running method
    end
    handle_asynchronously :activate!
  end

  # calling the method stays the same:
  @user = User.new
  @user.activate!(user_params)
  ```

  You can also create <a href="https://github.com/collectiveidea/delayed_job#custom-jobs" target="_blank">custom jobs</a> to customize the behavior of your background jobs.

  Additionally, Delayed Job integrates with the Rails built-in `ActionMailer` class. See the <a href="http://guides.rubyonrails.org/action_mailer_basics.html#calling-the-mailer" target="_blank">Action Mailer docs</a> to learn about how to send emails in a background job.

## Running Jobs Locally

In a new Terminal tab, run `rake jobs:work` to run your background jobs. Keep this Terminal tab open as you develop your application. The Terminal output will show when jobs are added to the queue, when jobs run successfully, and when they fail.

## Running Jobs on Heroku

After deploying your app to Heroku, if you're using the `delayed_job_active_record` gem, you'll automatically get one `worker`. The `worker` is dedicated to processing the background jobs in the queue, so your jobs won't tie up the web processes in your application.

To start your `worker` and begin processing jobs, run `heroku ps:scale worker=1` in the Terminal. You can view the `worker`'s output by filtering the Heroku logs with the `-p` flag: `heroku logs -p worker -t`.

## Resources

#### Delayed Job

* <a href="https://github.com/collectiveidea/delayed_job" target="_blank">Delayed Job Docs</a>
* <a href="https://devcenter.heroku.com/articles/delayed-job" target="_blank">Delayed Job - Heroku</a>
* <a href="http://www.sitepoint.com/delayed-jobs-best-practices" target="_blank">Delayed Job Best Practices</a>

#### Resque

* <a href="https://github.com/resque/resque" target="_blank">Resque Docs</a>
* <a href="http://tutorials.jumpstartlab.com/topics/performance/background_jobs.html" target="_blank">Background Jobs with Resque - JumpstartLab Tutorial</a>
* <a href="https://devcenter.heroku.com/articles/queuing-ruby-resque" target="_blank">Queuing in Ruby with Redis and Resque - Heroku</a>
