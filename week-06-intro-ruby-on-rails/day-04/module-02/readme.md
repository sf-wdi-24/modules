# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Intro ActiveRecord

| Objectives |
| :--- |
| Fake data for testing in database |
| Seed the database |
| Work with inheritance in your models |
| Create models in ActiveRecord |

## Hacktive Record
In this lab you will learn how to create seed data and use a simplified ORM dubbed "HacktiveRecord" (a pun on "ActiveRecord" which you'll be using in Rails). We will be working with the `FFaker` gem and modeling our data using classes and inheritance.

### 1. Hello World
When you run `ruby 1_hello.rb` you should see the following printed to your terminal:

    "Hello, my name is Generic Student and I live at 123 Rudimentary Dr, Oakland California. I lurv geraniums!"

Modify the output to use __string interpolation__, and your own name, address, and most favoritest thing in the world.

Bonus: print it ten times.

### 2. Motivational Speakers
When you run `ruby 2_speakers.rb` you should see 10 lines of output, formatted like so:

    Reichel Theresia, giovani@gmail.com, 415-253-3253
    Botsford Vicenta, ernestine@gmail.com, 716-282-1443
    Waters Nayeli, annabel_walter@gmail.com, 415-793-2549
    ...


This output should _NOT_ be hardcoded. It should change for every run of the file!

To achieve this goal, you will need to familiarize yourself with the `ffaker` gem.

First, install the gems in your `Gemfile`. Simply run:  
```bash
bundle install
#or just
bundle
```

You can also install gems individually (e.g. `gem install ffaker`), but `bundle` is better in this case.

Now dive into <a href="https://github.com/ffaker/ffaker/blob/master/REFERENCE.md" target="_blank">FFaker's Documentation</a>!

#### Pro Tip: Requiring Gems & the Ruby Console
You're probably asking yourself, "how can I play with this ffaker data?". Why, in the Ruby Console of course!

To launch the REPL, type:

``` bash
irb
# or
pry
```

Then require the `ffaker` gem in the REPL:

``` ruby
require 'ffaker'
# your code here
```

But wait! We get all that for free if we just run:

``` bash
bundle console
# when we get to Rails, we'll use:
rails console
```

This will launch the Ruby REPL _AND_ require all the gems in our Gemfile.

For more info about `bundler`, try running `bundle --help`.

### 3. Motivational Talks
Printing to the terminal is all very nice, but we want to actually be able to play with the data. Let's convert our talks into _objects_. When you run `3_talks_data.rb` you should see something along the lines of:


    Speakers:
    {first: "Reichel", last: "Theresia", email: "giovani@gmail.com"}
    {first: "Botsford", last: "Vicenta", email: "ernestine@gmail.com"}
    {first: "Waters", last: "Nayeli", email: "annabel_walter@gmail.com"}
    ...

    Talks:
    {topic: "Organized secondary matrices", duration: 30}
    {topic: "Networked incremental focus group", duration: 45}
    {topic: "Optional cohesive middleware", duration: 60}
    ...


### 4. Model Speakers
Now let's take it up a notch. Instead of printing out objects, let's print out _instances_ of class `Speaker`. When I run `ruby 4_model_speakers.rb`, I expect to see the guts of our objects printed out like this:

    #<Speaker:0x007fa86225cfa8 @first_name="Herman", @last_name="Delia", @email="charlene@yahoo.com", @id=1>
    #<Speaker:0x007fa86225cc60 @first_name="Kessler", @last_name="George", @email="bernie@hotmail.com", @id=2>

You'll need to modify the code in `models/speaker.rb` so that you can do something like this in `4_model_speakers.rb`:

```ruby
puts Speaker.new({first: "Reichel", last: "Theresia", email: "giovani@gmail.com"})
```

### 5. Hacktive Record
Now we're going to play with a super-simplified version of Active Record I've dubbed "HacktiveRecord". HacktiveRecord will give our models the ability to `save`, `create` and find `all` records (or "instances") of our class.

Let's start by modifying our `Speaker` class so that it inherits from `HacktiveRecord::Base`.

``` ruby
require "./hacktive_record.rb"
class Speaker << HacktiveRecord::Base
end
```

Now, we have two options for saving our instances.

```ruby
reichel = Speaker.new({first: "Reichel", last: "Theresia", email: "giovani@gmail.com"})
reichel.save
```
or
```ruby
reichel = Speaker.create({first: "Reichel", last: "Theresia", email: "giovani@gmail.com"})
```

We can also query for `all` the records in our pretend "database":
```ruby
puts Speaker.all
```

**Stretch**: Can you model both a `Speaker` and a `Talk` object, using our simplified HacktiveRecord? (Hint: you may need to specify `speaker_id` on your talk objects so you know who they belong to!)

# Ready for Rails!
This has been a very light introduction to faking data, seeding your database, and working with models and inheritance. We're ready to dive into rails and work with ActiveRecord!

#### 1. Create a new rails application
**Make sure you're in a new project folder**
``` bash
rails new conference_app -T -d postgresql
cd conference_app
bundle
git init
git add . -A
git commit -m "inital commit, rails skeleton"
subl .
```

#### 2. Create a `Talk` model
``` bash
rails g model talk topic:string duration:integer
git diff # take a look at the files you just created!
```

And take a look at the following files:  
* `app/models/talk.rb`
* `db/migrate/1234566789_create_talks.rb`

#### 3. Setup your database
Download and Launch Postgres.app. You should see an elephant in your menu if it's running.

Next, create your application database:
```bash
rake db:create # create a new database on your machine
rake db:migrate # instruct your database what tables it needs to contain
```

#### 4. Launch the rails console and create your first talk!
```bash
rails console
# or
rails c
```

**Confirm that your model exists**  
```ruby
Talk
 #=> Talk(id: integer, topic: string, duration: integer, created_at: datetime, updated_at: datetime)
```

(You may need to "connect" to your database in the rails console. Just follow the instructions.)

**Create your first record**!
``` ruby
Talk.create({topic: "Playing with Models in the Rails Console"})
Talk.count
Talk.all
```

**Try the following:**  
* Create 3 new Talks in the Rails Console.
* Delete the last talk you created
* Find the first talk
* Find the last talk
* Search by id
* Search by title
* Sort by title
* Update the title of the last talk you created
* Delete all the talks you created.

**Pro-Tip**: Remember, when you're working in the console/repl `up-arrow` is your friend! (That and "hanging a dot" + "double-tabbing").

#### 5. Can you seed your database?
Take a look at `db/seed.rb`.

Add the following line:
```ruby
p "Hello from seed.rb"
```

Now run the following from your command line (not the console!):
```bash
rake db:seed
# Hello from seed.rb
```

The `seed.rb` file is magic, because it _already_ knows about all of the models and gems in your rails app. All you have to do is tell it what data to create!

**Can you seed your database with speaker and talks?**

**Bonus**: can you do it with the FFaker gem?

### Homework:

This evening you should go <a href="https://github.com/sf-wdi-24/rails-for-zombies" target="_blank">here</a> and complete all of the challenges.
