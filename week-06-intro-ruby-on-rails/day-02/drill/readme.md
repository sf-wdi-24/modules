# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Regex

# Regular Expressions

<img src="http://stream1.gifsoup.com/view4/2239283/homer-bird-o.gif">

> You can't grep dead trees <a href="http://jargon.net/jargonfile/d/documentation.html" target="_blank">Jargonfile</a>

Regular expressions were designed because programmers are lazy.

We've been matching patterns in strings often in class so let's try to see if the word `hello` exists in an example string. Let's do it without using regular expressions, just using pseudo code.

How would we do this?

It isn't impossible, but it's quite a bit of work.

Let's then say instead of `hello` we're looking for misspellings of `hello` which include `He11o` and `Hell0`. This starts to get tricky fast and that's where regular expressions come into play.

## Regular Expressions in Ruby

<a href="http://ruby-doc.org/core-2.2.0/Regexp.html" target="_blank">Ruby Regexp</a>

Regular expressions (**regex**) are patterns which describe the contents of a string. They’re used for testing whether a string contains a given pattern or for extracting the portions that match. Common examples of regex are "find-and-replace" operations and string format validation (i.e. phone numbers or email addresses).

Many programming languages have regexp capabilities built-in, including JavaScript and Ruby. Luckily, regex pattern syntax is fairly consistent across languages. Today we'll use regex patterns to match string patterns in Ruby.

## Defining and Matching

Regex patterns are bounded by forward-slashes (`/`). **For example:**

```ruby
/hello/   
```

To test if a string matches the pattern of a regexp, we use `.match`. **For example:**

```ruby
# returns match data if any
/san/.match("san francisco") #=> #<MatchData "san">

# returns nil if no match data
/san/.match("San Francisco") #=> nil
```

## Basic Regexp Patterns

For a more complete list of basic regex patterns, see <a href="http://rubular.com" target="_blank">Rubular's Regex quick reference</a>.

```ruby
/[abc]/ # matches a single character from the set: 'a', 'b', or 'c'

/\A/ # matches start of string

/\s/ # matches any whitespace character

/\d/ # matches any digit (number)

/(a|b)/ # matches 'a' or 'b'
```

<details>
  <summary>What does `\w` match?</summary>

  Any word character (letter, number, underscore).
</details>

## Challenges

Use <a href="http://rubular.com" target="_blank">Rubular</a> for all challenges *except* Base Challenge #1.

### Base Challenges

1. In the terminal, type `irb` (you're now in the ruby console!). Type `/hello world/.class`. What does it return?

2. Write a regexp to match instances of "regex" in the text below. Copy and paste the text (including the HTML tags!) into Rubular as the test string.

  ```html
  <p>A Regular Expression (regex or regexp for short) is a special text string for describing a search pattern.
  You can think of regular expressions as <span>wildcards</span> on steroids. You are probably familiar with wildcard
  notations such as *.txt to find all text files in a file manager. The regex equivalent is <span>\.txt\</span></p>
  <a href="tel:867-5309">Call the RegEx Experts if you get lost.</a>
  <a href="mailto:theregexexperts@example.com">The RegEx Experts</a>
  ```

3. With the same test string (text above), write a regexp to match instances of "regex", "regexp", or "regular expression".

4. Edit the regexp you just wrote to make sure it's case-insensitive (i.e. it should match "Regular Expression" as well as "regular expression").

5. Match any phone numbers in the HTML like "867-5309".

6. Match any email addresses in the HTML.

### Real World Challenge

* [Parse Log Files](http://www.codewars.com/kata/parse-the-log)
