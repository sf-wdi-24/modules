# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Sending Emails with Action Mailer & SendGrid

This tutorial builds off the starter code in the <a href="https://github.com/sf-wdi-24/rails_welcome_email" target="_blank">rails_welcome_email</a> repo. You can find the solution in the <a href="https://github.com/sf-wdi-24/rails_welcome_email/tree/email" target="_blank">email branch</a>.

## Sending Emails in Development

1. You can use Gmail along with the Rails Action Mailer to send emails in development. Before setting up Action Mailer, create a new Gmail account for your app, e.g. "your_app_name@gmail.com". Keep the username and password handy, since you'll need it for the Action Mailer configuration. DON'T enable two-factor authentication or any extra security settings for this new Gmail account.

2. Add the following code to `config/environments/development.rb` to configure Action Mailer to send emails from the new Gmail account you just created:

  ```ruby
  #
  # config/environments/development.rb
  Rails.application.configure do

    ...

    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default_url_options = { host: 'localhost:3000' }

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      user_name: 'your_gmail_username',
      password: 'your_gmail_password',
      domain: 'gmail.com',
      address: 'smtp.gmail.com',
      port: 587,
      authentication: :plain,
      enable_starttls_auto: true
    }

    ...

  end
  ```

  At this point, it's a good idea to store "your_gmail_username" and "your_gmail_password" in environment variables to make sure they are hidden from git. Use the <a href="https://github.com/bkeepers/dotenv" target="_blank">dotenv-rails</a> gem to set up an `.env` file to hide secret keys.

3. Now you're ready to create your first mailer! Run this command in the Terminal:

  ```zsh
  ➜  rails g mailer UserMailer
  ```

4. You'll use the mailer class `UserMailer` to define methods that send emails related to the `User` model. By default, all mailer classes inherit from `ApplicationMailer`, so you can set defaults in `ApplicationMailer` that will apply to every email sent:

  ```ruby
  #
  # app/mailers/application_mailer.rb
  #
  class ApplicationMailer < ActionMailer::Base
    default from: "your_app_name@gmail.com"
    layout "mailer"
  end
  ```

5. Next define a `welcome` method inside `UserMailer` to send an email to a user after they sign up for your site:

  ```ruby
  #
  # app/mailers/user_mailer.rb
  #
  class UserMailer < ApplicationMailer

    def welcome(user)
      @user = user
      mail( to: @user.email, subject: "Thanks for signing up!" )
    end

  end
  ```

  Note the instance variable `@user`. Just like passing instance variables from controller methods to views, you can pass instance variables from mailer methods to email templates!

6. Now that you set up the `welcome` method, create an email template called `welcome` inside `app/views/user_mailer` that contains the following code:

  ```html
  <!-- app/views/user_mailer/welcome.html.erb -->

  <h1>Thanks for signing up, <%= @user.email %>!</h1>
  <p>Thanks for joining and have a great day! Now sign in and do awesome things!</p>
  ```

  Just like the views in your application, your email templates also have a layout file with boilerplate HTML. The default layout for emails is `app/views/layouts/mailer.html.erb`.

7. The last step is to trigger the email to send from inside your application. If you want users to receive the welcome email after they sign up, deliver the email once the new `@user` saves to the database:

  ```ruby
  #
  # app/controllers/users_controller.rb
  #
  class UsersController < ApplicationController
    ...

    def create
      ...

      @user = User.new(user_params)
      if @user.save
        # send the welcome email
        UserMailer.welcome(@user).deliver_now
        # do some other self
      else
        # ERROR!!!
      end
    end

    ...

  end
  ```

8. At this point, verify that when a new user signs up on `localhost:3000`, they get the welcome email. (You'll need to sign up with a real email address that you have access to in order to test this.)

## Sending Emails in Production

1. To send emails in production, you need to configure your Action Mailer settings to use a more robust email provider. Gmail is great for testing locally, but it is not meant for sending thousands of emails to your many users. SendGrid offers a free Heroku add-on for up to 12,000 emails per month.

  If your app is not already up on Heroku, go ahead and [deploy it](./../heroku-rails-postgres) now.

2. After depolying your app, create the SendGrid add-on from the Terminal:

  ```zsh
  ➜  heroku addons:create sendgrid:starter
  ```

  Running that command creates a new account for you on SendGrid using your Heroku credentials. It also sets the environment variables `SENDGRID_USERNAME` and `SENDGRID_PASSWORD` for you on Heroku.

3. The last step is to configure Action Mailer to use SendGrid in production. Add this code to `config/environments/production.rb`:

  ```ruby
  #
  # config/environments/production.rb
  #
  Rails.application.configure do

    ...

    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default_url_options = { host: 'your_app_name.herokuapp.com' }

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      user_name: ENV['SENDGRID_USERNAME'],
      password: ENV['SENDGRID_PASSWORD'],
      domain: 'heroku.com',
      address: 'smtp.sendgrid.net',
      port: 587,
      authentication: :plain,
      enable_starttls_auto: true
    }

    ...

  end
  ```

4. Add and commit your changes, then push to Heroku again. At this point, you should be able to sign up on your deployed site and receive the welcome email. (Remember to test it with a real email address!) Note that SendGrid's servers may take up to several minutes to dispatch the email. It most likely will not be as fast as Gmail in development - be patient!

## Resources

#### Action Mailer

* <a href="http://guides.rubyonrails.org/action_mailer_basics.html" target="_blank">RailsGuides - Action Mailer Basics</a>
* <a href="https://howilearnedrails.wordpress.com/2014/02/25/setting-up-email-in-a-rails-4-app-with-action-mailer-in-development-and-sendgrid-in-production-using-heroku" target="_blank">Setting Up Email in a Rails 4</a>

#### SendGrid

* <a href="https://devcenter.heroku.com/articles/sendgrid" target="_blank">Heroku - SendGrid</a>
* <a href="https://sendgrid.com/docs/Integrate/Frameworks/rubyonrails.html" target="_blank">SendGrid - Ruby on Rails</a>

#### Email Templates

* <a href="http://webdesign.tutsplus.com/articles/build-an-html-email-template-from-scratch--webdesign-12770" target="_blank">Build an HTML Email Template From Scratch</a>
* <a href="https://www.campaignmonitor.com/css" target="_blank">Campaign Monitor - The Ultimate Guide to CSS</a>
* <a href="http://foundation.zurb.com/emails.html" target="_blank">Foundation for Emails</a>
