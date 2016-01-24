# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Interview Workshop: Hash-Mapping - Solutions

## Sales Tax Calculator

```ruby
#
# Naive Solution:
# The "tax calculator" portion runs in O(n) time,
# because adding another "rule" requires our program
# to make an additional "check". The "if...else" logic
# could be greatly improved with a hash-map.
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

```ruby
#
# Solution with Hash-Mapping:
# The "tax calculator" portion runs in O(1) time,
# because we just need to look up the tax rule
# and import rule from the hash-maps.
#

def calculate_tax_rate product
  tax_rules = {
    book: 0.0,
    food: 0.0,
    medicine: 0.0,
    other: 0.1
  }

  import_rules = {
    import: 0.05,
    domestic: 0.0
  }

  tax_rate = 0.0
  tax_rate += tax_rules[product[:type]] + import_rules[product[:origin]]
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
