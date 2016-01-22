# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Interview Workshop: Tech Vocab

Today we're mastering basic vocabulary and speaking about code in a simplified manner. We'll start by breaking up into pairs and take turns speaking about code using simple terms.

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
      <td>declared variable named `x`</td>
      <td>`var x`</td>
    </tr>
    <tr>
      <td>defined variable named `x` to be the number `1`</td>
      <td>`var x = 1`</td>
    <tr>
      <td>called a function named `x`</td>
      <td>`x()`</td>
    </tr>
    <tr>
      <td>declared a function named `x`</td>
      <td>`function x() {}`</td>
    </tr>
    <tr>
      <td>threw an exception</td>
      <td>`throw "exception"`</td>
    </tr>
    <tr>
      <td>when `x` is `1` it calls `y`</td>
      <td>`if(x === 1) { y(); }`</td>
    </tr>
    <tr>
      <td>accessed the value of `x` on the object `y`</td>
      <td>`y.x`</td>
    </tr>
    <tr>
      <td>initialized a new object `x`</td>
      <td>`x = new Object()`</td>
    </tr>
    <tr>
      <td>initialized `x` to be a new object of type `Object`</td>
      <td>`x = new Object()`</td>
    </tr>
    <tr>
      <td>returned the value of `x`</td>
      <td>`function () { return x; }`</td>
    </tr>
  </tbody>
</table>

## Example Code to Explain

Start with <a href="https://github.com/angular/angular.js/blob/master/src/Angular.js" target="_blank">Angular's main module source code</a>.

For an extreme challenge try <a href="https://github.com/postgres/postgres/blob/master/src/timezone/localtime.c" target="_blank">PostgreSQL's timezone support</a>.
