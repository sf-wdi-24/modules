### Strings

1. Store your first name in a variable.

  ```js
  var firstName = "Sally";
  ```

2. Concatenate your first name with your last name, and store the result in another variable.

  ```js
  var fullName = firstName + " Smith";
  ```

3. Use the <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split" target="_blank">`split`</a> method to turn your string variable from challenge #2 into an array.

  ```js
  fullName.split();
  ```

4. Use the <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof" target="_blank">`typeof`</a> method to show how the output of the `split` operation from challenge #3 is different from the input.

  ```js
  typeOf(fullName);
  //=> "string"

  typeOf(fullName.split());
  //=> "object"
  ```

### Arrays

1. Find the fourth name in the following array:

  ```js
  var friends = [
    "Moe",
    "Larry",
    "Curly",
    "Jane",
    "Emma",
    "Elizabeth",
    "Greg",
    "Lydia"
  ];
  ```

  ```js
  friends[3];
  //=> "Jane"
  ```

2. Change the name "Elizabeth" to "Liz" in the friends array.

  ```js
  friends[5] = "Liz";
  ```

3. Add your name to the end of the `friends` array, and add another name to beginning.

  ```js
  friends.push("George");
  friends.unshift("Kristy");
  ```

4. Sort the `friends` array in alphabetical order.

  ```js
  friends.sort();
  ```

5. Now we have two lists of friends below. Combine them into one list and sort them.

  ```js
  var myFriends = [
    "Rickon",
    "Meera",
    "Hodor",
    "Jojen",
    "Osha",
    "Rickard",
    "Maester"
  ];

  var yourFriends = [
    "Bilbo",
    "Boromir",
    "Elrond",
    "Faramir",
    "Frodo",
    "Gandalf",
    "Legolas",
    "Pippin"
  ];
  ```

  ```js
  myFriends.concat(yourFriends).sort();
  ```

### Object Literals

1. How would you represent the following data using an object literal? Then update John's address to "1234 Park Ln".

  ```
  John, Doe, 36, 1234 Park St.
  ```

  ```js
  var john = {
    firstName: "John",
    lastName: "Doe",
    age: 36,
    address: "1234 Park St."
  }
  ```

2. How would you represent the following data using a combination of object literals and arrays?

  ```
  Jane, Doe, 32, 1239 Spark St.
  Mary, Doe, 31, 1231 Spark St.
  Greg, Doe, 34, 1214 Park St.
  Harriet, Doe, 32, 1324 Park St.
  ```

  ```js
  var people = [
    {
      firstName: "Jane",
      lastName: "Doe",
      age: 32,
      address: "1239 Spark St."
    },
    {
      firstName: "Mary",
      lastName: "Doe",
      age: 31,
      address: "1231 Spark St."
    },
    {
      firstName: "Greg",
      lastName: "Doe",
      age: 34,
      address: "1214 Park St."
    },
    {
      firstName: "Harriet",
      lastName: "Doe",
      age: 32,
      address: "1324 Park St."
    }
  ]
  ```

## Stretch Challenges

1. I have a list of favorite foods below. If "Popcorn" is my favorite food and "Potato chips" my second favorite, how would you find the rank of another food. Try "Pho". **Hint:** Look up the `indexOf` array method.

  ```js
  var foods = [
    "Popcorn",
    "Potato chips",
    "Shrimp",
    "Tacos",
    "French toast",
    "Crab",
    "Pho",
    "Lasagna",
    "Brownie",
    "Lobster",
    "Donuts",
    "Ice cream",
    "Hamburger",
    "Sushi",
    "Chocolate",
    "Pizza"
  ];
  ```

  ```js
  foods.indexOf("Pho");
  //=> 6
  ```

2. I made a mistake with my favorite foods. How can I find the index of "Donuts" and remove it? **Hint:** Look up the `splice` array method.

  ```js
  var donutsIndex = foods.indexOf("Donuts");
  foods.splice(donutsIndex, 1);
  ```

3. My friends want to know what my 5th to 10th favorite foods are. **Hint:** Look up the `slice` array method.

  ```
  foods.slice(4, 10);
  ```

4. How would you sort the list of names below? **Hint:** Use string and array methods.

  ```js
  var friends = "Moe,Larry,Curly,Jane,Emma,Elizabeth,Greg,Lydia";
  ```

  ```js
  friends.split(",").sort();
  ```