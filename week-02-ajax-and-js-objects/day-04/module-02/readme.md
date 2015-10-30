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

2. Set the constructor of the subclass to its constructor function. We need to do this, because the subclass's constructor was overwritten when the prototype was set to the superclass.

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

`object.hasOwnProperty('nameOfProperty')`

Always make sure the name of the property is in quotes. Properties of objects that inherit from other objects will also return true.

**Example:**

```js
var shirt = {
  size: 'M',
  color: 'blue'
}

shirt.hasOwnProperty(color);
//=> Uncaught ReferenceError: color is not defined(…)

shirt.hasOwnProperty('color');
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
shirt = new Shirt('M', 'blue', 28, 500);

product.hasOwnProperty('price');
//=> true

shirt.hasOwnProperty('size');
//=> true

shirt.hasOwnProperty('units');
//=> true
```

#### instanceOf

`object instanceOf Class`

**Exmaple:**

```js
var color = "green";

color instanceof String;
//=> true

String instanceof Object
//=> true
```

**Example with Inheritance:**

```js

function Person(name){
	this.name = name
}

Person.prototype.greet = function(){
	return "Hello, my name is " + this.name;
};

function Student(name, course){
	this.name = name;
	this.course = course;
};

Student.prototype = new Person
Student.prototype.constructor = Student;

p = new Person("bob")
s = new Student("tom")

s instanceof Person //returns true
p instanceof Student //returns false
Person instanceof Object //returns true
```

#### Quirk with instanceOf

Like we mentioned in the previous lecture, adding the word `new` when creating an object is essential. Let's look at these two examples

```js
var color1 = new String("green");
color1 instanceof String; // returns true

var color2 = String("green");
color2 instanceof String; // returns false
```

Let's examine these two using console.dir, what do you see?

### isPrototypeOf

This method is used a bit less prequently, but the syntax looks like this:

`Object.hasOwnProperty('nameOfProperty')`

Example:

```js
Object.prototype.isPrototypeOf(Function) // returns true
Boolean.prototype.isPrototypeOf(Number) // returns false
```

You can read more about the difference between isPrototypeOf and isInstanceOf [here](http://stackoverflow.com/questions/2464426/whats-the-difference-between-isprototypeof-and-instanceof-in-javascript)

## Resources

* <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain" target="_blank">Inheritance and the prototype chain</a>

[http://geekabyte.blogspot.com/2013/03/difference-between-protoype-and-proto.html](http://geekabyte.blogspot.com/2013/03/difference-between-protoype-and-proto.html)

[https://developer.mozilla.org/en-US/docs/Web/JavaScript/Introduction_to_Object-Oriented_JavaScript#Inheritance](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Introduction_to_Object-Oriented_JavaScript#Inheritance)
