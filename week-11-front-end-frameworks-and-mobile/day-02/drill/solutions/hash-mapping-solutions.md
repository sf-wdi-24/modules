# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Interview Workshop: Hash-Mapping - Solutions

## Sales Tax Calculator

#### Solution 1:

```ruby
#
# Naive Solution:
# The "tax calculator" portion is not very DRY or modular,
# because adding another "rule" requires our program
# to make an additional "check". The "if...else" logic
# could be greatly improved with hash-maps.
#

def calculate_tax_rate product
  tax_rate = 0.0

  if (product[:type] != :book && product[:type] != :food && product[:type] != :medicine)
    tax_rate += 0.1
  end

  if (product[:origin] == :import)
    tax_rate += 0.05
  end

  tax_rate
end

def generate_receipt products
  receipt = {
    products: [],
    total_sales_tax: 0.0,
    total_price: 0.0
  }

  products.each do |product|
    tax_rate = calculate_tax_rate product

    tax_amount = product[:price] * tax_rate
    total_tax_amount = product[:quantity] * tax_amount

    price_with_tax = product[:price] + tax_amount
    total_price_with_tax = product[:quantity] * price_with_tax

    receipt[:products].push({
      name: product[:name],
      total_price_with_tax: total_price_with_tax,
      quantity: product[:quantity]
    })

    receipt[:total_sales_tax] += total_tax_amount
    receipt[:total_price] += total_price_with_tax
  end

  receipt[:products].each do |p|
    puts "#{p[:quantity]} #{p[:name]}: #{p[:total_price_with_tax]}"
  end

  puts "Sales Tax: #{receipt[:total_sales_tax]}"
  puts "Total: #{receipt[:total_price]}"

  receipt
end


#
# Sample Input
#

first_purchase = [
  {
    name: 'book',
    type: :book,
    price: 12.49,
    quantity: 1,
    origin: :domestic
  },
  {
    name: 'DVD',
    type: :other,
    price: 14.99,
    quantity: 1,
    origin: :domestic
  },
  {
    name: 'chocolate bar',
    type: :food,
    price: 0.85,
    quantity: 1,
    origin: :domestic
  }
]

second_purchase = [
  {
    name: 'imported box of chocolates',
    type: :food,
    price: 10.00,
    quantity: 1,
    origin: :import
  },
  {
    name: 'packet of cold medicine',
    type: :medicine,
    price: 9.75,
    quantity: 1,
    origin: :domestic
  },
  {
    name: 'imported bottle of perfume',
    type: :other,
    price: 47.50,
    quantity: 1,
    origin: :import
  },
  {
    name: 'bottle of perfume',
    type: :other,
    price: 18.99,
    quantity: 1,
    origin: :domestic
  }
]


#
# Test `generate_receipt` method
#

generate_receipt(first_purchase)
generate_receipt(second_purchase)
```

#### Solution 2:

```ruby
#
# Solution with Hash-Mapping:
# The "tax calculator" portion is now DRYer and more modular.
# We separate rules from logic by using the hash-maps.
#

def calculate_tax_rate product
  type_rules = {
    book: 0.0,
    food: 0.0,
    medicine: 0.0,
    other: 0.1
  }

  origin_rules = {
    import: 0.05,
    domestic: 0.0
  }

  tax_rate = 0.0
  tax_rate += type_rules[product[:type]] + origin_rules[product[:origin]]
  tax_rate
end

def generate_receipt products
  receipt = {
    products: [],
    total_sales_tax: 0.0,
    total_price: 0.0
  }

  products.each do |product|
    tax_rate = calculate_tax_rate product

    tax_amount = product[:price] * tax_rate
    total_tax_amount = product[:quantity] * tax_amount

    price_with_tax = product[:price] + tax_amount
    total_price_with_tax = product[:quantity] * price_with_tax

    receipt[:products].push({
      name: product[:name],
      total_price_with_tax: total_price_with_tax,
      quantity: product[:quantity]
    })

    receipt[:total_sales_tax] += total_tax_amount
    receipt[:total_price] += total_price_with_tax
  end

  receipt[:products].each do |p|
    puts "#{p[:quantity]} #{p[:name]}: #{p[:total_price_with_tax]}"
  end

  puts "Sales Tax: #{receipt[:total_sales_tax]}"
  puts "Total: #{receipt[:total_price]}"

  receipt
end


#
# Sample Input
#

first_purchase = [
  {
    name: 'book',
    type: :book,
    price: 12.49,
    quantity: 1,
    origin: :domestic
  },
  {
    name: 'DVD',
    type: :other,
    price: 14.99,
    quantity: 1,
    origin: :domestic
  },
  {
    name: 'chocolate bar',
    type: :food,
    price: 0.85,
    quantity: 1,
    origin: :domestic
  }
]

second_purchase = [
  {
    name: 'imported box of chocolates',
    type: :food,
    price: 10.00,
    quantity: 1,
    origin: :import
  },
  {
    name: 'packet of cold medicine',
    type: :medicine,
    price: 9.75,
    quantity: 1,
    origin: :domestic
  },
  {
    name: 'imported bottle of perfume',
    type: :other,
    price: 47.50,
    quantity: 1,
    origin: :import
  },
  {
    name: 'bottle of perfume',
    type: :other,
    price: 18.99,
    quantity: 1,
    origin: :domestic
  }
]


#
# Test `generate_receipt` method
#

generate_receipt(first_purchase)
generate_receipt(second_purchase)
```

#### Solution 3:

```ruby
#
# OOP Solution:
# We separate all functionality into modular classes
# and create objects that interact with each other.
#

class Tax
  TYPE_RULES = {
    book: 0.0,
    food: 0.0,
    medicine: 0.0,
    other: 0.1
  }

  ORIGIN_RULES = {
    import: 0.05,
    domestic: 0.0
  }
end

class Product
  attr_reader :name, :type, :price, :quantity, :origin

  def initialize name, type, price, quantity, origin
    @name = name
    @type = type
    @price = price
    @quantity = quantity
    @origin = origin
  end

  def tax_rate
    tax_rate = 0.0
    tax_rate += Tax::TYPE_RULES[type] + Tax::ORIGIN_RULES[origin]
    tax_rate
  end

  def tax_amount
    price * tax_rate
  end

  def total_tax_amount
    quantity * tax_amount
  end

  def price_with_tax
    price + tax_amount
  end

  def total_price_with_tax
    quantity * price_with_tax
  end
end

class Receipt
  attr_accessor :products, :total_sales_tax, :total_price

  def initialize
    @products = []
    @total_sales_tax = 0.0
    @total_price = 0.0
  end

  def generate purchased_products
    @products = purchased_products
    @total_sales_tax = @products.inject(0.0) { |total, p| total += p.total_tax_amount }
    @total_price = @products.inject(0.0) { |total, p| total += p.total_price_with_tax }
    self
  end

  def print
    products.each do |p|
      puts "#{p.quantity} #{p.name}: #{p.total_price_with_tax}"
    end

    puts "Sales Tax: #{total_sales_tax}"
    puts "Total: #{total_price}"

    self
  end
end


#
# Sample Input
#

first_purchase = [
  Product.new('book', :book, 12.49, 1, :domestic),
  Product.new('DVD', :other, 14.99, 1, :domestic),
  Product.new('chocolate bar', :food, 0.85, 1, :domestic)
]

second_purchase = [
  Product.new('imported box of chocolates', :food, 10.00, 1, :import),
  Product.new('packet of cold medicine', :medicine, 9.75, 1, :domestic),
  Product.new('imported bottle of perfume', :other, 47.50, 1, :import),
  Product.new('bottle of perfume', :other, 18.99, 1, :domestic)
]


#
# Test Receipt Class
#

Receipt.new.generate(first_purchase).print
Receipt.new.generate(second_purchase).print
```

## FizzBuzz

#### Solution 1:

```ruby
#
# Naive Solution:
# The program is not very DRY or modular, because adding
# another "rule" requires our program to make an additional "check".
# The "if...else" logic could be greatly improved with a hash-map.
#

(1..100).each do |num|
  if (num % 15 == 0)
    puts "FizzBuzz"
  elsif (num % 5 == 0)
    puts "Buzz"
  elsif (num % 3 == 0)
    puts "Fizz"
  else
    puts num
  end
end
```

#### Solution 2:

```ruby
#
# Solution with Hash-Mapping:
# The program is now DRYer and more modular.
# We separate rules from logic by using the hash-map.
#

def fizz_buzz num
  rules = {
    'FizzBuzz': num % 15 == 0,
    'Buzz': num % 5 == 0,
    'Fizz': num % 3 == 0
  }
  rules.key(true) || num
end

(1..100).each do |num|
  puts fizz_buzz num
end
```

#### Solution 3:

```ruby
#
# Another Solution with Hash-Mapping:
# The program is now very flexible, allowing us to
# easily combine rules.
#

def fizz_buzz(range, rules)
  range.each do |num|
    result = ''
    rules.each do |text, divisor|
      if num % divisor == 0
        result << text.to_s
      end
    end
    if result == ''
      result = num
    end
    puts result
  end
end

range = (1..100)
rules = {
  'Fizz': 3,
  'Buzz': 5,
  'Zazz': 10
}

fizz_buzz(range, rules)
```
