# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> Intro APIs & AJAX

| Objectives |
| :--- |
| Explain AJAX and why we use it |
| Use AJAX to GET data from an API |
| Use jQuery to render data from an API |

## APIs

Application Program Interfaces (APIs) are similar to Graphical User Interfaces (GUIs):

* A **GUI** is an interface between a program and a human (e.g. <a href="https://github.com/" target="_blank">github.com</a>).
* An **API** is an interface between two programs (e.g. <a href="https://developer.github.com/v3" target="_blank">GitHub API</a>).

A **GUI** exists to make an application more convenient for the user. An **API** does the same for its users, which are usually developers of other applications.

#### Examples

* Logging into Spotify with your Facebook account (Spotify uses Facebook's API)
* Posting Instagram photos to Facebook or Twitter (Instagram uses Facebook's and Twitter's APIs)

#### How to Interact with APIs

1. `curl` in the terminal

  ```zsh
  ➜  curl -i "https://api.spotify.com/v1/artists/3jOstUTkEu2JkjvRdBA5Gu"
  ```

2. RESTful API Explorer - <a href="https://chrome.google.com/webstore/detail/postman-rest-client-short/mkhojklkhkdaghjjfdnphfphiaiohkef" target="_blank">Postman</a>

  ```
  https://api.spotify.com/v1/artists/3jOstUTkEu2JkjvRdBA5Gu
  ```

3. jQuery AJAX

  ```js
  $.get('https://api.spotify.com/v1/artists/3jOstUTkEu2JkjvRdBA5Gu', function(data) {
    console.log(data);
  });
  ```

#### Structure of a URL

![url-structure](https://cloud.githubusercontent.com/assets/7833470/10722057/71282db8-7b69-11e5-867e-df5ef301ab19.png)

| Spotify Query Type | Spotify Example URL |
| :--- | :--- |
| Artist Lookup by ID | `https://api.spotify.com/v1/artists/3jOstUTkEu2JkjvRdBA5Gu` |
| Artist Search | `https://api.spotify.com/v1/search?q=weezer&type=artist` |

#### Structure of a Response

![response](https://cloud.githubusercontent.com/assets/7833470/10722166/95394272-7b6a-11e5-9679-3381c5baeaee.gif)

## AJAX

Asynchronous JavaScript And XML (AJAX) allows us to make requests to a server (ours or another application's) without refreshing the page.

#### Why do we care?

* AJAX lets us exchange data with the server behind the scenes. We can update our web pages (and data on the server!) without reloading the page at all.
* Limiting page reloads makes our web apps *faster* and gives our users a *better experience*. (Imagine if you experienced a full page refresh every time you "liked" a post on Facebook!)

#### How do we use it?

jQuery gives us a <a href="https://api.jquery.com/category/ajax" target="_blank">list of methods</a> for making AJAX requests.

## GET & POST

The HyperText Transfer Protocol (HTTP) is similar to a written language like English. English was made for humans; the HTTP language is specifically for web browsers and servers to communicate with each other.

`GET` and `POST` are the most important verbs in HTTP:

* A browser will use `GET` to indicate it would like to receive a specific web page or resource from a server.
* A browser will use `POST` to indicate it would like to send some data to a server.

We can use AJAX to make both `GET` and `POST` requests to servers. jQuery gives us the <a href="https://api.jquery.com/jQuery.ajax" target="_blank">$.ajax()</a> method, which will allow us to perform any AJAX request. It also gives us the helper methods <a href="https://api.jquery.com/jQuery.get" target="_blank">$.get()</a> and <a href="https://api.jquery.com/jQuery.post" target="_blank">$.post()</a>, which, you guessed it, are specifically for `GET` and `POST` requests.

## AJAX Setup

Using jQuery's `$.ajax()` method, we can specify a list of parameters, including:

* type of request
* request URL
* data type
* callback function (which will run on successful completion of the AJAX request)

```js
$.ajax({
  type: 'GET',
  url: 'https://api.spotify.com/v1/artists/1jTAvg7eLZQFonjWIXHiiT',
  dataType: 'json',
  success: function(data) {
    console.log(data);
  }
});
```

If we're doing a simple `GET` request, we can (and should) avoid the `$.ajax()` method and use the helper method `$.get()` instead. Here, we only need to pass in the request URL and callback function for the same AJAX request as the example above.

```js
var endpoint = 'https://api.spotify.com/v1/artists/1jTAvg7eLZQFonjWIXHiiT';
$.get(endpoint, function(response_data) {
    console.log(response_data);
});
```

For a `POST` request, we can also use the `$.ajax()` method, but this time, the data type is `"POST"`. Since `POST` requests send data to a server, we also need to send an object of data (the `book`).

```js
var book_data = {
  title: "The Giver",
  author: "Lowis Lowry"
};

$.ajax({
  type: "POST",
  url: "/books", // this is a relative link
  data: book_data,
  dataType: "json",
  success: function(data) {
    console.log(data);
  }
});
```

Just like with `GET`, the `POST` request above can be refactored to use the much simpler `$.post()` method. We pass in the request URL, data, and callback function.

```js
var book_data = {
  title: "The Giver",
  author: "Lowis Lowry"
};

$.post('/books', book, function(data) {
  console.log(data);
});
```

#### AJAX & Event-Handlers

We can combine AJAX calls with any jQuery event-handlers. You may want to execute an AJAX call when the user clicks a button or submits a form.

```js
var url = 'https://api.spotify.com/v1/search?q=goodbye&type=artist'

// click event on button
$('button').on('click', function(event) {
  $.get(url, function(data) {
    console.log(data);
  });
});

// submit event on form
$('form').on('submit', function(event){
  $.get(url, function(data) {
    console.log(data);
  });
});
```

#### Handling Success & Failure

We can't guarantee that our API will respond or that it will respond quickly enough. In these, cases the AJAX request will fail or throw an error. Using the `jquery.get()` shorthand, we can handle these eventualities by "chaining" additional event-listeners to our initial request:

```js
var url = 'https://api.spotify.com/v1/artists/1jTAvg7eLZQFonjWIXHiiT';

$.get(url).success(function(data) {
  // We're all good! (status code in the 200s)
  console.log(data);
}).fail(function() {
  // Timeout or server error (status code in the 400s)
  console.log(':(');
});

// or with this alternate style:

$.get(url).
  success(function(data) {
    // We're all good! (status code in the 200s)
    console.log(data);
  }).
  fail(function() {
    // Timeout or server error (status code in the 400s)
    console.log(':(');
  })
```

## Challenges

First, download the <a href="https://chrome.google.com/webstore/detail/postman-rest-client-short/mkhojklkhkdaghjjfdnphfphiaiohkef" target="_blank">Postman Chrome extension</a>.

1. Use Postman to search the Spotify API for the artist "Weezer". Find the artist `id` in the response body. **Hint:** Use the <a href="https://developer.spotify.com/web-api/search-item" target="_blank">search endpoint</a>.
2. Use Weezer's artist `id` to search for them directly using the <a href="https://developer.spotify.com/web-api/artist-endpoints" target="_blank">artist endpoint</a>.
3. Find Weezer's top tracks in the US.
4. Use the search endpoint to find albums or artists with the name "Clouds".
5. Start <a href="https://github.com/sf-wdi-24/spotify-search" target="_blank">tonight's homework</a>!

## Resources

* <a href="https://api.jquery.com/jquery.get" target="_blank">jQuery.get()</a>
* <a href="https://developer.spotify.com/web-api/endpoint-reference" target="_blank">Spotify API Docs</a>
