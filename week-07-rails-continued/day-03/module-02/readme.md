# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Rails Asset Pipeline

| Objectives |
| :--- |
| Describe how the Rails Asset Pipeline works and why we use it. |
| Require custom and third-party assets in Rails. |
| Precompile assets for running in production. |

## Asset Pipeline Overview

**The goal of the asset pipeline is to:**

* Compress assets (CSS, JavaScript, and images) so they are as small as possible, since smaller files load faster
* Reduce the number of files transferred to the client, by:
  * Combining files before sending them to the browser
    * All CSS files are combined into a single `application.css` file
    * All JavaScript files are combined into a single `application.js` file
  * Caching files in the browser

#### Remember this?

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Load all the things!</title>
</head>
<body>
  <script type="text/javascript" src="vendor/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="vendor/handlebars-v4.0.5.js"></script>
  <script type="text/javascript" src="application.js"></script>
</body>
</html>
```

That's three different requests to the server, for three different JavaScript files. Ouch! There's got to be a better way!

## Caching

Your application can be configured to "cache" common JavaScript and CSS files in the client's browser.

Cached files don't need to be requested *on every page load*. They're already there, ready to go, meaning **less wait time** and **faster page loads**.

But how does the browser know when to update a cached file? What if you changed the file and the browser is using an older version?

We need a way to "bust" the cache!

#### Cache-Busting with Fingerprints

In Rails, assets are given a "fingerprint" that changes every time the file is updated (almost like a timestamp).

For example, the `application.js` file with a fingerprint looks like this: `application-908e25f4bf641868d8683022a5b62f54.js`.

**Cache-busting works like this:**

* If the fingerprint is the same, the browser simply uses its cached copy.
* If the fingerprint has changed, the browser requests the new version of the file (and then caches it!).

## Compression / Minification / Uglification

What's the difference between <a href="https://code.jquery.com/jquery-1.11.3.js" target="_blank">jquery-1.11.3.js</a> and <a href="https://code.jquery.com/jquery-1.11.3.min.js" target="_blank">jquery-1.11.3.min.js</a>?

Let's do a quick comparison on the command line:

```zsh
# uncompressed jQuery file
➜  curl https://code.jquery.com/jquery-1.11.3.js | wc
#   lines   words   bytes
#   10351   43235   284394

# compressed (minified) jQuery file
➜  curl https://code.jquery.com/jquery-1.11.3.min.js | wc
#   lines   words   bytes
#   5       1413    95957
```

## What about CDNs?

A CDN is a "content delivery network" and a handy way to deliver common "vendor" or "third-party" libraries to your application. It's common to use a CDN for jQuery, Bootstrap, Handlebars, etc.

But is it fast?

If a common file, like jQuery is delivered via CDN it is likely:

  1. Cached in your browser.
  2. Cached by your ISP (Internet Service Provider).
  3. Dispatched from a nearby server.

But is that faster than just sending one JavaScript file from your own server?

It could be! You'll have to make a decision about whether you want to host third-party libraries (like jQuery), or if you want to use a public CDN.

## How the Rails Asset Pipeline Works

#### Remember this?

How we used to require files (manually):

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Load all the things!</title>
</head>
<body>
  <script type="text/javascript" src="vendor/jquery-1.11.3.min.js"></script>
  <script type="text/javascript" src="vendor/handlebars-v4.0.5.js"></script>
  <script type="text/javascript" src="application.js"></script>
</body>
</html>
```

How Rails requires files (using the asset pipeline):

```html
<!DOCTYPE html>
<html>
<head>
  <%= csrf_meta_tags %>
  <!-- application stylesheet -->
  <%= stylesheet_link_tag :application, media: :all %>
  <title>Rails Asset Pipeline!</title>
</head>
<body>
  <!-- application javascript file -->
  <%= javascript_include_tag :application %>
</body>
</html>
```

That's just two files! (Note that by default, Rails puts `<%= javascript_include_tag :application %>` in the HTML `<head></head>` tag, but you can move it to the bottom of the `<body></body>` to make sure it doesn't block the loading of your HTML).

### The Manifest

In rails, instead of manually adding all those script tags, you're going to take advantage of `app/assets/javascripts/application.js`. Inside the file there's a weird looking comment called a `manifest`:

``` javascript
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
```

Actually, **it's not a comment!** It's instructions saying *which files* need to be loaded in your HTML, and *in what order*.

It will look for the name of the file (e.g. `jquery`) in the following directories:

1. `app/assets/` - application specific code
2. `lib/assets/` - custom libraries
3. `vendor/assets/` - third-party libraries

### Precompiling Assets

So far we've been working on our applications *in development*. You may have noticed that when you create a rails application it has three databases, `development`, `test`, and `production`.

The asset pipeline is designed for *production* applications. That's when we care about *speed*!

To turn your *many* JavaScript and CSS files into *one* JavaScript file and _one_ CSS file, you need to "precompile" your assets.

Precompiled assets live in `public/assets/`. Right now it's an empty folder!

You can run the following command to precompile your assets:

```zsh
➜  rake assets:precompile
```

Now look inside `public/assets/`, and you'll see *minified* and *fingerprinted* versions of your assets, compiled into a single file.

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link href="/assets/application-4dd5b109ee3439da54f5bdfd78a80473.css" rel="stylesheet" />
  <title>Precompiled Assets!</title>
</head>
<body>
  <script src="/assets/application-908e25f4bf641868d8683022a5b62f54.js"></script>
</body>
</html>
```

To destroy your precompiled assets in development, simply run:

```zsh
➜  rake assets:clobber
```

Note you will typically only precompile your assets in development for debugging purposes. You'll set up your app to automatically precompile assets on deploy when you get ready to push to Heroku.

## Resources

* <a href="http://guides.rubyonrails.org/asset_pipeline.html">Rails Guides: Asset Pipeline</a>
