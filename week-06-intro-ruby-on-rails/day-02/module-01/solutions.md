# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60">  Solutions

```ruby
# Full name
def full_name(first, last)
  "#{first} #{last}"
end

full_name("WDI", "19/20")

# Challenge Set 1: Primes
def is_prime?(num)
  if num > 1
    (2..(num-1)).each do |i|
        if num % i == 0
          return false
        end
    end

    true
  else
    false
  end
end

puts is_prime?(19)

def primes_up_to(num)
  primes = []
  if num > 1
    (2..num).each do |i|
      if is_prime?(i)
        primes.push(i)
      end
    end
  end
  primes
end

p primes_up_to(17)

# Challenge Set 2: Command Line Interaction

def get_contact(contacts)
  puts "What is your name?"
  name = gets.chomp
  puts "What is your phone number?"
  phone = gets.chomp.to_i
  if not contacts[name]
    contacts[name] = phone
  end
  contacts
end

puts get_contact({"Bill"=>4, "Jenny"=>8675309})

# @NOTE since I want the keys to be strings (above), 
# I have to use "hash rocket" (=>) notation.
# Otherwise ruby will convert these names to symbols.
 

# Using Array#map, write a method called get_responses 
# that takes an array of questions (strings) 
# and returns an array of responses input from the console 
# for each question.

def get_responses(questions)
  questions.map do |question| 
    puts question
    gets.chomp
  end
end

puts get_responses(["Who's a good dog?", "What's that you're eating!?"])

# without Array#map
# def get_responses(questions)
#   responses = []
#   for question in questions
#     puts question
#     response = gets.chomp
#     responses.push(response)
#   end
#   responses
# end
```

## HTTParty Challenges

```ruby
# 4. Let's have an [HTTParty](https://github.com/jnunemaker/httparty)!

#5. Install the httparty gem ```$ gem install httparty```.

#6. Now require it in a new ruby script file, and use it to call an album search on the word "White" to the spotify API.
require 'httparty'

response = HTTParty.get('https://api.spotify.com/v1/search?q=White&type=album')
p response

#7. Can you require both ```httparty``` and ```awesome_print``` to have the output look nice? (remember just require awesome_print and then use ```ap``` instead of ```p```)
require 'httparty'
require 'awesome_print'

response = HTTParty.get('https://api.spotify.com/v1/search?q=White&type=album')
ap JSON.parse(response.body)

#5. In the same file, can you write a loop that returns an array of the album names from your search?
require 'httparty'
require 'awesome_print'

response = HTTParty.get('https://api.spotify.com/v1/search?q=White&type=album')
body =  JSON.parse(response.body)
body["albums"]["items"].each do |a|
  ap a["name"]
end
```
