Factorial Solution
==================

```
function factorial(x) {   
  if (x === 0) {  
    return 1;  
  }else{
    return x * factorial(x-1);  
  }  
}
console.log(factorial(5));
```

Greatest Common Divisor
=======================

```
var gcd = function(a, b) {  
    if(b === 0) {  
      return a;  
    }  
  return gcd(b, a % b);  
};  
console.log(gcd(2154, 458));
```
