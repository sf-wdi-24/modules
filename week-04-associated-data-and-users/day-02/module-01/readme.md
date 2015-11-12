# Intro Auth (Authentication & Authorization)

| Objectives |
| :--- |
| Explain why authentication and authorization are important on the web. |
| Hide information using a Hash. |
| Send encrypted messages to classmates. |

<img src="http://33.media.tumblr.com/0f97d9c51b55f94e996a4a91b2556692/tumblr_netd6eCmY51qzgltlo1_500.gif" title="Trust">

> It's about trust. Establishing trust between two strangers across the Internet.

## Authentication and authorization

What is the difference between authentication and authorization?

* **Authentication** verifies that a user is who they say they are. When a user logs into our site, we *authenticate* them by checking that the password they typed in matches the password we have stored for them.
* **Authorization** is the process of determining whether or not a user has *permission* to perform certain actions on our site. For example, a user may *be authorized* to view their profile page and edit their own blog posts, but not to edit another user's blog posts.


## Implementing authentication

To give users the ability to sign up and log in to our site, we'll need these pages.

* Signup
  * Make a signup form
  * Submit email and password to a server route
  * Save a new user with a secure password

* Login
  * Make a login form
  * Submit email and password to a server route
  * Check that user's email exists in database
  * Authenticate that the password is correct for that user
  * Save that user's data in a session on our server
 
* Logout
  * Delete any saved user data in our session

We won't create all these right now but this is a typical authentication flow.

## Group authentication flow

Now we'll get in a group of 2-3.

In your group, we're going to look over the auth flow (authentication flow) for a new and existing user on a major website.

Speak with others in your group and find the site your going to investigate. Once you have the site's name, add it to the board (it must be unique in the class).

In your group, record all the steps required in creating your user and anything unique you saw in the process. An example of something unique is "when I signed up to AirBnB they asked if I rent or own my home".

Take a screenshot of each stage as you create and login as a new user. (<a href="http://lmgtfy.com/?q=take+a+screenshot+on+mac" target="_blank">how to take screenshots on mac</a>)

After all the groups are done, we will go over each step together showing different auth flows in front of the class.

## Some interesting notes

Did anyone notice authentication flows often use `https` in the URL instead of `http`. Any ideas why?

Let's speak about SSL/TLS which starts with an exchange of trust. It is a complex process which we will model in the class with three brave volunteers.

## Encryption

Using the information from SSL/TLS we can thwart random people listening in to our conversation. There is a name for the creepy person listening in on a conversation (<a href="https://en.wikipedia.org/wiki/Man-in-the-middle_attack" target="_blank">Man in the middle</a>).

We can try this ourselves on a smaller scale. Let's do a little encryption/decryption in JavaScript using AES with <a href="http://jsfiddle.net/eerwitt/Lrdaprat/" target="_blank">this fiddle</a>.

Sometimes, we don't need to decrypt something but we want to make sure the information is what we expect it to be. We call this "one way hashing".

## Why do we hash (and salt) passwords?

In order to authenticate a user, we need to store their password in our database. This allows us to check that the user typed in the correct password when logging into our site.

The downside is that if anyone ever got access to our database, they would also have access to all of our users' login information. We use a <a href="https://crackstation.net/hashing-security.htm#normalhashing" target="_blank">hashing algorithm</a> to avoid storing plain-text passwords in the database. We also use a <a href="https://crackstation.net/hashing-security.htm#salt" target="_blank">salt</a> to randomize the hashing algorithm, providing extra security against potential attacks.

Lot's of major corporations have been caught keeping "plain text passwords" which have proved horrid for those people who don't want their identity stolen.

Using a hash, we can use a mathematic trick to validate the password someone is sending to be the same as what we have already.

<details>
  <summary>How do we use one way hashing to validate passwords?</summary>

  A client sends a password to the server over a secure channel, the server runs a hashing algorithm over the password including a salt then checks if the hashed value is the same as that which is recorded in the database. If the hash is different then the passwords don't match, the same password sent twice to a hash with the same salt will result in the same hash value.
</details>

## Challenges

Research and explain the following types of attacks to one other person from class. How can you avoid these attacks while working with express applications?

* [Cross-site Scripting](https://en.wikipedia.org/wiki/Cross-site_scripting)
* [SQL Injection](https://en.wikipedia.org/wiki/SQL_injection)
