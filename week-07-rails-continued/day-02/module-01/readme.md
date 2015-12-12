# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Rails Auth

# Rails Auth: Sign Up

| Objectives |
| :--- |
| Implement a User model that securely stores passwords. |
| Build routes, controllers, and views necessary for a user to sign up. |
| Add a `current_user` application-level helper method to keep track of the currently signed in user. |

## Devise

<img src="https://cloud.githubusercontent.com/assets/1329385/11758689/15df1a8c-a023-11e5-9e59-065e5bb5dd23.gif">

I get it, some of you have heard of <a href="https://github.com/plataformatec/devise" target="_blank">Devise</a>. That's cool and all but they recommend that if you're new to rails:

> If you are building your first Rails application, we recommend you do not use Devise. Devise requires a good understanding of the Rails Framework. In such cases, we advise you to start a simple authentication system from scratch. ... <a href="https://github.com/plataformatec/devise#starting-with-rails" target="_blank">[docs]</a>

Today we're going to try and implement all this fantastic stuff from "scratch".

## Challenges

#### App Set Up

1. Create a new rails app called `rails_auth`. Your app should not have the default rails test framework and have a Postgres database (**Hint:** `-T -d postgresql`). Once your app is created, remember to run `rake db:create` to create your database.

#### Model Set Up

2. Generate a `User` model with the attributes `email` and `password_digest`:

  ```
  rails g model User email password_digest
  ```

  **Note:** `string` is the default attribute type, so we don't need to explicitly specify it. `email` serves as a natural username for our users, and `password_digest` attribute for a hashed password.

3. From the terminal, `rake db:migrate` to run your migration (which creates the user table in your database).

4. Open up your app in Sublime, and navigate to your `User` model. Add `has_secure_password` to the model. This line of code gives our `User` model authentication methods via `bcrypt`.

  ```ruby
  #
  # app/models/user.rb
  #
  class User < ActiveRecord::Base
    has_secure_password
  end

  # Here's the behavior that has_secure_password gives you
  # Schema: User(name:string, password_digest:string)
  # user = User.new(name: 'david', password: '', password_confirmation: 'nomatch')
  # user.save                                                       # => false, password required
  # (omit a password_confirmation column to disable this behavior)
  # user.password = 'mUc3m00RsqyRe'
  # user.save                                                       # => false, confirmation doesn't match
  # user.password_confirmation = 'mUc3m00RsqyRe'
  # user.save                                                       # => true
  # user.authenticate('notright')                                   # => false
  # user.authenticate('mUc3m00RsqyRe')                              # => user
  # User.find_by(name: 'david').try(:authenticate, 'notright')      # => false
  # User.find_by(name: 'david').try(:authenticate, 'mUc3m00RsqyRe') # => user
  ```

#### Secure Password with BCrypt

5. Open up your app in Sublime, and open the `Gemfile`. Uncomment the `bcrypt` gem (near the bottom of the file). We need `bcrypt` to enable the `has_secure_password` functionality.

  ```ruby
  #
  # Gemfile
  #
  # Use ActiveModel has_secure_password
  gem 'bcrypt'
  ```

6. From the terminal, run `bundle install` (or `bundle` for short) to install `bcrypt`.

#### Sign Up Routes

7. Add a root route that points to `"site#index"` and create an `index.html.erb` template in your `views/site` folder.

8. Even though we are doing Auth, we want our routes to conform to a RESTful convention, so `users#new` will be our GET signup tempalte, `users#create` is our POST signup route, and `users#show` will be our user profile page. Add `resources :users` to `routes.rb` with the actions ONLY `new`, `create`, and `show`. Run `rake routes` in the terminal to see all your routes.

#### Site Controller & Homepage View

9. Start your server and visit `localhost:3000` in the browser. Start debugging errors until the view rendered on the `root_path` has:
  * A welcome message
  * A button (remember: `link_to`) that leads to the route `"/users/new"`

  **Note:** Typically controllers are always plural, i.e. `UsersController`. In the case of our `SiteController`, it's ok for it to be singular since it only contains logic related to static pages and is not interacting with any resources in our database.

#### Users Controller

10. Create a `UsersController`:

  ```
  $ rails g controller users new create show
  ```

11. Open up your `UsersController`. At the bottom of the file, add a private method called `user_params` that creates strong parameters by whitelisting specific user attributes.

  ```ruby
  #
  # app/controllers/users_controller.rb
  #
  class UsersController < ApplicationController

    def new
    end

    def create
    end

    def show
    end

    private
      def user_params
        params.require(:user).permit(:email, :password)
      end

  end
  ```

  **Note:** Private methods are only accessible in the controller they are defined in - they can't be accessed from anywhere else in our application. Using a private method for `user_params` DRYs up our code, since we need this logic in multiple controller methods (`create`, and down the line, `update`).

#### User Flow for Sign Up

12. The `users#new` action should render a view called `new.html.erb`. The view should have a form that posts to `users#create` with the parameters `email` and `password`. Because `password` is not an attribute of your User model, if you try to use a standard `form_for @user` pattern, rails will bork, so your form should look something like this:

  ```erb
  <!-- app/views/users/new.html.erb -->

  <%= form_for :user, url: '/users' do |f| %>
    <%= f.email_field :email, placeholder: "Email", autofocus: true %>
    <%= f.password_field :password, placeholder: "Password" %>
    <%= f.submit "Sign Up" %>
  <% end %>

  ```

  **Stretch Challenge:** Can you do this in a modal in the `site#index`? Would you need your `users#new` route or action any more?

14. In the `users#create` action, create a user, then log them in by creating a new session. After the user is successfully created and the session is set, redirect to the user show page.

  ```ruby
  #
  # app/controllers/users_controller.rb
  #
  class UsersController < ApplicationController

    ...

    def create
      user = User.create(user_params)
      session[:user_id] = user.id

      # redirect_to "/users/#{user.id}"
      # the line above can be refactored to use rails route helpers:
      redirect_to user_path(user)
    end

    ...

  end
  ```

  **Stretch Challenge:** Create a condition that checks if the user was saved correctly.

  **Hint:** first build the user in memory with `User.new(user_params)`, then check `if user.save` proceed as normal `else` redirect to `"/users/new"` again. Run `rails g scaffold user email password` in a SEPARATE SAMPLE PROJECT for an example.

15. The last step is to display attributes for the currently logged in user on the user show page. To do this, update the `users#show` method in the controller find a user in the database using the current `session[:user_id]`.

  ```ruby
  #
  # app/controllers/users_controller.rb
  #
  class UsersController < ApplicationController

    ...

    def show
      @user = User.find(session[:user_id])
    end

    ...

  end
  ```

16. Now, we want to display data for the currently logged-in user in the view:

  ```erb
  <!-- app/views/users/show.html.erb -->

  Welcome, <%= @user.email %>!
  ```

1. Lastly, add a `current_user` method at the application level and then try to use it in your splash page.

  ```ruby
    #  app/controllers/application_controller.rb

    class ApplicationController < ActionController::Base
      protect_from_forgery with: :exception

      def current_user
        @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
      end

      helper_method :current_user  #makes the current_user method available to views
    end
  ```

  ```erb
  <!-- splash.html.erb -->
  
  Welcome <%= current_user %>
  ```

## Stretch Challenges

1. Create a logout action and allow users to logout. What do you have to do to the `session[:user_id]`? Where do you `redirect_to` after they log out.
1. Create a login page at `sessions#new`. Use the `@user.authenticate` method from `has_secure_password` to create a `sessions#create` action. (Hint, you'll need a `SessionsController`)

1. Create another resource that the user has_many of called `posts`. Have the logged in user be able to create new posts that belong to them.

1. Add <a href="http://guides.rubyonrails.org/active_record_validations.html" target="_blank">validations</a> to your `User` model.
  * Validate the <a href="http://guides.rubyonrails.org/active_record_validations.html#presence" target="_blank">presence</a> of `email` and `password`.
  * Validate the <a href="http://guides.rubyonrails.org/active_record_validations.html#format" target="_blank">format</a> and <a href="http://guides.rubyonrails.org/active_record_validations.html#uniqueness" target="_blank">uniqueness</a> of `email`.
  * Validate that the `password` is <a href="http://guides.rubyonrails.org/active_record_validations.html#length" target="_blank">at least 6 characters long</a>.

2. Add a `password_confirmation` field to your signup form and strong parameters in your `users_controller.rb`. Adding the field requires the user to enter their password twice in order to sign up. Read more about it in the <a href="http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password" target="_blank">`has_secure_password` docs</a>. You will also need to edit your private method `user_params` in the `UsersController` to permit `password_confirmation`.

3. Add a <a href="http://api.rubyonrails.org/classes/ActionDispatch/Flash.html" target="_blank">flash message</a> that notifies a user if they signed up successfully or not. **Hint:** In your `users#create` action, display a `flash[:notice]` if the user signed up successfully, or a `flash[:error]` if the user failed validations and didn't save to the database. You will also need a way to display your flash messages in the view:

  ```erb
  <!-- app/views/layouts/application.html.erb -->

  <!-- creates a div for each flash message and gives it a class matching the flash's name (notice, error, etc.) -->
  <% flash.each do |name, msg| %>
    <%= content_tag :div, msg, class: name %>
  <% end %>
  ```

  Here's an <a href="https://gist.github.com/suryart/7418454" target="_blank">example</a> of how to render flash messages with the help of Bootstrap's classes.

4. Refactor your `flash[:error]` to display the error messages from the failed validations if a user doesn't save to the database. **Hint:** Try <a href="http://ruby-doc.org/core-2.2.0/Array.html#method-i-join" target="_blank">joining</a> the <a href="http://api.rubyonrails.org/classes/ActiveModel/Errors.html#method-i-full_messages" target="_blank">`full_messages`</a>.

1. Follow <a href="http://railscasts.com/episodes/274-remember-me-reset-password" target="_blank">this example</a> to add "remember me" and reset password functionality to your app:

5. Implement `edit` and `update` actions for your user.

## Docs & Resources

* <a href="http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password" target="_blank">`has_secure_password`</a>
* <a href="http://guides.rubyonrails.org/active_record_validations.html" target="_blank">ActiveRecord Validations</a>
