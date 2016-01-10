# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Background Jobs with Delayed Job

To practice setting up background jobs with Delayed Job, clone the starter code in <a href="https://github.com/sf-wdi-24/rails_background_jobs">rails_background_jobs</a>. You can see a working solution on the <a href="https://github.com/sf-wdi-24/rails_background_jobs/tree/delayed_job">delayed_job branch</a>.

## Delayed Job Setup

You should follow the <a href="https://github.com/collectiveidea/delayed_job">Delayed Job docs</a> to get set up. Here is a summary of the setup steps:

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

  You can also create <a href="https://github.com/collectiveidea/delayed_job#custom-jobs">custom jobs</a> to customize the behavior of your background jobs.

## Running Jobs Locally

In a new Terminal tab, run `rake jobs:work` to run your background jobs. Keep this Terminal tab open as you develop your application. The Terminal output will show when jobs are added to the queue, when jobs run successfully, and when they fail.

## Running Jobs on Heroku

After deploying your app to Heroku, if you're using the `delayed_job_active_record` gem, you'll automatically get one `worker`. The `worker` is dedicated to processing the background jobs in the queue, so your jobs won't tie up the web processes in your application.

To start your `worker` and begin processing jobs, run `heroku ps:scale worker=1` in the Terminal. You can view the `worker`'s output by filtering the Heroku logs with the `-p` flag: `heroku logs -p worker -t`.

## Resources

#### Delayed Job

* <a href="https://github.com/collectiveidea/delayed_job">Delayed Job Docs</a>
* <a href="https://devcenter.heroku.com/articles/delayed-job">Delayed Job - Heroku</a>
* <a href="http://www.sitepoint.com/delayed-jobs-best-practices">Delayed Job Best Practices</a>

#### Resque

* <a href="https://github.com/resque/resque">Resque Docs</a>
* <a href="http://tutorials.jumpstartlab.com/topics/performance/background_jobs.html">Background Jobs with Resque - JumpstartLab Tutorial</a>
* <a href="https://devcenter.heroku.com/articles/queuing-ruby-resque">Queuing in Ruby with Redis and Resque - Heroku</a>
