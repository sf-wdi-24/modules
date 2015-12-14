# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Testing with RSpec


| Objectives |
| :---- |
| Identify various aspects of Rails apps that we might want to test.|
| Test model methods using rspec-rails. |
| Test controller actions using rspec-rails. |


## rspec-rails

Rspec is a testing gem for Ruby. It helps us write tests that sound like user stories or planning comments ("This method should..."). <a href"https://github.com/rspec/rspec-rails" target="_blank">rspec-rails</a> is a testing framework specifically for Rails. We'll use rspec-rails to test our models and controllers.

<!-- rspec-rails helps us implement the four-phase testing methodology (with setup, exercise, verify, and tear down steps). Here's what a simple rspec-rails test might look like:

```ruby
#
# spec/models/pet_spec.rb
#

RSpec.describe Pet, type: :model do

  # setup
  before do
    @pet = Pet.create({name: "Morocco", age: 3})
  end

  describe "#is_cute?" do
    it "returns true" do
      expect(@pet.is_cute?).to be true   #exercise and verify   
    end
  end

  # teardown is automatic

end
``` -->

### Adding rspec-rails to Your Project

1. Add rspec-rails to your Gemfile in the `development` and `test` groups:

  ```ruby
  #
  # Gemfile
  #
   group :development, :test do
     gem 'rspec-rails'
   end
  ```

1. Run `bundle install` (or `bundle` for short) in your terminal so that rspec-rails is actually added to your project.

1. Add tests to your rails project using the terminal:

  ```bash
  $ rails g rspec:install
  ```

  This creates a `spec` directory. It also adds `spec/spec_helper.rb` and `.rspec` files that are used for configuration. See those files for more information.

1. Configure your specs by going into the `.rspec` file and removing the line that says `--warnings` if there is one.

1. If you created models before adding rspec-rails, create a spec file for each of your models. (This is only necessary if you had a model created before you installed rspec-rails.)

  ```bash
  $ rails g rspec:model MODEL_NAME
  ```

### Running rspec-rails Tests

Typical spec folders and files for a Rails project include:

* `spec/models/user_spec.rb`
* `spec/controllers/users_controller_spec.rb`
* `spec/views/user/show.html.erb_spec.rb`

To run **all** test specs, go to the terminal and type `rspec` or `bundle exec rspec`.

To run only a specific set of tests, type `rspec` and the file path for the tests you want to run in the terminal:

  ```bash
  # run only model specs
  rspec spec/models

  # run only specs for `ArticlesController`
  rspec spec/controllers/articles_controller_spec.rb
  ```

  Run `rspec` from the terminal now to check that your install worked.

## Writing rspec-rails Tests
<!--
### Cool Tool: FFaker

FFaker generates random data for us! We can use it to create fake data for tests. For example, `FFaker::Name.first_name` generates a fake first name. `FFaker::Internet.email` generates a fake email. To see more that FFaker can do, check out the [FFaker docs](http://www.rubydoc.info/github/emmanueloga/ffaker/FFaker) and/or this [handy FFaker cheatsheet](http://ricostacruz.com/cheatsheets/ffaker.html).

**Bonus:** Later, we can use FFaker to seed our database (but hold off!).

  ```ruby
  #
  # db/seeds.rb
  #

  25.times do
    Student.create(
      first_name: FFaker::Name.first_name,
      last_name: FFaker::Name.last_name,
      grade: rand(9..12),
      yearbook_quote: FFaker::HipsterIpsum.sentence(5)
    )
  end
  ```

  ```bash
  $ rake db:seed
  ```

To add FFaker to your project, put it in your Gemfile for the development and test groups:

  ```ruby
  #
  # Gemfile
  #
  group :development, :test do
    gem 'ffaker'
  end
  ```

Then run `bundle` in your terminal. -->

### Testing Models

We can set up a `@user` for testing purposes with `User.create`. Wrapping this in `before do` makes a `@user` object available to the tests:

  ```ruby
  #
  # spec/models/user_spec.rb
  #
  require 'rails_helper'
  RSpec.describe User, type: :model do

    before do
      user_params = Hash.new
      user_params[:first_name] = FFaker::Name.first_name
      user_params[:last_name] = FFaker::Name.last_name
      user_params[:email] = FFaker::Internet.email
      user_params[:password] = FFaker::Lorem.words(2).join
      user_params[:password_confirmation] = user_params[:password]
      @user = User.create(user_params)
    end

  end
  ```

Assuming we've already set a `@user` variable with first and last names, we can then test that the `full_name` method correctly calculates the full name:

  ```ruby
  #
  # spec/models/user_spec.rb
  #
  require 'rails_helper'
  RSpec.describe User, type: :model do

    ...

    describe "#full_name" do
      it "joins first name and last name" do
        expect(@user.full_name).to eq("#{@user.first_name} #{@user.last_name}")
      end
    end

  end
  ```

### Testing Controllers

To test authentication, we need to define some `@current_user` before each of our tests run. The last line in this `before do` block --   `allow_any_instance_of(...` -- creates a "stub" (fake) `current_user` instance method for the ApplicationController and sets it up as a getter that only every returns the `@current_user` we made with ffaker.

  ```ruby
  #
  # spec/controllers/articles_controller_spec.rb
  #
  require 'rails_helper'
  RSpec.describe ArticlesController, type: :controller do

    before do
      user_params = Hash.new
      user_params[:first_name] = FFaker::Name.first_name
      user_params[:last_name] = FFaker::Name.last_name
      user_params[:email] = FFaker::Internet.email
      user_params[:password] = FFaker::Lorem.words(2).join
      user_params[:password_confirmation] = user_params[:password]
      @current_user = User.create(user_params)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@current_user)
    end

    describe "GET #index" do
      it "should assign @articles" do
        all_articles = Article.all
        get :index
        expect(assigns(:articles)).to eq(all_articles)
      end

      it "should render the :index view" do
        get :index
        expect(response).to render_template(:index)
      end
    end

    describe "GET #new" do
      it "should assign @article" do
        get :new
        expect(assigns(:article)).to be_instance_of(Article)
      end

      it "should render the :new view" do
        get :new
        expect(response).to render_template(:new)
      end
    end

    describe "POST #create" do
      context "success" do
        it "should add new article to current_user" do
          articles_count = @current_user.articles.count
          post :create, article: {title: "blah", content: "blah"}
          expect(@current_user.articles.count).to eq(articles_count + 1)
        end

        it "should redirect_to 'article_path' after successful create" do
          post :create, article: {title: "blah", content: "blah"}
          expect(response.status).to be(302)
          expect(response.location).to match(/\/articles\/\d+/)
        end
      end

      context "failure" do
        it "should redirect to 'new_article_path' when create fails" do
          # create blank article (assumes validations are set up in article model for presence of title and content)
          post :create, article: { title: nil, content: nil}
          expect(response).to redirect_to(new_article_path)
        end
      end
    end
  end
  ```

### Testing Views

We could use a tool like <a href="https://github.com/jnicklas/capybara" target="_blank">Capybara</a> to test client-side views and interactions (e.g. does clicking on "Logout" do what we expect?). We won't cover view testing today, though!

## Challenges


We'll build off a rails app with auth. Fork and clone the <a href="https://github.com/sf-wdi-24/rspec_testing_app" target="_blank">rspec_testing app</a>. You will need to add the FFaker gem to your project to complete these exercises.
