# Solutions

## Questions

1. What is the difference between Ruby and Ruby on Rails?
  * Ruby is a programming language and Rails is a framework for developing web applications built upon Ruby.
1. Can you tell me what the `self` keyword is used for in Ruby?
  * <a href="http://www.jimmycuadra.com/posts/self-in-ruby/" target="_blank">Gives access to the current object.</a>
1. What is a frustration you've had with the Ruby programming language?
1. Which testing libraries have you used in Ruby?
  * Any of the following are OK + others but don't lie.
    * rspec
    * minitest
    * cucumber
    * Test::Unit
1. Can you describe to me what this example code does `x ||= y` when `x` is `nil` and `y` is the number `2`?
  * Sets `x`'s value to be `2`.

## Challenge

We have a file filled with names and phone numbers. We need to get the list of phone numbers from the file.

Implement a program which will read the file and return a list of phone numbers. Assume we don't have access to any third-party Gems.

You can use this list as an example of what you'd find in the file.

```
Erik 867-5309
Frank 555-5309
Benk 555-5302
```

See <a href="https://coderpad.io/W4KP4FKT" target="_blank">the CoderPad link</a>.

Looking for the following aspects.

1. Asked relevant questions before starting.
  * Will there alway be a space separating the phone numbers?
  * Is it always a single name?
  * Do you expect the list of phone numbers returned is a string?
1. Comment on logic which might be confusing.
1. Legible variable and function names.
1. Separate code out to small functions.
1. Tested logic while developing.
1. Added exceptions for parsing logic.

File was written with following code and the following example solution to check it.

**NOTE** this code isn't considered as good as what Ben developed, why?

```ruby
def write_names_with_numbers(file_name, names_with_numbers)
  File.open(file_name, "w") do |fh|
    fh.puts names_with_numbers
  end
end

def get_numbers(file_name)
  numbers = []
  File.foreach(file_name) do |line|
    numbers << line.chomp.match(/^\w+\s+(?<phone_number>\d{3}-\d{4})$/)["phone_number"]
  end

  numbers
end

names_with_numbers = <<-EOF
Erik 867-5309
Frank 555-5309
Benk 555-5302
EOF

file_name = "./names-with-numbers.txt"
write_names_with_numbers(file_name, names_with_numbers)
p get_numbers(file_name)
```
