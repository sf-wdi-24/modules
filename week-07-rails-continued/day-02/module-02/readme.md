# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Validations &amp; Error-Handling

| Objectives |
|:--- |
| Discuss the importance of error-handling in web development. |
| Use Active Record to create validated database entries. |
| Display errors in the view using `flash` messages. |

## Error-Handling: Why does it matter?

Have you ever filled out a form on a website and hit submit, only to receive a `500` server error? Ever tried to register for something only to be told that your username has been taken, or your password doesn't contain enough or the right combination of characters? If so, then you've been on both sides of error-handling.

![image002](https://cloud.githubusercontent.com/assets/7833470/11665972/e333daa4-9d9e-11e5-866b-4e146f92671d.gif)

Error-handling is a critical part of web development. You can't always expect for your users to take the "Basic Path" (or the "Happy Path"). Users make mistakes, some people are malicious (SQL injection anyone?), and things generally go wrong. But with a little planning ahead, you can keep your users moving through the flow of your application with minimal confusion and frustration.

### Error Messages

Without **good** error messages, you have user experiences like this:

![heroku_err](https://cloud.githubusercontent.com/assets/7833470/11666054/50c8dede-9d9f-11e5-8484-7f547b224638.png)

Which tends to leave you feeling like this:

![uncivil_response](https://cloud.githubusercontent.com/assets/7833470/11666081/75a502f0-9d9f-11e5-9d51-3c71a5bc3dcf.gif)

You've seen different error-handling strategies already - you can validate data on the client-side with a library like <a href="http://jqueryvalidation.org" target="_blank">jQuery Validate</a>, or you can validate data on the server-side with model validations.

**The best error-handling strategy is a combination of both client-side and server-side validations.** Client-side validations ensure a good user experience by providing real-time, inline feedback on the user input. Server-side validations are **essential** for maintaining database ingreity, especially if the client-side validations are ever compromised (e.g. users "hacking" or chaning the DOM, slow internet connection preventing JavaScript from loading, etc.)

Today we'll be focusing on server-side validations in Rails, using <a href="http://guides.rubyonrails.org/active_record_validations.html" target="_blank">Active Record Validations</a>.

## Model Validations

Validations provide security against invalid or harmful data entering into the database. Active Record provides a convenient and easy set of built-in methods for validating model attributes, as well as the ability to define custom validator methods. An example of a built-in validation:

```ruby
#
# app/models/airplane.rb
#

class Airplane < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { minimum: 6 }
end
```

This snippet of code is calling the `validate` method, and accepting two arguments, an attribute from a model, and a hash of configurations: `{ presence: true, uniqueness: true, length: { minimum: 6 }`.

If you try adding a new airplane to the database witout a name, or with a duplicate name, or with a name with fewer than 6 characters, you'll get an error:

```zsh
irb(main):001:0> Airplane.create(name: "747")
  (0.2ms)  BEGIN
  Airplane Exists (1.1ms)  SELECT  1 AS one FROM "airplanes" WHERE "airplanes"."name" = '747' LIMIT 1
  (0.2ms)  ROLLBACK
=> #<Airplane id: nil, name: "747", description: nil, created_at: nil, updated_at: nil>
```

Instead of calling `.create` to add a new airplane to the database, you can call `.new` to store a new airplane instance in memory without saving it to the database. The advantage of `.new` is that you can check for errors before actually saving a record to the database (`.save`):

```zsh
irb(main):001:0> airplane = Airplane.new(name: "747")
=> #<Airplane id: nil, name: "747", description: nil, created_at: nil, updated_at: nil>
irb(main):002:0> airplane.valid?
  Airplane Exists (0.8ms)  SELECT  1 AS one FROM "airplanes" WHERE "airplanes"."name" = '747' LIMIT 1
=> false
irb(main):003:0> airplane.errors.full_messages
=> ["Name is too short (minimum is 6 characters)"]
```

The <a href="http://edgeguides.rubyonrails.org/active_record_validations.html#valid-questionmark-and-invalid-questionmark" target="_blank">.valid?</a> method returns `true` if the new record passes the model validations and `false` if it fails any validations. The <a href="http://edgeguides.rubyonrails.org/active_record_validations.html#errors-add" target="_blank">.errors.full_messages</a> method returns an array of user-friendly error messages, which is very useful for error-handling!

Right now, our error-handling is happening in the Rails console. Next we'll look at how we can incorporate this logic in our controllers and views to display the error messages to the user.

## Handling Errors in Controllers

The `airplanes#create` controller method currently looks like this:

```ruby
#
# app/controllers/airplanes_controller.rb
#

class AirplanesController < ApplicationController

  def create
    airplane_params = params.require(:airplane).permit(:name, :description)
    airplane = airplane.create(airplane_params)
    redirect_to airplane_path(airplane)
  end

end
```

If a user tried to add an invalid airplane to the database, they would get a server error:

![heroku_err](https://cloud.githubusercontent.com/assets/7833470/11666054/50c8dede-9d9f-11e5-8484-7f547b224638.png)

We should refactor `airplanes#create` to use `.new` and `.save` instead, so we can better handle the error:

```ruby
#
# app/controllers/airplanes_controller.rb
#

class AirplanesController < ApplicationController

  def create
    airplane_params = params.require(:airplane).permit(:name, :description)
    airplane = airplane.new(airplane_params)
    if airplane.save
      redirect_to airplane_path(airplane)
    else
      redirect_to new_airplane_path
    end  
  end

end
```

After the refactor, if a user tries to add an invalid airplane, they get redirected to `airplanes_new_path` (the form to create a new airplane) so they can try again. The last piece of the error-handling userflow is to use flash messages to display errors to the user.

## Flash Messages

Unlike Express, Rails comes with <a href="http://api.rubyonrails.org/classes/ActionDispatch/Flash.html" target="_blank">built-in flash messages</a>! If you want to send a flash message, you need to set the flash in the controller, and render the flash in the view.

`flash` is a hash of key/value pairs. The most common keys for `flash` are `:notice` for general information and/or success messages and `:error` for error messages.

We can implement `flash[:error]` in our `airplanes#create` controller method like this:

```ruby
#
# app/controllers/airplanes_controller.rb
#

class AirplanesController < ApplicationController

  def create
    airplane_params = params.require(:airplane).permit(:name, :description)
    airplane = airplane.new(airplane_params)
    if airplane.save
      redirect_to airplane_path(airplane)
    else
      # save error messages to flash[:error] hash
      flash[:error] = airplane.errors.full_messages.join(", ")
      redirect_to new_airplane_path
    end  
  end

end
```

Just one last step! We've sent `flash` to the view, but we haven't rendered it yet. Let's do that in our `application.html.erb` layout, so we can render flash messages in *every* view:

```html
<!-- app/views/layouts/application.html.erb -->

<!DOCTYPE html>
<html>
<head>
  ...
</head>
<body>
  <!-- display flash messages above the yield block -->
  <% flash.each do |name, msg| %>
    <div><%= msg %></div>
  <% end %>

  <%= yield %>

</body>
</html>
```

## Challenges

Now that you've seen how to implement validations, propagate the Active Record errors from your database models to the controller, and then pass the errors into the view, it's your turn!

See <a href="" target="_blank">this repo</a> the starter code and challenges.