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

## Challenges

For these challenges, you'll be using the `books` endpoint of <a href="https://github.com/sf-wdi-24/crud-api" target="_blank">this RESTful API</a>. Your goal is to use AJAX to `READ` and `CREATE` data

* Practice CREATE and READ with Postman
* Set up new front-end project
* AJAX to GET all books
* Display all books on page with Handlebars templating
* Form to CREATE a new book
* AJAX to POST `/books`
* Add newly created book to page with Handlebars templating
