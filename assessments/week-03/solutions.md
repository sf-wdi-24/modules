# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> WDI 24 - Week 3 Assessment [SOLUTIONS]

1. A user fills out a form and hits "submit". List at least 3 things that might happen next.

  * The page refreshes
  * The form sends parameters to the server
  * jQuery prevents the default behavior, and the page DOES NOT refresh
  * jQuery gets the values from the form input fields
  * An AJAX request sends the form data to the server asynchronously

2. Give two examples of HTTP status codes and what they mean.

  * 200 - ok
  * 201 - created
  * 301 - moved permanently
  * 302 - found
  * 400 - bad request
  * 401 - unauthorized
  * 404 - not found
  * 422 - unprocessable entity
  * 500 - internal server error
  * 502 - bad gateway

3. Fill in the following grid (assume that it’s for an ordering system):

  | CRUD Action | HTTP Verb / Method | REST Route / Endpoint |
  | :--- | :--- | :--- |
  | READ (all) | GET | `/api/orders` |
  | CREATE | POST | `/api/orders` |
  | READ (one) | GET | `/api/orders/:id` |
  | UPDATE | PATCH or PUT | `/api/orders/:id` |
  | DELETE | DELETE | `/api/orders/:id` |

4. Briefly describe the purpose of each of the following files/directories in our Express projects:

  **server.js** - set up server and routes

  **package.json** - list dependencies (node modules) we're using in our app (allows anyone to clone the project and run `npm install`)

  **node_modules/** - folder containing dependencies (node modules) we're using in our app

  **public/js/main.js** - client-side JavaScript file where we use AJAX to query our API

  **views/index.hbs** - view for our homepage (uses Handlebars for server-side templating)

5. Jimmy has an awesome Node/Express app running his site at http://www.jimmysworld.com. Now Jimmy wants his site to include an API that exposes his contact information to developers. His `/api/contacts/jimmy` endpoint should respond with a JSON object containing his name, phone number, and email address. Help Jimmy add a route to his server-side application code that responds with the desired data:

  ```js
  app.get('/api/contacts/jimmy', function (req, res) {
    var jimmysContact = {
      name: 'Jimmy',
      phoneNumber: '555-555-5555',
      emailAddress: 'jimmy@jimmysworld.com'
    }
    res.json(jimmysContact);
  });
  ```

6. Write a function called `wordToPigLatin()` that takes a single word as an argument and returns the Pig Latin translation. Here are some examples to get you started:

  ```js
  wordToPigLatin('happy');
  //=> 'appyhay'

  wordToPigLatin('duck');
  //=> 'uckday'

  wordToPigLatin('banana')
  //=> 'ananabay'
  ```

  **Bonus:** If a capitalized word is passed as an argument into `wordToPigLatin`, ensure that the returned string is also capitalized properly (e.g. `wordToPigLatin('Banana') //=> 'Ananabay'`)

  ```js
  var wordToPigLatin = function(word) {
    var firstLetter = word.substring(0, 1);
    var restOfWord = word.substring(1, word.length);
    return restOfWord + firstLetter + 'ay';
  };

  // bonus
  var wordToPigLatin = function(word) {
    var firstLetter = word.substring(0, 1);
    var restOfWord = word.substring(1, word.length);
    var newWord = restOfWord + firstLetter + 'ay';
    if (firstLetter === firstLetter.toUpperCase()) {
        return newWord.charAt(0).toUpperCase() + newWord.slice(1).toLowerCase();
    } else {
        return newWord;   
    }
  };
  ```
