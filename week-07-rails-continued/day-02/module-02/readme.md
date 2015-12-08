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

## Handling Errors in Controllers & Views

The `airplanes#create` controller method currently looks like this:

We should refactor it to use `.new` and `.save` instead:



```ruby
# app/controllers/owners_controller.rb
def create
  @owner = Owner.create(name: "Taco")
end
```

If someone tried to `save` a new owner in the database with a duplicate username, or no username, or a name with fewer than 6 characters, an error would be generated.

```ruby
ActiveRecord::RecordInvalid: Validation failed: Name is too short (minimum is 6 characters)
```

However, this error would be displayed in the server. So how can we get it to the view where the owner can see it? Well, fortunately the error message is stored on the object that was attempting to be saved (`@owner` in this case).

Speaking of `@owner`, where is that being used in the view? It's here:

```html
<!-- app/views/owners/new.html.erb -->
<div class='owner-form'>
  <%= form_for @owner do |f| %>
  <!-- error-handling code will go here -->
  <p class="owner-form-title">
    <%= f.text_field :name, placeholder: 'name' %>
  </p>
  <p class="owner-form-submit">
    <%= f.submit %>
  </p>
  <% end %>
</div>
```

There is a lot going on here. A few important things to note:

**`form_for`**

```ruby
<%= form_for @owner do |f| %>
# ERB code here  
<% end %>
```

`form_for` is a [form helper](http://guides.rubyonrails.org/form_helpers.html#binding-a-form-to-an-object) method Rails provides which can take several parameters:
  - the actual object which is the form is creating or updating, e.g, `@owner`
  - a hash of options, which itself consists of a `url` hash and an `html` hash, which will affect how the form renders in HTML and what route it aligns with

`form_for` yields a form builder object, `f`, which is used to generate the various different form tags like text fields, text areas, and submit buttons. Like this:

```ruby
<%= f.text_field :name, placeholder: 'name' %>
<%= f.submit %>
```

The `text_field` takes a symbol as an argument, which is uses to determine which attribute on the model to link the field to, along with a [hash of options](http://apidock.com/rails/ActionView/Helpers/FormHelper/text_field), such as deciding placeholders, classes, and more.

The [form builder API docs](http://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html) for other methods, and the [Form Helpers documentation](http://guides.rubyonrails.org/form_helpers.html) for general information about forms in Rails.

Okay, so we have our owner form. Let's make some owners! But wait, what if we make owners that don't pass our validations? How can we inform the user what needs to be corrected?

We can access the errors using `@owner.errors.full_messages` method provided by `ActiveRecord::Base`. See the docs [here](http://api.rubyonrails.org/classes/ActiveModel/Errors.html#method-i-full_message).  We can display the errors in the view by iterating over the array of error message strings on the Owner object.

Look at the following code snippet. What does it do?

```html
<% if @owner.errors.any? %>
  <div id="error_explanation">
    <h2 class="error-warning">
      <%= pluralize(@owner.errors.count, "error") %> prohibited
      this owner from being saved:
    </h2>
    <ul>
      <% @owner.errors.full_messages.each do |msg| %>
      <li class="error-message"><%= msg %></li>
      <% end %>
    </ul>
  </div>
<% end %>
```

Add the above code to your form, right below the `form_for` opening tag. With our new and improved form, users will get error messages telling them what fields they need to fix when they make an invalid owner form submission. Awesome!

## Challenges

Now that you've seen how to implement validations and propagate the Active Record errors from your database models to the controller and then pass that into the view, it's your turn!

[Exercise repo](https://github.com/sf-wdi-22-23/rails-forms-validations)