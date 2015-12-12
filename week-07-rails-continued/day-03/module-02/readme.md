# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Rails Asset Pipeline

| Objectives |
| :--- |
| Describe the Rails Asset Pipeline, what it does, and why we use it. |
| Require assets in Rails. |
| Precompile assets for running in production. |

#### Overview

The goal of the asset pipeline is to:

- Compress files so they are as small as possible
    + Smaller files load faster
- Reduce the number of files transferred to the client
    + By combining files
        - CSS files are combined into a single file
        - Javascript files are combined into a single file
    + By caching files in the browser

#### Remember this?

``` html
<head>
    <title>Load all the things!</title>
    <script type="text/javascript" src="/vendor/jquery.js"></script>
    <script type="text/javascript" src="/vendor/underscore.js"></script>
    <script type="text/javascript" src="application.js"></script>
</head>
```

That's 3 different requests to the server, for 3 different javascript files. Ouch!

There's got to be a better way!

#### Caching
Your application can be configured to "cache" common javascript and css files in the client's browser.

Cached files don't need to be requested _on every page load_. They're already there, ready to go: meaning **less wait time** and **faster page loads**.

But how does the browser know when to update a cached file? What if you changed the file and the browser is using an older version?

We need a way to "bust" the cache!

**Cache Busting with Fingerprints**

In Rails, assets are given a "fingerprint" that changes every time the file is updated (almost like a timestamp).

For example, `application.js` file, with a fingerprint looks like this:

`application-908e25f4bf641868d8683022a5b62f54.js`

- If the fingerprint is the same, the browser simply uses its cached copy.
- If the fingerprint has changed, the browser requests the new version of the file (and then caches it!).
    + This is called "cache busting"

#### Compression / Minification / Uglification
What's the difference between [jquery.js](http://code.jquery.com/jquery-2.1.4.js) and [jquery.min.js](http://code.jquery.com/jquery-2.1.4.min.js)?

Let's do a quick comparison on the command line:

``` bash
# uncompressed jquery file
curl http://code.jquery.com/jquery-2.1.4.js | wc
#   lines  words   bytes
#   9210   37959   247597

# compressed jquery file
curl http://code.jquery.com/jquery-2.1.4.min.js | wc
#   lines  words   bytes
#   4      1305    84345
```

#### What about CDNs?
A CDN is a "content delivery network" and a handy way to deliver common "vendor" or "third party" libraries to your application. It's common to use a CDN for jQuery, Bootstrap, Underscore, Handlebars, etc.

But is it fast?

If a common file, like jQuery is delivered via CDN it is likely:

    1. cached in your browser
    2. cached by your ISP (Internet Service Provider)
    3. dispatched from a nearby server

But is that faster than just sending 1 javascript file from your own server?

Could be! You'll have to make a decision about whether you want to host third party libraries (like jquery), or if you want to use a public CDN.


## The Asset Pipeline in Rails

#### Remember This?

How we used to require files (manually):

``` html
<head>
    <title>Load all the things!</title>
    <script type="text/javascript" src="/vendor/jquery.js"></script>
    <script type="text/javascript" src="/vendor/underscore.js"></script>
    <script type="text/javascript" src="application.js"></script>

    <link rel="stylesheet" href="/vendor/bootstrap.css">
    <link rel="stylesheet" href="application.css">
</head>
```

How rails requires files (using the asset pipeline):

``` html
<script src="/assets/application-908e25f4bf641868d8683022a5b62f54.js"></script>
<link href="/assets/application-4dd5b109ee3439da54f5bdfd78a80473.css" rel="stylesheet" />
```

That's just two files!

#### The Manifest

In rails, instead of manually adding all those script tags, you're going to take advantage of `app/assets/javascripts/application.js`. Inside it there's a weird looking comment called a `manifest`:

``` javascript
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
```

Actually, **It's not a comment!**. It's instructions saying _which files_ need to be loaded in the `head` of your html, and _in what order_.

It will look for the name of the file (e.g. "jquery") in the following directories:

1. `app/assets/` -- application specific code
2. `lib/assets/` -- custom libraries
3. `vendor/assets/` -- third party libraries


#### Precompiling Assets
So far we've been working on our applications _in development_. You may have noticed that when you create a rails application it has three databases: `development`, `test`, and `production`.

The assets pipeline is designed for _production_ applications. That's when we care about _speed_!

To turn your _many_ javascript and css files into _one_ javascript file and _one_ css file, you need to "precompile" your assets.

Precompiled assets live in `public/assets/`. Right now it's an empty folder!

We need to run:

``` bash
rake assets:precompile
```

Now look inside `public/assets/` and you'll see _minified_ and _fingerprinted_ versions of your assets, ready to be compiled into a single file.

``` html
<script src="/assets/application-908e25f4bf641868d8683022a5b62f54.js"></script>
<link href="/assets/application-4dd5b109ee3439da54f5bdfd78a80473.css" rel="stylesheet" />
```

To destroy all your precompiled assets, simply run:

``` bash
rake assets:clobber
```

## Reference
For more info, hit the docs:
[Rails Guides: Asset Pipeline](http://guides.rubyonrails.org/asset_pipeline.html)
