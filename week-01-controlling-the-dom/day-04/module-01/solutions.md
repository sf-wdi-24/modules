## Challenges

#### Nature Drawing 101: Draw a Tree!
* How many children does `header` have?
    - just one: the `ul` element
* Name a direct child of the `p` element.
    - the `a` elment
* Name a direct parent of the `p` element
    - the `section` element
* What is the parent of the `html` element?
    - Trick question! It turns out that `html` belongs to the `document` object, which lives inside your browser (not your html)!

#### CSS Selector Challenge
1.
* \#fancy
* p#fancy
* div p#fancy
* .page #fancy
* .page p#fancy
* div.page p#fancy

2.
* div .small
* div a.small
* .small
* div.page a.small

3.
* p a
* div.page p a
* .page p a
* div p a

4.
* .mad-favs li
* ul.mad-favs li
* div.page ul.mad-favs li
* .page .mad-favs li

5.
* .sparkles
* p.sparkles
* div p.sparkles
* div.page p.sparkles

6.
* p a.small
* p .small
* div p .small
* div.page p a.small

### jQuery Selector Challenge

Using jQuery:

``` javascript
var $el = $("#greeting");
var $el = $("div");
var $el = $("div#greeting");
// note that using the "$" in the variable name `$el` is just a naming convention, it indicates to you, dear reader, that the value of `$el` is a jquery `object` and has special jquery methods.
```

1. `$("#greeting").text(); // get "Hello There"`
2. `$("#greeting").text("Hola"); // set "Hola"`
3. `$("body").prepend("<h1>A Spanish Greeting</h1>");`
4. `$("body").append("<div>Que tal?</div>");`
5. `$("div").addClass("blue");`

---
Using Vanilla Javascript:

``` javascript
var el = document.querySelector("#greeting");
var el = document.querySelector("div");
var el = document.querySelector("div#greeting")
```

In the past you'd see alternative ways of grabbing DOM elements in javascript. *There is no good reason to use these any more*:

``` javascript
var el = document.getElementById("greeting");
var el = document.getElementByTagName("div");
var el = document.getElementByClassName("someclass")
```

1. `document.querySelector("#greeting").textContent; // get "Hello There"`
2. `document.querySelector("#greeting").textContent = "Hola"; // set "Hola"`
3.  
    ``` javascript
        var bodyEl = document.querySelector("body");
        bodyEl.innerHTML = "<h1>Hola</h1>" + bodyEl.innerHTML;
    ```
4.  
    ``` javascript
        var bodyEl = document.querySelector("body");
        bodyEl.innerHTML = bodyEl.innerHTML + "<div>Que tal?</div>";
    ```

5.
    ``` javascript
        // ahhhhhhhhhh
        var divEls = document.querySelectorAll("div");
        Array.prototype.slice.apply(divEls).forEach(function(el){
            el.classList.add("blue");
        })
    ```


#### Indiana Jones And the Temple of DOM

``` javascript
// title
$("h1#san-francisco_title").text("Indiana Jones and the Temple of DOM");
$("h1#san-francisco_title").append("<small>(Rated G)</small>")

// image swap
var $target = $("div.image-wrapper img").eq(0);
var new_image = "http://media2.giphy.com/media/MS0fQBmGGMaRy/giphy.gif";
$target.attr("src", new_image);
```
