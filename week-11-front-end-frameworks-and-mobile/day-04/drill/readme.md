# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Interview Workshop: Tech Vocab

Today we're mastering basic vocabulary and speaking about code in a simplified manner. We'll start by breaking up into pairs and taking turns speaking about code using simple terms.

An example of how we'd vocalize code, let's try and explain some code from <a href="https://gist.github.com/kgates-github/4695492" target="_blank">this example of solutions to Pascal's triangle</a>.


### Code Sample

```js
function pascalRecursive(n, a) {

  if (n < 2) return a; // We already have the top row

  var prevTier = a[a.length-1];
  var curTier = [1];

  for (var i = 1; i < prevTier.length; i++) {
    curTier[i] = prevTier[i] + prevTier[i-1];
  }
  curTier.push(1);
  a.push(curTier);

  return pascalRecursive(n-1, a);
}
```

### Explanation

> We declare a function named `pascalRecursive` which accepts two parameters `n` and `a`.
> 
> If the first parameter `n` is less than `2` we return the value of the second parameter `a`.
> 
> We declare a variable named `prevTier` and assign it the value of the second parameter's (`a`'s) last item.
> 
> We declare a variable named `curTier` and assign it the value of an array with one element in it, the number `1`.
> 
> We loop over all the values of `prevTier` and assign the `curTier` at index `i` to be the value of `prevTier` at index `i` added to the value of `prevTier` at index `i - 1`.
> 
> We add `1` to the end of the `curTier` array.
> 
> We add `curTier` to the end of the second parameter `a` array.
> 
> We return the value of the current function called with the value of the first parameter `n` minus `1` and the second parameter `a`.


## Useful Expressions

<table>
  <thead>
    <th>Expression</th>
    <th>Code Example</th>
  </thead>
  <tbody>
    <tr>
      <td>declared variable named <code>x</code></td>
      <td><code>var x</code></td>
    </tr>
    <tr>
      <td>defined variable named <code>x</code> to be the number <code>1</code></td>
      <td><code>var x = 1</code></td>
    <tr>
      <td>called a function named <code>x</code></td>
      <td><code>x()</code></td>
    </tr>
    <tr>
      <td>declared a function named <code>x</code></td>
      <td><code>function x() {}</code></td>
    </tr>
    <tr>
      <td>threw an exception</td>
      <td><code>throw "exception"</code></td>
    </tr>
    <tr>
      <td>when <code>x</code> is <code>1</code> it calls <code>y</code></td>
      <td><code>if(x === 1) { y(); }</code></td>
    </tr>
    <tr>
      <td>accessed the value of <code>x</code> on the object <code>y</code></td>
      <td><code>y.x</code></td>
    </tr>
    <tr>
      <td>initialized a new object <code>x</code></td>
      <td><code>x = new Object()</code></td>
    </tr>
    <tr>
      <td>initialized <code>x</code> to be a new object of type <code>Object</code></td>
      <td><code>x = new Object()</code></td>
    </tr>
    <tr>
      <td>returned the value of <code>x</code></td>
      <td><code>function () { return x; }</code></td>
    </tr>
  </tbody>
</table>

## Example Code to Explain

Start with <a href="https://github.com/angular/angular.js/blob/master/src/Angular.js" target="_blank">Angular's main module source code</a>.

For an extreme challenge try <a href="https://github.com/postgres/postgres/blob/master/src/timezone/localtime.c" target="_blank">PostgreSQL's timezone support</a>.
