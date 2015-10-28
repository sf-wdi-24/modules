## Challenges

### Draw a Tree

1. Draw the structure of the sf-wdi-24 github repository.
2. Draw the structure of the following HTML document:

  * How many children does the `<div>` with class `header` have?
    * 7 total children (`<ul>`, all `<li>`'s, all `<a>`'s)
    * 1 direct child (`<ul>`)
  * What is the direct child of the `<p>` element?
    * `<a>` element
  * What is the direct parent of the `<p>` element?
    * `<div>` with class `section`

### CSS Selectors

For the following code blocks, come up with as many CSS selectors as you can think of to select the HTML elements in **red**, and *only* the elements in red.

**Code Block #1**

* `#fancy`
* `p#fancy`
* `div p#fancy`
* `.page #fancy`
* `.page p#fancy`
* `div.page p#fancy`

**Code Block #2**

* `.small`
* `div .small`
* `div a.small`
* `div.page a.small`

**Code Block #3**

* `p a`
* `div p a`
* `.page p a`
* `div.page p a`

**Code Block #4**

* `.mad-favs li`
* `ul.mad-favs li`
* `.page .mad-favs li`
* `div.page ul.mad-favs li`

**Code Block #5**

* `.sparkles`
* `p.sparkles`
* `div p.sparkles`
* `div.page p.sparkles`

### jQuery Selectors

1. Use jQuery to select the element containing the words "Hello There" with as many different selectors as you can think of:

  ```js
  var $el = $('#greeting');
  var $el = $('div');
  var $el = $('div#greeting');
  // note that using the "$" in the variable name "$el" is just a naming convention
  // it indicates to you, dear reader, that the value of "$el" is a jQuery "object"
  // and therefore has special jQuery methods
  ```

2. How would you *get* the value "Hello There"?

  ```js
  $('#greeting').text();
  ```

3. How would you change (or *set*) the value to "Hola"?

  ```js
  $('#greeting').text('Hola');
  ```

4. How would you add an `<h1>` to the page that says "A Spanish Greeting"?

  ```js
  $('body').prepend('<h1>A Spanish Greeting</h1>');
  ```

5. How would you add a second greeting ("Que tal?") below the first?

  ```js
  $('body').append('<div>Que tal?</div>');
  ```

6. How would you add the class "section" to both greetings?

  ```js
  $('div').addClass('section');
  ```

### Indiana Jones And the Temple of DOM

Go to the <a href="https://generalassemb.ly" target="_blank">General Assembly homepage</a>, and open your Chrome Developer Console.

1. Select the huge text splashed across the front page.

  ```js
  $('h1#san-francisco_title');
  ```

  * *Get* its text.

    ```js
    $('h1#san-francisco_title').text();
    ```

  * Change (*set*) its text to "Indiana Jones and the Temple of DOM"

    ```js
    $('h1#san-francisco_title').text('Indiana Jones and the Temple of DOM');
    ```

  * Add a `<small>` tag containing the text "(Rated G)" to the end of the line.

    ```js
    $('h1#san-francisco_title').append('<small>(Rated G)</small>');

    // bonus: actually make it smaller
    $('h1#san-francisco_title small').css('font-size', '40px');
    ```

2. Turn the big red button blue.

  ```js
  $('.browse-offerings').css('background-color', 'blue');
  ```

3. Select the image to the right of the "Full-Time Courses" section (the one with the red-cushioned chair).

  ```js
  $('img[alt="Immersive papercraft hp"]');
  ```

  * *Get* its image `src` (image url).

    ```js
    $('img[alt="Immersive papercraft hp"]').attr('src');
    ```

  * Swap out the image for this <a href="https://cloud.githubusercontent.com/assets/7833470/10717957/17c7ef00-7b24-11e5-8fea-4484b908f8a7.gif" target="_blank">GIF of Indiana Jones</a>.

    ```js
    $('img[alt="Immersive papercraft hp"]').attr('src', 'https://cloud.githubusercontent.com/assets/7833470/10717957/17c7ef00-7b24-11e5-8fea-4484b908f8a7.gif');
    ```

4. Change the text of *every* paragraph on the page to: "Snakes. Why did it have to be snakes?"

  ```js
  $('p').text('Snakes. Why did it have to be snakes?')
  ```

5. **Bonus:** Combine all your code into a single function called `changeAllTheThings`. When you call the function, it should make all your changes to the page. (You'll want to use a Script Snippet in your Chrome Developer Console for this. `cmd + option + J > Sources Tab > Snippets Sub-Tab`)

  ```js
  var changeAllTheThings = function () {
    $('h1#san-francisco_title').text('Indiana Jones and the Temple of DOM');
    $('h1#san-francisco_title').append('<small>(Rated G)</small>');
    $('h1#san-francisco_title small').css('font-size', '40px');
    $('.browse-offerings').css('background-color', 'blue');
    $('img[alt="Immersive papercraft hp"]').attr('src', 'https://cloud.githubusercontent.com/assets/7833470/10717957/17c7ef00-7b24-11e5-8fea-4484b908f8a7.gif');
    $('p').text('Snakes. Why did it have to be snakes?')
  }

  changeAllTheThings();
  ```

## Stretch Challenge

Open up this <a href="http://jsfiddle.net/cameronjacoby/Lfnkg20h/1/" target="_blank">JSFiddle</a>. Write jQuery that makes the green boxes fade out one by one. The boxes should disappear in order from left to right, and there should be a one second delay before the next one goes away.

<a href="http://jsfiddle.net/cameronjacoby/6hkmL5nr/2/" target="_blank">Solution</a>