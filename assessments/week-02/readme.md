# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> WDI 24 - Week 2 Assessment

### DOM Manipulation

Use this HTML for the following questions:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Site</title>
</head>
<body>
  <nav>
    <ul>
      <li><a href="/">Home</a></li>
      <li><a href="/about">About</a></li>
      <li><a href="/contact">Contact</a></li>
    </ul>
  </nav>
  <div class="section">
    <h1>Welcome to my site!</h1>
    <img src="cheese.jpg">
    <p>Words and <a href="/">links</a></p>
  </div>
  <div class="footer">
    <small>Copyright 2015 WDI 24</small>
  </div>
</body>
</html>
```

**Using jQuery...**

1. Replace "Welcome to my site!" with "Hello World!"

  <br>
  <br>
  <br>
  <br>
  <br>

2. Replace the current image with this image: "earth.jpg"

  <br>
  <br>
  <br>
  <br>
  <br>

3. Add a new link to the nav that points to the "/blog" section of the website.

  <br>
  <br>
  <br>
  <br>
  <br>

4. When a user clicks on one of the `nav` links, do not redirect them. Instead, trigger an `alert` that says "Sorry, this page is under construction". **Bonus:** Display the page name ("Home", "About", etc.) in the alert.

  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>

### JavaScript OOP

1. Create a JavaScript object constructor for a `Person`. Every instance of `Person` should have the following properties:
  * first name
  * last name
  * number of siblings
  * states lived in

  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>

2. Using your `Person` constructor, create a `greet` method that returns a string, e.g. "Hi, my name is Steve Wozniak and I have 3 siblings!"

  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>

3. Create a new instance of `Person`, and demonstrate how you would call the `greet` method.

  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>

4. Create a method called `placesLived` that prints all the states a person has lived in, one per line.

  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>

### AJAX

1. Name and describe the parts of the following URL:

  <br>
  <br>
  <br>

  **https://www.youtube.com/watch?v=y8Kyi0WNg40&t=1s**

  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>

2. Juggler Supply Co. has an api with the following documentation:

  **API Endpoint:** http://jugglersupply.co

  **Search:** Returns all matching juggling supply products.
    * Path: `/api/supplies/search`
    * Parameters:
      * `q` - search query term or phrase.
      * `limit` - (optional) number of results to return. Default 10.
      * `offset` - (optional) results offset. Default 0.
      * `danger` - (optional) limit results to supplies with this danger level (`safe`, `medium`, `superdanger`).
    * Example response:
      ```js
      { "data": [
        { "name": "Simple Balls", "danger": "medium"},
        { "name": "Deceptively Simple Balls", "danger": "superdanger"}
      ] }
      ```

  **Random:** Returns a random juggling supply product.
    * Path: `/api/supplies/random`
    * Example response:
      ```js
      { "data": { "name": "Bunnies", "danger": "medium" } }
      ```

  **Top:** Returns the most popular juggling supply products.
    * Path: `/api/supplies/top`
    * Parameters:
      * `limit` - (optional) number of results to return. Default 2.
      * `danger` - (optional) limit results to supplies with this danger level (`safe`, `medium`, or `superdanger`)
	  * Example response:
      ```js
      { "data": [
        { "name": "Frank’s Flaming Knives", "danger": "superdanger" },
        { "name": "Hilda’s Hackeysacks", "danger": "safe" }
      ]}
      ```

  Give a jQuery code example of how a front-end developer would request the top 5 juggling supply products. **Bonus:** Use the response data to render a list of product names to the body of the page.

  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
