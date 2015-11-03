# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> RESTful Routing: Create & Read

| Objectives |
| :--- |
| Explain CRUD and RESTful Routing |
| CREATE and READ data from an RESTful API using AJAX |
| Display data on the page with Handlebars templating |

![crud-all-the-things](https://cloud.githubusercontent.com/assets/7833470/10917104/d7fdd2ee-8213-11e5-8cf8-466ff1677a6d.jpg)

## What is CRUD?

CRUD describes the basic operations of a persistent database. Meaning that every database action can be categorized into one of the four CRUD operations:

* **C:** Create - adds new data to the database
* **R:** Read - retreives data from the database (can be one record or a collection of records)
* **U:** Update - edits existing data in the database
* **D:** Destroy - removes data from the database

Our own applications don't have databases yet (we'll get there!), but as you already learned, we can interact with external databases through APIs.

## The REST of CRUD

REST stands for **Representational State Transfer**. By the type of request you are making (GET, POST, PUT, or DELETE) you are representing what you want to do server side (Create, Read, Update, Destroy).

Let's look at the different types of requests and their corresponding CRUD actions:

| REQUEST | CRUD Action |
| :--- | :--- |
| POST | CREATE |
| GET | READ |
| PUT | UPDATES |
| DELETE | DESTROYS |

## RESTful Routing

REST follows a routing convention, meaning that the type of request you're making also determines what the URL (route) will look like. You'll often hear the term "RESTful API", which simply means that the API follows the convetions of REST (requests represet the action) and RESTful routing (URLs follow this convention, too).

Here's what RESTful routing looks like:

Note: "resources" represents the thing in the database that we're CRUD-ing. This could be `users`, `books`, `photos`, etc.

| REQUEST | URL | CRUD Action |
| :--- | :--- | :--- |
| POST | `/resources` | CREATE |
| GET | `/resources` | READ |
| PUT | UPDATES | UPDATES |
| DELETE | DESTROYS | DESTROYS |

## AJAX Refresher: GET & POST

## Challenges

*Use starter code for this; make solution branch*

* Practice CREATE and READ with Postman
* Set up new front-end project
* AJAX to GET all books
* Display all books on page with Handlebars templating
* Form to CREATE a new book
* AJAX to POST `/books`
* Add newly created book to page with Handlebars templating

## Resources
