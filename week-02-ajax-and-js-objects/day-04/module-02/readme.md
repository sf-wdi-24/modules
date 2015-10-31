# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> JavaScript Prototypal Inheritance

## Review: Constructors & Prototypes

In JavaScript, we don't have classes, so we use constructor functions and prototypes to create them. Prototypes are the building blocks of objects. When we create a new "class", we can attach attributes and methods to the prototype (as a better alternative to adding them in the constructor function to save memory).

```js
function Person(name) {
  this.name = name;
}

Person.prototype.greet = function() {
  return "Hello, my name is " + this.name;
};
```

## Prototypal Inheritance

Objects can inherit properties and methods from other objects. In JavaScript, we use prototypes to do this, and the process is called inheritance. The formal term for this inheritance via prototypes is called prototypal inheritance.

### Setting Up Inheritance

1. Set the prototype of the subclass (the class that will get methods and properties from its parent, which is also known as the superclass) to a new instance of the superclass.

2. Set the constructor of the subclass to its constructor function. We need to do this, because the subclass's constructor gets overwritten when we set the prototype to an instance of the superclass.

```js
function Person(name) {
  this.name = name;
}

Person.prototype.greet = function() {
	return "Hello, my name is " + this.name;
};

function Student(name, course) {
	this.name = name;
	this.course = course;
};

// set prototype of subclass to new instance of superclass
Student.prototype = new Person;

// set constructor of subclass to its constructor function
Student.prototype.constructor = Student;
```

Why do we reset the constructor? Let's look at an example:

```js
var student = new Student("Tim", "WDI");

// if we DID NOT reset the constructor
student.constructor
//=> Person(name) {
//   this.name = name;
// }

// resetting the constructor makes sure every
// student instance returns the Student constructor
student.constructor
//=> Student(name, course) {
//   this.name = name;
//   this.course = course;
// }
```

Read more about resetting the constructor on <a href="http://stackoverflow.com/questions/8453887/why-is-it-necessary-to-set-the-prototype-constructor" target="_blank">Stack Overflow</a>.

### Useful Methods

#### hasOwnProperty

`object.hasOwnProperty("nameOfProperty")`

Always make sure the name of the property is in quotes. Properties of objects that inherit from other objects will also return true.

**Example:**

```js
var shirt = {
  size: "M",
  color: "blue"
}

shirt.hasOwnProperty(color);
//=> Uncaught ReferenceError: color is not defined(…)

shirt.hasOwnProperty("color");
//=> true
```

**Example with Inheritance:**

```js
function Product(price, units) {
	this.price = price;
  this.units = units;
}

Product.prototype.sell = function(unitsSold) {
	this.units -= unitsSold;
};

function Shirt(size, color, price, units) {
	this.size = size;
	this.color = color;
  Product.call(this, price, units);
};

Shirt.prototype = new Product;
Shirt.prototype.constructor = Shirt;

product = new Product(56, 100);
shirt = new Shirt("M", "blue", 28, 500);

product.hasOwnProperty("price");
//=> true

shirt.hasOwnProperty("size");
//=> true

shirt.hasOwnProperty("units");
//=> true
```

#### instanceOf

`object instanceOf Class`

**Exmaple:**

```js
var color = "green";

color instanceof String;
//=> true

String instanceof Object;
//=> true
```

**Example with Inheritance:**

```js
product = new Product(56, 100);
shirt = new Shirt("M", "blue", 28, 500);

shirt instanceof Product;
//=> true

product instanceof Shirt;
//=> false

Product instanceof Object;
//=> true
```

Using the word `new` when creating an object is essential. Let's look at these two examples using `instanceof`:

```js
var color1 = new String("green");
color1 instanceof String;
//=> true

var color2 = String("green");
color2 instanceof String;
//=> false
```

### isPrototypeOf

This method is used a bit less frequently, but the syntax looks like this:

`Object.prototype.isPrototypeOf(object)`

**Example:**

```js
Object.prototype.isPrototypeOf(Function);
//=> true

Boolean.prototype.isPrototypeOf(Number);
//=> false
```

Read about the difference between `instanceof` and `isPrototypeOf` on <a href="http://stackoverflow.com/questions/2464426/whats-the-difference-between-isprototypeof-and-instanceof-in-javascript" target="_blank">Stack Overflow</a>.

## Challenges

*Use the Chrome JavaScript console or a snippet for challenges 1-5.*

1. Create an `Animal` constructor with the properties `name`, `age`, `color`, and `sound`.
2. Animals should have a method called `speak` which outputs the `sound` they make.
3. Create a `Cat` constructor with the same properties as `Animal` (bonus if you use the `call` method). Cats should also have a property called `isFluffy`.
4. Implement prototypal inheritance with `Cat` as a subclass of `Animal`.
5. Create a new instance of `Cat` and make them speak!
6. Check if the cat you just created is an `instanceof` `Cat`. How about an `instanceof` `Animal`?
7. Start <a href="" target="_blank">tonight's homework</a>!

## Resources

* <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Introduction_to_Object-Oriented_JavaScript" target="_blank">Intro to Object Oriented JavaScript</a>
* <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain" target="_blank">Inheritance and the prototype chain</a>
* <a href="http://geekabyte.blogspot.com/2013/03/difference-between-protoype-and-proto.html" target="_blank">Difference Between Prototype and proto</a>
