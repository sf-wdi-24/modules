*Client / Server Model *

client/server

The <label> Element (Tag)

The <label> element is the formal way to define a label for an HTML form widget. "This is the most important element if you want to build accessible forms." — MDN

There are two ways to use labels correctly:

<!-- Simple (nested) label example -->
<label>Click me
  <input type="text" id="user" name="name" />
</label>

<!-- Using the "for" attribute with the input's id -->
<label for="user">Click me</label>
<input id="user" type="text" name="name" />
<label>'s Attributes

The for in a label references an <input>s id attribute, not it's name attribute! Sometimes these values will be the same, but for always is matched with id.

The name is the key of the <input>'s value when data is sent.

Common Inputs

Field Type	HTML Code	Widget (Control)	Notes
plain text	<input type="text">	<input type="text">	the type attribute can be omitted
password field	<input type="password">	<input type="password">	echoes dots instead of characters
text area	<textarea></textarea>	<textarea></textarea>	a more customizable plain text area
checkbox	<input type="checkbox">	<input type="checkbox">	can be toggled on or off
radio button	<input type="radio">	<input type="radio" name="group"> <input type="radio" name="group">	can be grouped with other inputs
drop-down lists	<select><option>	<select><option>Option 1</option><option>Option 2</option></select>	check here for more info
file picker	<input type="file">	<input type="file">	pops up an “open file” dialog
hidden field	<input type="hidden">		nothing there!
submit button	<input type="submit">	<input type="submit">	activates the form's submission
(a POST request or
Javascript action)
Important Attributes

All input types (including <textarea>s):

type: the type of data that is being input (affects the "widget" that is used to display this element by the browser).
name: the key used to describe this data in the HTTP request.
id: the unique identifier that other HTML elements, JavaScript and CSS use to access this element in the browser.
value: the default data that is assigned to the element.
placeholder: not a default value, but a useful HTML5 addition of a data "prompt" for an input.
autofocus: defaults the cursor to a specific input when the page originally loads. You can only have one autofocus on your page.
disabled: a Boolean attribute indicating that the "widget" is not available for interaction.
Radio buttons or checkboxes:

checked: a Boolean that indicates whether the control is selected by default (is false unless).
name: the group to which this element is connected. For radio buttons, only one element per group (or name) can be checked.
value: the data or value that is returned for a specific group (a multi-element control), if this element is checked.
Common Validations

Validations avoids having users submit bad data to our application. Knowing how to use them will save time and make your app a lot more usable.

Bad data could be anything from a required field being empty, an email address that was mistyped, or a password confirmation that doesn't match. Thankfully, HTML forms give us simple out-of-the-box validations for these common situations.

Required

Try submitting the below form without entering your name:

<form>
  <label for="colorField">What is your favorite color?</label>
  <input id="colorField" name="favColor" required>
  <button>Submit</button>
</form>
Notice the required attribute on the input. Therefore, the form will not submit until some information is entered into the field.

Pattern matching

<form>
  <label for="kindOfBob">Do you go by bob or bobert?</label>
  <input id="kindOfBob" name="bobType" pattern="bob|bobert" required>
  <button>Submit</button>
</form>
The pattern attribute allows us to specify the values we will accept. In this case only bob or bobert are acceptable.

Length

You may need the user to enter a specific amount of characters. Let's say you need a username to be at least 6 characters. You can use the minlength or maxlength attributes to help.

<form>
  <label for="userName">What's your username?</label>
  <input id="userName" name="userName" minlength="6" required>
  <button>Submit</button>
</form>
Further Reading (optional)

MDN has a number of exhaustive resources on HTML forms and inputs. It can be a lot to absorb, so look for patterns and try to grasp the big picture.

HTML Form Reference is a great resource and has been distilled below.
HTML Input Reference
Native Form Widgets
Form Validation.
=======
# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> Handlebars Templating

| Objectives |
| :--- |
| Add the Handlebars.js library to your projects |
| Create and compile a Handlebars template |
| Use Handlebars templating to display data from an AJAX call on your HTML page |

## What is a template?

* A **template** is a document (or piece of code) that contains **parameters** that are dynamically replaced with data.

* Thus far, we've been using jQuery to append HTML strings when we have data to send to the view from a server (via AJAX).

* To avoid building long strings of HTML every time we have data to send to the view, we'll use <a href="http://handlebarsjs.com" target="_blank">Handlebars templating</a> to dynamically display data in our HTML. The parameters for our data will live inside `{{}}` tags.

## Why use client-side templating?

* Separate markup from logic. Remember this?

  ```js
  var $trackHtml = '<p><strong>' + trackData.name + '</strong> by ' + trackData.artist + '</p>';
  $results.append($trackHtml);
  ```

  * When appending new HTML elements to the page, the string of elements to append will only get longer as you begin to write more complex markup. [<a href="https://github.com/sf-wdi-24/spotify-search/blob/solution/main.js#L56" target="_blank">see spotify-search</a>]
  * Wouldn't it be nice if the HTML structure was already set up for us? That's where templating comes in!

* Maximize code reusability and maintainability.

  * If you need to change your HTML structure for elements you're creating and displaying (e.g. adding an additional class name to your Spotify tracks), all you have to do is change the template!

## Handlebars Setup

1. Add the Handlebars CDN to your `index.html` (remember you can go to <a href="https://cdnjs.com" target="_blank">cdnjs</a> to search for CDNs). Make sure to require Handlebars before your custom script file.

  ```html
  <body>
    <div class="container">
      <!-- page content -->
    </div>

    <!-- jquery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

    <!-- handlebars -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.3/handlebars.min.js"></script>

    <!-- custom script -->
    <script type="text/javascript" src="main.js"></script>
  </body>
  </html>
  ```

2. Next create an element in your `index.html` where you will append the data from your template. Give this element an `id` (e.g. `results`) so you can select it with jQuery.

  ```html
  <body>
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-md-offset-3">
          <div id="results"></div>
        </div>
      </div>
    </div>
  </body>
  ```

3. Create the template inside your `results` element. Give your template an `id` (e.g. `tracks-template`) so you can select it with jQuery. This template acts as an HTML "skeleton" which you'll fill with data. The `{{}}` parameters will be replaced by the data that comes back from your API call.

  ```html
  <body>
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-md-offset-3">
          <div id="results">

            <!-- handlebars template -->
            <script id="tracks-template" type="text/x-handlebars-template">
              {{#each tracks}}
              <p><strong>{{name}}</strong> by {{artists.[0].name}}</p>
              {{/each}}
            </script>

          </div>
        </div>
      </div>
    </div>
  </body>
  ```

  **Note:** The example above uses the Spotify API. We use `{{each}}` to iterate through the tracks that come back from Spotify. Each track has a `name` and an array of `artists`. Notice the extra `.` we need when accessing a value from array (this syntax is specific to Handlebars). `artists.[0]` gives us the first artist from the array.

4. Compile your template in `main.js`. Calling `Handlebars.compile(source)` returns a function, which we save to the variable `template`. We will later use our new `template` function to pass in the data we want to render in the template.

  ```js
  // compile handlebars template
  var source = $('#tracks-template').html();
  var template = Handlebars.compile(source);
  ```

5. On success of your AJAX call, pass the data that comes back from the API into your template function. The output of the template function is HTML that contains the data from the API. The last step is to append the HTML to the view.

  ```js
  $.get(searchUrl, function (data) {

    // track results are in an array called `items`
    // which is nested in the `tracks` object
    var trackResults = data.tracks.items;

    // pass in data to render in the template
    var trackHtml = template({ tracks: trackResults });

    // append html to the view
    $results.append(trackHtml);
  });
  ```

## Challenges

* Refactor your <a href="https://github.com/sf-wdi-24/spotify-search" target="_blank">Spotify Search app</a> to use Handlebars templating. Feel free to pull down the <a href="https://github.com/sf-wdi-24/spotify-search/tree/solution" target="_blank">solution branch</a> if you want to start with fresh code.

## Stretch Challenge

* <a href="https://github.com/sf-wdi-24/geoquakes" target="_blank">GeoQuakes</a>

## Resources

* <a href="http://handlebarsjs.com" target="_blank">Handlebars.js</a>
>>>>>>> develop
