# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> RESTful Routing: Create & Read

| Objectives |
| :--- |
| Explain CRUD and RESTful Routing |
| CREATE and READ data from an RESTful API using AJAX |
| Display data on the page with Handlebars templating |

![crud-all-the-things](https://cloud.githubusercontent.com/assets/7833470/10917104/d7fdd2ee-8213-11e5-8cf8-466ff1677a6d.jpg)

## What is CRUD?

CRUD describes the **basic operations of a persistent database**. Every database action can be categorized into one of the four CRUD operations:

* **Create** - adds new data to the database
* **Read** - retrieves data from the database (can be one record or a collection of records)
* **Update** - edits existing data in the database
* **Delete** - removes data from the database

Our own applications don't have databases yet (we'll get there!), but as you already learned, we can interact with external databases through APIs.

## The REST of CRUD

REST stands for **Representational State Transfer**. This means that the type of request you make to the server (`GET`, `POST`, `PUT`, or `DELETE`) represents the action you want to take (`CREATE`, `READ`, `UPDATE`, or `DELETE`).

Let's look at the different types of server requests and their corresponding CRUD actions:

| Request | CRUD Action |
| :--- | :--- |
| POST | CREATE |
| GET | READ |
| PUT | UPDATE |
| DELETE | DELETE |

## RESTful Routing

REST follows a routing convention, meaning that the type of request you're making also determines what the URL (route) will look like. You'll often hear the term "RESTful API", which simply means that the API follows the conventions of REST and RESTful Routing.

Here's what RESTful routing looks like for a database of `photos`:

| Request | URL | CRUD Action |
| :--- | :--- | :--- |
| GET | `/photos` | READS all photos |
| POST | `/photos` | CREATES new photo |
| GET | `/photos/:id` | READS one photo |
| PUT | `/photos/:id` | UPDATES one photo |
| DELETE | `/photos/:id` | DELETES one photo |

## AJAX Refresher: GET & POST

```js
// GET all books
$.get(
  "https://super-crud.herokuapp.com/books",
  function (data) {
    console.log(data);
  }
);

// POST request to create new book
$.post(
  "https://super-crud.herokuapp.com/books",
  {
    title: "Harry Potter and the Sorcerer's Stone",
    author: "J.K. Rowling",
    image: "https://upload.wikimedia.org/wikipedia/en/b/bf/Harry_Potter_and_the_Sorcerer's_Stone.jpg",
    releaseDate: "September 1, 1998"
  },
  function (data) {
    console.log(data);
  }
);
```

Rather than `console.log`-ing the data that comes back from the API, we should use <a href="https://github.com/sf-wdi-24/modules/tree/master/week-02-ajax-and-js-objects/day-03/module-01" target="_blank">Handlebars templating</a> to display it on the page.

## Challenges

For these challenges, you'll be using the `books` endpoint of <a href="https://github.com/sf-wdi-24/crud-api" target="_blank">this RESTful API</a>. Your goal is to use AJAX to `READ` all the `books` from the API and `CREATE` new `books`.

Note that most APIs require an API key if you want to do anything other than read data, and a lot of them even require a key just to read. We made this API for you to explore CRUD, no API key required!

1. Use Postman to `GET` all the `books`. Now get just one book using the `_id`.
2. Use Postman to send a `POST` request to create a new book.

For the rest of the challenges, fork and clone the <a href="https://github.com/sf-wdi-24/ajax-book-app" target="_blank">ajax-book-app</a> repo.

1. Use AJAX to `GET` all the `books` from the API. Your first step should be to `console.log` the data from the API.
2. Use Handlebars templating to display all the books on the page.
3. Add a form to create a new book in `index.html`.
4. When a user submits the form, use AJAX to send a `POST` request to create a new book.
5. Use Handlebars templating to add the newly created book to the page. **Hint:** Our Handlebars template is for a *collection* (array) of data, so we can't use it to add just one book to the page. A way around this is to clear all the books from the page when a new book is added and re-render the template with the updated collection.

## Resources

* <a href="https://api.jquery.com/jquery.get" target="_blank">jQuery.get()</a>
* <a href="https://api.jquery.com/jquery.post" target="_blank">jQuery.post()</a>
* <a href="http://handlebarsjs.com" target="_blank">Handlebars.js</a>
