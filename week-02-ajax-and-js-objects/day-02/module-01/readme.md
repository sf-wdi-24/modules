# HTML5 Forms

| Objectives |
| :--- |
| Explore HTML Forms and Inputs |
| Understand the difference between a `method` and an `action` |
| Create forms that utilize parameters |

### An Example `<form>` Element (Tag)

```html
<form method="POST" action="/page">
  <label for="name">Page Name</label>
  <input id="name" type="text" name="page_name" />
  <input type="submit" value="Create" />
</form>
```

#### Attributes

In the opening of the `<form>` tag you can see two attributes: `method` & `action`

- **method**: the HTTP verb (method) that the browser uses to submit the form.
- **action**: the path of the HTTP request page that processes the information submitted via the form.

>A `route` is simply a combination of a method & action. For example `GET '/page'` or `POST '/users'` are both valid routes.

>For now simply understand that it is convention for [GET](http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html#sec9.3) to be used in a request when the client wants to receive data, and for [POST](http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html#sec9.5) to be used in a request when the client wants to send data.

**Client / Server Model **

![client/server](https://mdn.mozillademos.org/files/4291/client-server.png)

### The `<label>` Element (Tag)

The `<label>` element is the formal way to define a label for an HTML form widget.
"This is the most important element if you want to build accessible forms." *— MDN*

There are two ways to use labels correctly:

```html
<!-- Simple (nested) label example -->
<label>Click me
  <input type="text" id="user" name="name" />
</label>

<!-- Using the "for" attribute with the input's id -->
<label for="user">Click me</label>
<input id="user" type="text" name="name" />
```

#### `<label>`'s Attributes

* The `for` in a label references an `<input>`s `id` attribute, not it's `name` attribute! Sometimes these values will be the same, but `for` always is matched with `id`.

* The `name` is the `key` of the `<input>`'s value when data is sent.

## Common Inputs

| Field Type | HTML Code | Widget (Control) | Notes |
|:-- |:-- |:-- |:-- |
| plain text | `<input type="text">` | ![<input type="text">][text] | the type attribute can be omitted |
| password field | `<input type="password">` | ![<input type="password">][text] | echoes dots instead of characters |
| text area | `<textarea></textarea>` | ![<textarea></textarea>][area] | a more customizable plain text area |
| checkbox | `<input type="checkbox">` | ![<input type="checkbox">][check] | can be toggled on or off |
| radio button | `<input type="radio">` | ![<input type="radio" name="group"> <input type="radio" name="group">][radio] | can be grouped with other inputs |
| drop-down lists | `<select><option>` | ![<select><option>Option 1</option><option>Option 2</option></select>][select] | [check here for more info](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select) |
| file picker | `<input type="file">` | ![<input type="file">][file] | pops up an “open file” dialog |
| hidden field | `<input type="hidden">` |  | nothing there!
| submit button | `<input type="submit">` | ![<input type="submit">][submit] | activates the form's submission <br/>(a `POST` request or <br/>Javascript action) |

<!-- Images -->
[text]:   https://raw.github.com/h4w5/html_form_cheatsheet_images/master/input-text.png
[area]:   https://raw.github.com/h4w5/html_form_cheatsheet_images/master/textarea.png
[check]:  https://raw.github.com/h4w5/html_form_cheatsheet_images/master/input-checkbox.png
[radio]:  https://raw.github.com/h4w5/html_form_cheatsheet_images/master/input-radio.png
[select]: https://raw.github.com/h4w5/html_form_cheatsheet_images/master/select-option.png
[file]:   https://raw.github.com/h4w5/html_form_cheatsheet_images/master/input-file.png
[submit]: https://raw.github.com/h4w5/html_form_cheatsheet_images/master/input-submit.png

### Important Attributes

All input types (including `<textarea>`s):

- **`type`**: the type of data that is being input (affects the "widget" that is used to display this
  element by the browser).
- **`name`**: the key used to describe this data in the HTTP request.
- **`id`**: the unique identifier that other HTML elements, JavaScript and CSS use to access this
  element in the browser.
- **`value`**: the default data that is assigned to the element.
- **`placeholder`**: not a default value, but a useful HTML5 addition of a data "prompt" for an input.
- **`autofocus`**: defaults the cursor to a specific input when the page originally loads. You can only have one autofocus on your page.
- **`disabled`**: a Boolean attribute indicating that the "widget" is not available for interaction.

Radio buttons or checkboxes:

- **`checked`**: a Boolean that indicates whether the control is selected by default (is false unless).
- **`name`**: the group to which this element is connected. For radio buttons, only one element per
  group (or name) can be checked.
- **`value`**: the data or value that is returned for a specific group (a multi-element control), if
  this element is checked.

## Common Validations

Validations avoids having users submit bad data to our application. Knowing how to use them will save time and make your app a lot more usable.

Bad data could be anything from a required field being empty, an email address that was mistyped, or a password confirmation that doesn't match. Thankfully, HTML forms give us simple out-of-the-box validations for these common situations.

###Required

Try submitting the below form without entering your name:

```html
<form>
  <label for="colorField">What is your favorite color?</label>
  <input id="colorField" name="favColor" required>
  <button>Submit</button>
</form>
```
Notice the `required` attribute on the input. Therefore, the form will not submit until some information is entered into the field.

###Pattern matching

```html
<form>
  <label for="kindOfBob">Do you go by bob or bobert?</label>
  <input id="kindOfBob" name="bobType" pattern="bob|bobert" required>
  <button>Submit</button>
</form>
```

The `pattern` attribute allows us to specify the values we will accept. In this case only `bob` or `bobert` are acceptable.

###Length

You may need the user to enter a specific amount of characters. Let's say you need a username to be at least 6 characters. You can use the `minlength` or `maxlength` attributes to help.

```html
<form>
  <label for="userName">What's your username?</label>
  <input id="userName" name="userName" minlength="6" required>
  <button>Submit</button>
</form>
```


##Further Reading (optional)

MDN has a number of exhaustive resources on HTML forms and inputs. It can be a lot to absorb, so look for patterns and try to grasp the big picture.

* [HTML Form Reference](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms) is a great resource and has been distilled below.
* [HTML Input Reference](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
* [Native Form Widgets](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms/The_native_form_widgets)
* [Form Validation](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms/Data_form_validation).
