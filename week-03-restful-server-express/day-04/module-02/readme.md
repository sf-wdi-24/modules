# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Mongoose Models & CRUD

| Objectives |
| :--- |
| Review Mongoose setup in a Node/Express app |
| Find documents with Mongoose |
| Update and delete documents with Mongoose |

## Review: What is Mongoose?

<a href="http://mongoosejs.com" target="_blank">Mongoose</a> is an ORM (<a href="https://en.wikipedia.org/wiki/Object-relational_mapping" target="_blank">Object-Relational Mapping</a>) for the non-relational, document-based database <a href="http://docs.mongodb.org/manual" target="_blank">MongoDB</a>.

An ORM is a layer between our application and our database, which allows us to query and manipulate data in the language and structure of our application.

Mongoose allows us to use JavaScript and Object-Oriented Programming to talk to our database, making our code DRY-er and eliminating the need to manually query our Mongo database.

## Review: Mongoose Setup

1. In the terminal, add Mongoose to your application's node modules.

  ```
  ➜  npm install --save mongoose
  ```

2. In `server.js`, require Mongoose and connect to the database you're using for your application.

  ```js
  var mongoose = require('mongoose');
  mongoose.connect('mongodb://localhost/todo-app');
  ```

3. At this point, if you haven't already created the database you're using, do so in the terminal. You'll need to start up MongoDB by running:

  ```
  ➜  mongod
  ```

  **Note:** If you already have an instance of MongoDB running, you'll get an error at this step. If that's the case, you can move on to the next step, since MongoDB is already running!

4. In a separate terminal tab, create and connect to your database. In the example, our new database is called `todo-app`.

  ```
  ➜  mongo
  ➜  use todo-app
  ```

## Set Up Mongoose Model

1. In your application, create a folder called `models` with a file for your first model. In the example, we have a `Todo` model, so the filename is `todo.js`. Your folder structure should look similar to this:

  ```
  | your-app-name
    | models
      - todo.js
    | public
      | scripts
        - main.js
      | styles
        - main.css
    | views
      - index.hbs
    - .gitignore
    - package.json
    - readme.md
    - server.js
  ```

2. <details>
  <summary>In your model file (e.g. `todo.js`), create the model schema, and export it so that you can require it in other parts of your app.</summary>
  ```js
  var mongoose = require('mongoose'),
    Schema = mongoose.Schema;

  var TodoSchema = new Schema({
    task: String,
    description: String
  });

  var Todo = mongoose.model('Todo', TodoSchema);

  module.exports = Todo;
  ```
</details>

3. <details>
  <summary>In `server.js`, require your model.</summary>
  ```js
  var Todo = require('./models/todo');
  ```
</details>

## CRUD Operations with Mongoose

#### Get all todos: `.find()`

<details>
  <summary>We can use <a href="http://mongoosejs.com/docs/api.html#model_Model.find"  target="_blank">.find()</a> to get all documents in the collection.</summary>
  ```js
  // get all todos
  app.get('/api/todos', function (req, res) {
    // find all todos in db
    Todo.find(function (err, allTodos) {
      res.json({ todos: allTodos });
    });
  });
  ```

  **Note:** We can also use `.find()` to get a specific set of documents in the collection (rather than ALL documents) by setting conditions. Read more <a href="http://mongoosejs.com/docs/api.html#model_Model.find"  target="_blank">in the docs</a>.
</details>

#### Create new todo: `new` and `.save()`

<details>
  <summary>We've seen the `new` keyword before! It creates new instances of an object. We use it here to create new instances of our `Todo` model. We then call `.save()` to store the new todo in our database.</summary>
  ```js
  // create new todo
  app.post('/api/todos', function (req, res) {
    // create new todo with form data (`req.body`)
    var newTodo = new Todo(req.body);

    // save new todo in db
    newTodo.save(function (err, savedTodo) {
      res.json(savedTodo);
    });
  });
  ```
</details>

#### Get one todo: `.findOne()`

<details>
  <summary>We can use <a href="http://mongoosejs.com/docs/api.html#query_Query-findOne">.findOne()</a> to return the first document in the collection that matches certain criteria. In this case, we're looking for a todo that has a certain `_id`.</summary>
  ```js
  // get one todo
  app.get('/api/todos/:id', function (req, res) {
    // get todo id from url params (`req.params`)
    var todoId = req.params.id;

    // find todo in db by id
    Todo.findOne({ _id: todoId }, function (err, foundTodo) {
      res.json(foundTodo);
    });
  });
  ```

  **Note:** The <a href="http://mongoosejs.com/docs/api.html#model_Model.findById" target="_blank">.findById()</a> method will also return a single document matching a specified id field.
</details>

#### Update todo: `.findOne()` and `.save()`

<details>
  <summary>Similar to the last example, we can use `.findOne()` to find the document with a certain `_id`. After updating the document, we use `.save()` to persist our changes to the database.</summary>
  ```js
  // update todo
  app.put('/api/todos/:id', function (req, res) {
    // get todo id from url params (`req.params`)
    var todoId = req.params.id;

    // find todo in db by id
    Todo.findOne({ _id: todoId }, function (err, foundTodo) {
      // update the todos's attributes
      foundTodo.task = req.body.task;
      foundTodo.description = req.body.description;

      // save updated todo in db
      foundTodo.save(function (err, savedTodo) {
        res.json(savedTodo);
      });
    });
  });
  ```
</details>

#### Delete todo: `.findOneAndRemove()`

<details>
  <summary>The <a href="http://mongoosejs.com/docs/api.html#model_Model.findOneAndRemove" target="_blank">.findOneAndRemove()</a> method takes care of finding the document with a certain `_id` and removing it from the database.</summary>
  ```js
  // delete todo
  app.delete('/api/todos/:id', function (req, res) {
    // get todo id from url params (`req.params`)
    var todoId = req.params.id;

    // find todo in db by id and remove
    Todo.findOneAndRemove({ _id: todoId }, function (err, deletedTodo) {
      res.json(deletedTodo);
    });
  });
  ```
  **Note:** Another way to remove the document is by finding the document first (using `.findOne()` or  `.findById()`) and calling <a href="http://mongoosejs.com/docs/api.html#model_Model.remove" target="_blank">`.remove()`</a>.
</details>

## Challenges

Start <a href="https://github.com/sf-wdi-24/express-todo-mongo" target="_blank">tonight's homework</a>! Your goal is to add MongoDB and Mongoose to your To Do app.

## Resources

* <a href="http://mongoosejs.com/docs" target="_blank">Mongoose Docs</a>
* <a href="http://mongoosejs.com/docs/api.html#model_Model.find" target="_blank">.find()</a>
* <a href="http://mongoosejs.com/docs/api.html#query_Query-findOne" target="_blank">.findOne()</a>
* <a href="http://mongoosejs.com/docs/api.html#model_Model.findById" target="_blank">.findById()</a>
* <a href="http://mongoosejs.com/docs/api.html#model_Model.findOneAndRemove" target="_blank">.findOneAndRemove()</a>
* <a href="http://mongoosejs.com/docs/api.html#model_Model.remove" target="_blank">.remove()</a>
