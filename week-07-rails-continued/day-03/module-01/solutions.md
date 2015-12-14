# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Practice Associations

## One-to-Many Challenges

*Solutions for Rails console portions:*

1. Create an item:

  ```ruby
  i = Item.create(name: "lamp", description: "desk lamp", price: 20)
  ```

2. Create an order:

  ```ruby
  o = Order.create
  ```

3. Associate item to order:

  ```ruby
  o.items << i
  ```

4. For one order, iterate through each of its items and print the item details to the console:

  ```ruby
  o.items.each do |item|
    puts "#{item.name}: #{item.description}, $#{item.price}"
  end
  ```

5. Map each item in your database to its name:

  ```ruby
  Item.all.map(&:name)
  ```

**Stretch:** Select only the items in an order that are less than a certain price:

  ```ruby
  o.items.where("price < ?", 30)
  ```

## Many-To-Many Challenges

*Solutions for Rails console portions:*

* Create actor, movie, and association:

  ```ruby
  arnold = Actor.create(first_name: "Arnold", last_name: "Schwarzenegger")
  terminator = Movie.create(title: "The Terminator", description: "science fiction film", year: 1984)
  terminator.actors << arnold

  # check associations
  terminator.actors
  arnold.movies
  ```
