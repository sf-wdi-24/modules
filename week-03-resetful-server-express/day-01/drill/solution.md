Factorial Solution
==================

```
function factorial(x) {   
  if (x === 0) {  
    return 1;  
  }else{
    return x * factorial(x-1);  
  }  
alert(factorial(5));
}
```

Greatest Common Divisor
=======================

```
var gcd = function(a, b) {  
    if(!b) {  
      return a;  
    }  
  return gcd(b, a % b);  
};  
console.log(gcd(2154, 458));
```
