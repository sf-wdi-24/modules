# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60">  Web Scraping

| Objectives |
| :-- |
| Scrape a site using Kimono Labs. |
| Explain situations which call for web scraping. |
| Name alternate methods which can be used instead of web scraping. |

<img src="https://cloud.githubusercontent.com/assets/1329385/11154148/7dc09e6a-89f2-11e5-9680-6e6e709e59b6.gif" width="400px">

## What is web scraping?

> Web scraping is closely related to web indexing, which indexes information on the web using a bot or web crawler and is a universal technique adopted by most search engines. In contrast, web scraping focuses more on the transformation of unstructured data on the web, typically in HTML format, into structured data that can be stored and analyzed in a central local database or spreadsheet. Web scraping is also related to web automation, which simulates human browsing using computer software. Uses of web scraping include online price comparison, contact scraping, weather data monitoring, website change detection, research, web mashup and web data integration. <a href="https://en.wikipedia.org/wiki/Web_scraping" target="_blank">Wikipedia</a>

## Why scrape a website?

An API is usually a structured way to get information about a service online. They're great but sometimes the website we've found doesn't have an API. So do we give up?

Some developers will give up if they come across a service with no API. This is an OK viewpoint but we'd like to give an alternate route to explore. The alternate route is to *scrape* a website for the information you're searching for.

We shouldn't use scraping as our first line of attack. It is difficult and prone to issues whereas using a provided API will usually be more efficient.

Stanley has worked on scraping a site in advance of this module. Let's learn from his experiences and the libraries he used.

## General steps to scrape a website

1. Check if they have an API.
1. Begin highlighting areas of the website which contain the information you're searching for.
1. Message the site maintainer to see if they have information you may use.
1. Create a new script to download the pages you need.
  * At this step, we keep the information in the raw HTML format.
  * Don't request many pages quickly. Why?
  * Validate the raw HTML pages match what is displayed in your browser.
1. Try exploring the page using jQuery (or vanilla JS) to find the elements with the information you're searching for.
1. Record the jQuery selectors used to find the elements in the page.
1. Add these selectors to a new script which searches the downloaded HTML pages.
1. Record information about the information you've found (metadata).
1. Serialize your results.
1. Deserialize your results in your application and create records in your DB.

## Let's try scraping something together

Scraping sites is challenging, the simpler sites will be fairly trivial but this process involves a great deal of reverse engineering.

Let's scrape <a href="http://example.com/" target="_blank">http://example.com/</a> and make a REST route to return its information.

### I'm doing lots of `console.log`s in my scripts

Please don't do this, let's try an alternative.

We're going to globally install a new package named <a href="https://github.com/node-inspector/node-inspector" target="_blank">Node Inspector</a>.

<details>
  <summary>How do we install a new package with node?</summary>

  ```zsh
  npm install -g node-inspector
  ```
</details>

Now let's try debugging our script which shows a helpful Chrome debugger.

### There's no jQuery on this site but I want to use a jQuery selector

If the site allows cross-origin requests we can use some vanilla JS to include jQuery. (What does cross-origin request mean?)

```js
var button = document.createElement('button');
button.addEventListener("click", function () {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = 'https://code.jquery.com/jquery-1.11.3.min.js';

    document.body.appendChild(script);
}, false);

button.appendChild(document.createTextNode("Add jQuery")); 
document.body.appendChild(button);
```

Any ideas on why we added a button instead of including it directly?

### THIS IS TOO MUCH WORK!

I agree, for some projects a website called <a href="https://www.kimonolabs.com/" target="_blank">Kimono Labs</a> will do much of this work for us. It isn't always perfect but is a solid product worthy of a try.

Let's create an account and try out the demo.

### Challenges

Make a group and look for a website with no API which you'll work together and try to retrieve information from.

Use either Kimono or build your own to scrape at least one piece of information from the site you've chosen.

The goal is to have at least one piece of information pulled from a site with no API.

#### Extreme Challenge

Once you have that information, save it into your db (mongo) and create a REST route to retrieve it.

By the end of this challenge you **should** have a utility which scrapes a site and then structures the information into your API.

## Make sure to always include proper attribution of where your data is originating!
