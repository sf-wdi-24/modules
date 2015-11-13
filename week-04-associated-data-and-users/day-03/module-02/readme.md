# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60">  Web Scraping

| Objectives |
| :-- |
| Scrape a site using Kimono Labs. |
| Explain situations which call for web scraping. |
| Name alternate methods which can be used instead of web scraping. |

<img src="https://cloud.githubusercontent.com/assets/1329385/11154148/7dc09e6a-89f2-11e5-9680-6e6e709e59b6.gif" width="400px">

# Issues
inspected element to find classes

get all elements and foreach

Doesn't work, how to test?

Ran into issues with names and types.


Show debugger

Grab href and connect in.

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

