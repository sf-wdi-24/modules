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

## Intro to why update/delete

[![Oooops](https://cloud.githubusercontent.com/assets/1329385/10920179/bc90396a-8223-11e5-8080-6eb41d7db3ed.gif)](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete)

## Update and show changes

## Update a non-existent item

## Delete an item

## Delete a non-existent item

## Resources

* [HTTP API Design Resources](https://github.com/gocardless/http-api-design)
* [Best Practices](http://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api)
* [Summary API Design](https://github.com/interagent/http-api-design)


## Challenges

* Why do we use REST?
* What is REST?
* Find an alternate method for API interaction which isn't REST.
* Create a record using a REST API.
* Update a record using a REST API.
* Read a record's value using a REST API.
* Delete a record using a Rest API.
* What are HTTP Error codes?
* Why are HTTP Error codes used?
