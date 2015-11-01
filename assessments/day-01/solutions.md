# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> WDI 24 - Day 1 Assessment [SOLUTIONS]

**Instructions:** Do your best! Show your work - we’re more interested in your thought process and problem-solving skills than we are in exact syntax. Feel free to use code or "psuedo-code" (i.e. plain english).

1. Fill in the blank below. When executed, what will the last line of code evaluate to?

	```js
	var student_name = "Bob";
	var greeting = "Welcome to General Assembly, ";
	console.log(greeting + student_name + "!");
	```

  ```js
  // => "Welcome to General Assembly, Bob!"
  ```

2. Translate the following webpage into HTML (do not use any CSS styling).

	![screen shot 2015-10-21 at 14 23 34](https://cloud.githubusercontent.com/assets/7833470/10650638/6a178e82-77ff-11e5-87e6-507f65b63e53.png)

	```html
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>Document</title>
  </head>
  <body>
    <h1>WDI 24</h1>
    <h3>is awesome!</h3>
    <p>I'm such a sweet coder, check out my <a href="https://github.com/username">GitHub page</a>.</p>
    <p>I love <strong>puppies</strong>! Here is my favorite one:</p>
    <img src="puppy.jpg">
  </body>
  </html>
  ```

  **2.1** The HTML you just wrote can be described as having a “tree” structure. Draw a diagram which visualizes your HTML’s structure.

  ```
  - html
  - head
  - body
    - h1
    - h3
    - p
    - p
    - img
  ```

3. Given the below code, how would you get the value `30`?

	```js
	var ages = [26, 28, 30, 28, 17];
	```

  ```js
  ages[2];
  ```

4. Given the below code, how would you add the name "Michael Nesmith" to the monkeys?

	```js
	var monkeys = ["Peter Tork", "Micky Dolenz", "Davy Jones"];
	```

  ```js
  monkeys.push("Michael Nesmith");
  ```

	**4.1** How would you find the total number of band members?

	```js
  monkeys.length
  ```

5. Given the `combine` function below, what is the output of the following function calls:

	```js
	function combine (a, b) {
		return a + b;
	}

	// input			   //=> output

	combine("1", "2");     //=> "12"
	combine(4, 5); 	       //=> 9
	combine("8"); 	       //=> "8undefined"
	combine(2, 3, 4); 	   //=> 5

	var a = 1;
	var b = 7;
	var c = 19 + a;
	combine(c, a);	       //=> 21
	var x = combine(a, b);
	combine(x, b);	       //=> 15
	```

6. What is the output of the following code?

	```js
	var rainbowColors = ["red", "orange", "yellow", "green", "blue", "indigo", "violet"];

	for (var i = 0; i <= rainbowColors.length; i++) {
	  console.log(rainbowColors[i]);
	}
	```

  ```js
  //=> "red"
  //=> "orange"
  //=> "yellow"
  //=> "green"
  //=> "blue"
  //=> "indigo"
  //=> "violet"
	//=> undefined

	// note: `undefined` prints at the end, because the for loop goes through i <= rainbowColors.length (7). `rainbowColors[7]` is undefined.
	// we didn't mark it wrong if you missed the `undefined` part - that was tricky :)
  ```

7. Write a function called `evaluateTemp` that returns "warm" or "cool" depending on the temperature. Anything above 50 degrees is "warm", while anything 50 degrees or below is "cool".

	```js
  function evaluateTemp (temp) {
    if (temp > 50) {
      return "warm";
    } else {
      return "cool";
    }
  }
  ```

	**7.1** Based on the code you just wrote, what is the output of the following function calls:

	```js
	// input		//=> output

	evaluateTemp(30);  //=> "cool"
	evaluateTemp(50);  //=> "cool"
	evaluateTemp(70);  //=> "warm"
	```

8. Write a function called `findGreater` that takes two arguments and returns the greater of the pair.

  ```js
  function findGreater (num1, num2) {
    if (num1 > num2) {
      return num1;
    } else if (num2 > num1) {
      return num2;
    } else {
      return "The two numbers are equal";
    }
  }
  ```

	**8.1** Based on the code you just wrote, what is the output of the following function calls:

	```js
	// input			      //=> output

	findGreater(7, 0);        //=> 7
	findGreater(11, 11);      //=> "The two numbers are equal"

	var b = 010;
	var s = 100;
	findGreater(b, s) === b;  //=> false
	findGreater(s, 1) === s;  //=> true
	```

9. Name as many JavaScript data types as you can think of. **Bonus:** give an example of each!

  ```js
  // PRIMITIVE

  // string
  "web development"

  // number (integer or floating point)
  46, 9.87

  // boolean
  true, false

  // null (non-existent object)
  null

  // undefined (empty variable)
  undefined

  // REFERENCE

  // object
  {
    name: "Fluffy",
    species: "Unicorn",
    age: 4903
  }

  // array (technically an object)
  ["apple", "banana", "kiwi"]
  ```
