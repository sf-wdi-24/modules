# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Asset Pipeline - Additional Reading

The Rails asset pipeline provides a framework to concatenate and minify, or compress, JavaScript and CSS assets. It also adds the ability to write the code for these assets in other languages and pre-processors such as CoffeeScript, Sass, and ERB.

The Rails asset pipeline is enabled by default.

### 1.1 Main Features

The **first feature of the asset pipeline** is to concatenate assets, which can reduce the number of requests that a browser makes to render a web page. Web browsers are limited in the number of requests that they can make in parallel, so fewer requests can mean faster loading for your application.

Sprockets concatenates all JavaScript files into one master `.js` file and all CSS files into one master `.css` file. As you'll learn later in this guide, you can customize this strategy to group files any way you like. In production, Rails inserts an MD5 fingerprint into each filename so that the file is cached by the web browser. You can invalidate the cache by altering this fingerprint, which happens automatically whenever you change the file contents.

The **second feature of the asset pipeline** is asset minification, or compression. For CSS files, this is done by removing whitespace and comments. For JavaScript, more complex processes can be applied. You can choose from a set of built in options or specify your own.

The **third feature of the asset pipeline** is it allows coding assets via a higher-level language, with precompilation down to the actual assets. Supported languages include Sass for CSS, CoffeeScript for JavaScript, and ERB for both by default.

### 1.2 What is Fingerprinting and Why Should I Care?

Fingerprinting is a technique that makes the name of a file dependent on the contents of the file. When the file contents change, the filename also changes. For content that is static or infrequently changed, this provides an easy way to tell whether two versions of a file are identical, even across different servers or deployment dates.

When a filename is unique and based on its content, HTTP headers can be set to encourage caches everywhere (whether at CDNs, at ISPs, in networking equipment, or in web browsers) to keep their own copy of the content. When the content is updated, the fingerprint will change. This will cause the remote clients to request a new copy of the content. This is generally known as **cache busting**.

The technique sprockets uses for fingerprinting is to insert a hash of the content into the name, usually at the end. For example, a CSS file `global.css` may become `global-908e25f4bf641868d8683022a5b62f54.css`. This is the strategy adopted by the Rails asset pipeline.

### 2.2 Asset Organization

Pipeline assets can be placed inside an application in one of three locations: `app/assets`, `lib/assets` or `vendor/assets`.

`app/assets` is for assets that are owned by the application, such as custom images, JavaScript files, or stylesheets.

`lib/assets` is for your own libraries' code that doesn't really fit into the scope of the application or libraries which are shared across applications.

`vendor/assets` is for assets that are owned by outside entities, such as code for JavaScript plugins and CSS frameworks. Keep in mind that third-party code with references to other files also processed by the asset Pipeline (images, stylesheets, etc.), will need to be rewritten to use helpers like `asset_path`.

### 2.4 Manifest Files and Directives

Sprockets uses manifest files to determine which assets to include and serve. These manifest files contain directives - instructions that tell sprockets which files to require in order to build a single CSS or JavaScript file. With these directives, sprockets loads the files specified, processes them if necessary, concatenates them into one single file, and then compresses them (if `Rails.application.config.assets.compress` is `true`). By serving one file rather than many, the page-load time can be greatly reduced because the browser makes fewer requests. Compression also reduces file size, enabling the browser to download them faster.

##### Javascript

A new Rails 4 application includes a default `app/assets/javascripts/application.js` file containing the following lines:

```javascript
// app/assets/javascripts/application.js

// ...
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
```

In JavaScript files, Sprockets directives begin with `//=`. In the above case, the file is using the `require` and the `require_tree` directives. The require directive is used to tell Sprockets the files you wish to require. Here, you are requiring the files `jquery.js`, `jquery_ujs.js`, and `turbolinks.js` that are available somewhere in the search path for Sprockets. You need not supply the extensions explicitly. Sprockets assumes you are requiring a `.js` file when done from within a `.js` file.

**Note about turbolinks:** Turbolinks is a gem that ships with Rails that eliminates page refreshes when navigating around your app in the browser. This sounds pretty cool, but the downside is that it only loads your assets once, on the first page-load, then it never loads them again, so any jQuery events you have set to run on page-load won't work on subsequent pages. We suggest removing turbolinks for the time being, and you'll learn how to build apps without page refreshes when we get to Angular :)

Removing turbolinks requires three steps:

1. Remove `'data-turbolinks-track' => true` from `<%= stylesheet_link_tag 'application' %>` and `<%= javascript_include_tag 'application' %>` in `app/views/layouts.application.html.erb`.
2. Remove `//= require turbolinks` from `app/assets/javascripts/application.js`.
3. Comment-out (or delete) `gem 'turbolinks'` from your `Gemfile`.

The `require_tree` directive tells Sprockets to recursively include all JavaScript files in the specified directory into the output. These paths must be specified relative to the manifest file. You can also use the `require_directory` directive which includes all JavaScript files only in the directory specified, without recursion.

Requiring these JS files:

```
app/assets/javascripts/home.js
lib/assets/javascripts/moovinator.js
vendor/assets/javascripts/slider.js
vendor/assets/somepackage/phonebox.js
```

Will be as follows:

```javascript
// app/assets/javascripts/application.js

// ...
//= require home
//= require moovinator
//= require slider
//= require phonebox
```

##### CSS

The remarks made above about ordering in JavaScript apply to CSS. In particular, you can specify individual files, and they are compiled in the order specified.

Requiring these CSS files:

```
app/assets/stylesheets/buttons.css
lib/assets/stylesheets/nav-bar.css
vendor/assets/stylesheets/bootstrap.css
```

Will be as follows:

```css
/* app/assets/javascripts/application.css */

/* ...
*= require bootstrap
*= require nav-bar
*= require buttons
*/
```

##### Images

In views you can access images in the `public/assets/images` directory like this: `<%= image_tag "rails.png" %>`.

Images can also be organized into subdirectories, and then can be accessed by specifying the directory's name in the tag: `<%= image_tag "icons/rails.png" %>`.

The asset pipeline automatically evaluates ERB. This means if you add a `.erb` extension to a CSS asset (for example, `application.css.erb`), then helpers like `asset_path` are available in your CSS rules:

```css
.header {
  background-image: url(<%= asset_path 'image.png' %>)
}
```

This writes the path to the particular asset being referenced. In this example, it would make sense to have an image in one of the asset load paths, such as `app/assets/images/image.png`, which would be referenced here. If this image is already available in `public/assets` as a fingerprinted file, then that path is referenced.
