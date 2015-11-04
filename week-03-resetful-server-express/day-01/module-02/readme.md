# RESTful Routing Continued (Update, Delete)

| Objectives |
| :---- |
| DELETE content you created by accident. |
| Handle errors returned from REST APIs. |
| Explain the basic list of HTTP verbs. |

## Practice CR

Last module you created a small website capable of `POST`ing and `GET`ting data from a REST API. Do you have it all setup?

Let's get into groups and checkout where everyone is. It's important we have this working in order to continue so if you've fallen behind let's work as a team and get everyone setup.

In order to continue you'll need.

1. An `index.html` page to open in a browser.
  * It must include jQuery (we'll use it to make requests).
  * There must be a form which can create a book.
  * We must be able to get a list of books.

1. <details>
  <summary>A `main.js` file with the body surrounded by a function which is called on `document`'s ready event.</summary>
  ```js
  $(document).ready(function () {
    // All your function code!
    // Why do you do this?
  });
  ```
</details>

## Create objects we'll work with

TODO checkout how the Create and Read are done.

## Intro to why update/delete

[![Oooops](https://cloud.githubusercontent.com/assets/1329385/10920179/bc90396a-8223-11e5-8080-6eb41d7db3ed.gif)](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete)

We've created a few books and seen a list of all the books so we're done. What else could we possibly need?

Well I've created a book with a title of "Hankleberry Finn" on accident. It was supposed to be "Huckleberry Finn" and now my library of books is ruined.

In order to fix this we'll `DELETE` this book and create a new one with the proper name.

## Delete an item

We don't have a slick `$.get` or `$.post` to `DELETE` items so instead we use the longer form `$.ajax` in order to make our request. In order to `DELETE` an item we'll need to know the ID we're going to `DELETE`.

This is similar to doing a `GET` on a book, we needed an ID of a book in the list but instead of returning the book we're going to destroy it.

```js
$.ajax({
  type: "DELETE",
  url: "https://super-crud.herokuapp.com/books/563950249f89f21100e7c2ff/",
  success: function (data) {
    console.log("DESTROYED!");
  }
});
```

<details>
  <summary>Does `DELETE` remove something forever?</summary>
  It depends, it will if the people who developed the server set it up that way.
</details>

## Delete a non-existent item

A problem which comes up often for me is I forget the ID, it's hard to remember an ID like `563950249f89f21100e7c2ff`.

What should happen when I try to `DELETE` something which doesn't exist?



## Update and show changes

## Update a non-existent item

## Resources

* [HTTP API Design Resources](https://github.com/gocardless/http-api-design)
* [Best Practices](http://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api)
* [Summary API Design](https://github.com/interagent/http-api-design)

## Challenges

* Why do we use REST?
* What is REST?
* Find an alternate method for API interaction which isn't REST.
* Create a record using a REST API.
* Read a record's value using a REST API.
* Update a record using a REST API.
* Read a record's value (again) using a REST API.
* Delete a record using a REST API.
* What are HTTP Error codes?
* Why are HTTP Error codes used?