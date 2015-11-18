# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Hiding Environment Variables with Node.js

## Install & Require dotenv Module

1. In the Terminal, in the root directory of your Node.js app, install the `dotenv` module.

  ```zsh
  ➜  npm install --save dotenv
  ```

2. At the top of your `server.js` file, require and load `dotenv`.

  ```js
  /*
   * server.js
   */

  var express = require('express'),
      app = express(),

      // require other modules
      ...

  // require and load dotenv
  require('dotenv').load();
  ```

## Create .env File

1. In the root directory of your project, create a file called `.env`. This is a hidden file where you'll store API keys and other environment-specific variables.

  ```zsh
  ➜  touch .env
  ```

2. **Before you do anything else,** add `.env` to your `.gitignore`! This is what "hides" your API keys and prevents them from being exposed on GitHub.

  ```js
  /*
   * .gitignore
   */

  node_modules
  .env
  ```

3. **After you add `.env` to your `.gitignore`,** add your API keys to `.env`. *Change MY_API_KEY to your variable name and your actual key.*

  ```js
  /*
   * .env
   */

  MY_API_KEY=0932nv8d17vhd72o2e8cfv82csd9n1dcd98
  ```

## Accessing Environment Variables

In `server.js`, or any other back-end JS file (models, etc.), you can access your API keys and other environment-specific variables through `process.env`.

```js
/*
 * server.js (or any other back-end JS file)
 */

// I need to use my API key! How do I access it?
process.env.MY_API_KEY // returns value of MY_API_KEY
```

## Resources

<a href="https://github.com/motdotla/dotenv" target="_blank">dotenv</a>
