## HTML Strings

For the following challanges you are going to use the template from https://github.com/sf-wdi-24/frontend-template

1. From the template repo copy the url to clone it
2. In your terminal, go into your dev folder and type 'git clone' + paste the link
3. Open this up in Sublime
4. In `main.js` change the file from:
    ```
    // wait for DOM to load before running JS
    $(function() {

    // check to make sure JS is loaded
    console.log('JS is loaded!');

    // your code here

    });
   ```
   to:
   ```
   console.log("Sanity Check: JS is working!");

   $(document).ready(function(){

     // code in here

     });
     ```
4. Paste the data object into the JS file.
5. Type your solution into the document.ready method.
6. You should console.log your solutions
7. Run your file by opening your index.html page in Chrome
8. Celebrate!!

As a warmup, try to output the following values:

  * the name of the course
  * the first student's id and full name
  * the number of students in the class
  * a list of github usernames
  * Create a function buildGithubLink that transforms a single student's info into an html string, with the following format:

`<a href="https://github.com/hingle-mccringleberry">Hingle McCringleberry</a>`

Using the function you just built, create a function called renderGithubLinks that takes an array of students and adds their github links to the page.

Extra points if you use built-in Array methods like forEach, map, and join and only insert into the DOM once.
