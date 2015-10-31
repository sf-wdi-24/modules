## Challenges

1. Create an `Animal` constructor with the properties `name`, `age`, `color`, and `sound`.

  ```js
  function Animal(name, age, color, sound) {
    this.name = name;
    this.age = age;
    this.color = color;
    this.sound = sound;
  }
  ```

2. Animals should have a method called `speak` which outputs the `sound` they make.

  ```js
  Animal.prototype.speak = function() {
    return this.sound;
  };
  ```

3. Create a `Cat` constructor with the same properties as `Animal` (bonus if you use the `call` method). Cats should also have a property called `isFluffy`.

  ```js
  function Cat(name, age, color, isFluffy) {
    Animal.call(this, name, age, color);
    this.sound = "meow";
    this.isFluffy = isFluffy;
  };
  ```

4. Implement prototypal inheritance with `Cat` as a subclass of `Animal`.

  ```js
  Cat.prototype = new Animal;
  Cat.prototype.constructor = Cat;
  ```

5. Create a new instance of `Cat` and make them speak!

  ```js
  cat = new Cat("Sprinkles", 3, "brown", true);
  //=> Cat {name: "Sprinkles", age: 3, color: "brown", sound: "meow", isFluffy: true}

  cat.speak();
  //=> "meow"
  ```

6. Check if the cat you just created is an `instanceof` `Cat`. How about an `instanceof` `Animal`?

  ```js
  cat instanceof Cat
  //=> true

  cat instanceof Animal
  //=> true
  ```

7. Start <a href="" target="_blank">tonight's homework</a>!

  * <a href="" target="_blank">apartment-oop (solution branch)</a>
