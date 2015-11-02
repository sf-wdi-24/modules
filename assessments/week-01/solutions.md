# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> WD1 24 - Week 1 Assessment [SOLUTIONS]

### CSS

1. Illustrate the CSS box-model.

  ![css-box-model](https://cloud.githubusercontent.com/assets/7833470/10652377/0b29129a-780b-11e5-9485-776aa418c3e4.gif)

2. Using the HTML below, write CSS styles so that the image has 20px of padding, a solid blue border of 3px, and a margin of 10px.

  ```html
  <img id="mona-lisa" src="monaLisa.jpg">
  ```

  ```css
  #mona-lisa {
    border: 3px solid blue;
    margin: 10px;
    padding: 20px;
  }
  ```

3. What are the three ways to implement CSS styles? Which way is best and why?

  ```
  inline, internal, and external
  external is best b/c of separation of concerns
  ```

4. Which combination of CSS selectors is the **most** specific?

  a.&nbsp;&nbsp;`.content#about`

  **b.**&nbsp;&nbsp;`.container div.content#about`

  c.&nbsp;&nbsp;`#about`

  d.&nbsp;&nbsp;`div.content#about`

### jQuery

1. In your own words, what is jQuery? Why is it useful?

  ```
  jQuery is a JavaScript library. It makes things like DOM manipulation, event-handling,
  and animation much simpler and resolves a lot of browser incompatibility issues.
  ```

2. Using jQuery, how would you select an anchor tag (`<a>`) with the class `.active`?

  ```js
  $('a.active')
  ```

### Array Methods

1. For the following team...

  ```js
  var playersEast = [
    "Bismo Funyuns",
    "Decatholac Mango",
    "Mergatroid Skittle",
    "Quiznatodd Bidness",
    "Quackadilly Blip"
  ];
  ```

  "Goolius Boozler" is a new recruit. Add him to `playersEast`!

  ```js
  playersEast.push("Goolius Boozler");
  ```

2. For the same team above, "Mergatroid Skittle" has been injured. Using array methods, replace him with "Bisquiteen Trisket".

  ```js
  var index = playersEast.indexOf("Mergatroid Skittle");
  playersEast.splice(index, 1, "Bisquiteen Trisket");
  ```

  ```js
  // OR give 1/2 point for this answer
  playersEast[2] = "Bisquiteen Trisket";
  ```

3. But wait, there’s another team!

  ```js
  var playersWest = [
    "Equine Ducklings",
    "Dahistorius Lamystorius",
    "Ewokoniad Sigourneth JuniorStein",
    "Eqqsnuizitine Buble-Schwinslow",
    "King Prince Chambermaid",
    "Ladennifer Jadaniston"
  ];
  ```

  We need to combine all of the players from `playersEast` and `playersWest` and sort them alphabetically.

  ```js
  playersEast.concat(playersWest).sort();
  ```

### Global & Local Scope

1. In the below code, what is the value of `finalResult`?

  ```js
  var a = 3;
  function add (num) {
     a = 1;
     var result = num + a;
     return result;
  }

  var finalResult = add(5);
  ```

  ```js
  //=> 6
  ```

2. Now what is the value of `finalResult`?

  ```js
  var a = 3;
  function add (num) {
     var a = 2;
     var result = num + a;
     return result;
  }

  var finalResult = add(4) + a;
  ```

  ```js
  //=> 9
  ```

### Functions

1. Write a function that takes in a number and determines if that number is divisible by three, but not by six. (e.g. 3 and 9 would pass this test; 6 and 12 would not)

  ```js
  function threeNotSix (num) {
    if (num % 3 === 0 && num % 6 !== 0) {
      return true;
    } else {
      return false;
    }
  }
  ```
