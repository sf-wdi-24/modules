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

