# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> jQuery Style Guide

## Variable Naming

It's best practice to either **prefix** or **postfix** variable names that refer to jQuery objects with a `$` symbol.

```js
var myTitle = $('h1#title'); // bad
var $myDiv = $('div#greeting'); // good;
var myTotal$ = $('div#total'); // okay
```

**Note:** Don't go wild and just add `$` symbols to every variable.

```js
var $myNum = 1; // bad
```

## Three Rules Of `$`

1. If you give the `$` an HTML string it will return a jQuery-wrapped collection of elements that represent it.

  ```js
  var $myDiv = $('<div>Hello World</div>');
  ```

  That would be the equivalent of writing out something like the following:

  ```js
  var myDiv = document.createElement('div');
  var innerText = document.createTextNode('Hello World');
  myDiv.appendChild(innerText);
  ```

2. If you give jQuery a **CSS selector** it will find the element and return it as a jQuery-wrapped object.

  ```js
  var $myDiv = $('div#greeting');
  ```

3. If you give jQuery a `function() {}` it will run that functionafter `document` is ready.

  ```js
  $(function() {
    console.log('DOCUMENT READY!');
  });
  ```

  Which is equivalent to the following:

  ```js
  $(document).ready('ready', function() {
    console.log('DOCUMENT READY!');
  });
  ```

## Events

When setting events you should use the `jQuery#on` method.

```js
var $myDiv = $('div#greeting');
$myDiv.on('click', function(event) {
  console.log('clicked');
});
```

Be sure to remember to `preventDefault()` for certain events.

```js
var $articleForm = $('form#newArticle');
$articleForm.on('click', function(event) {
  event.preventDefault();
  console.log('No page refresh');
});
```

If you just have an `input` field not in a form you might listen for a `change` event.

```js
var $input = $('input#playerName');
$input.on('change', function(event) {
  var playerName = $(this).val();
  console.log('Player name', playerName);
});
```

If you want to quickly gather all the input field name and value pairs from a form you should use `jQuery#serialize`

```js
var $newArticle = $('form#newArticle');
$newArticle.on('change', function(event) {
  console.log('Article info', $(this).serialize());
});
```

## AJAX

If you can get away with using a jQuery helper method for AJAX please use it.

#### GET Request

```js
$.get('/articles', function() {
  console.log(data);
});
```

#### POST Request

```js
$.post('/books', {
    book: {
      title: 'The Giver',
      author: 'Lowis Lowry'
    }
  }, function() {
    console.log(data);
});
```

If you are doing something a little more interesting or you need more specificity, then you should look into using `jQuery#ajax`.

```js
$.ajax({
  type: 'PUT',
  url: '/books/1',
  data: {
    book: {
      title: 'The Giver',
      author: 'Lowis Lowry'
    }
  },
  dataType: 'json',
  success: function(data) {
    console.log('A book update', data);
  }
});
```

## Event Delegation

If you're using jQuery to add event handlers to elements, you should use event delegation when possible.

Adding `click` handlers to each `tr` should be avoided.

```js
// bad
$('table#myTable tr').each(function(index, el) {
  $(el).on('click', function(event) {
    console.log('clicked tr', index);
  });
});
```

Instead, add a `click` handler to the container of the collection.

```js
$('table#myTable').on('click', 'tr', function(event) {
  console.log(this);
  console.log(event.target);
  console.log(event.currentTarget);
});
```

## Adding Data to Elements

You can add `data` to an element using the `jQuery#data` method.

```js
var $myDiv = $('div#greeting');
$myDiv.data('count', 1);
$myDiv.data('count') //=> 1
$myDiv.data(); //=> { count: 1 }
```

## Avoid Using `hide/show`

Just don't use these methods ever. They have <a href="https://github.com/jquery/jquery.com/issues/88#issuecomment-72400007" target="_blank">negative effects on performance</a>.

## Caching jQuery Objects

Just reuse the retrieved jQuery object:

```js
// bad: selecting same element twice
$('#books').addClass('read')
$('#books').html('ALL READ')

// good: "caching" element by saving to variable
var $books = $('#books');
$books.addClass('read');
$books.html('ALL READ');
```
