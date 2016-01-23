# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Interview Workshop: Algorithm Design - Solutions

```js
// We choose a bucket location based on how big we expect our HashTable to be.
function bucketLocation(rawKey, bucketSize) {
  // We make certain the key is a string by converting it to JSON formatted string.
  var key = JSON.stringify(rawKey);

  // Placeholder which will include all the unicode character code integers
  // for each character in the string.
  var hash = [];
  for (var i in key) {
    // Obtain the unicode character code for each character in the key.
    hash.push(key.charCodeAt(i));
  }

  // Turn our array of integers into a string which is a giant integer then
  // reduce it in size to fit within the bucket.
  // NOTE: even though hash is a string, javascript treats it as an integer.
  return hash.join("") % bucketSize;
}

// An object for us to play with our HashTable.
function HashTable() {
  // It is important to have this as an instance variable, why?
  this.bucketSize = 200;
  this.bucket = [];
}

// Add a value into our HashTable by computing an index where it'll
// be stored in our bucket of values.
HashTable.prototype.add = function (key, value) {
  // What happens when the index already exists? Could this cause a collision?
  var index = bucketLocation(key, this.bucketSize);
  this.bucket[index] = value;

  return index;
};

// Get the value located in the bucket at the index found for this key.
HashTable.prototype.get = function (key) {
  var index = bucketLocation(key, this.bucketSize);

  return this.bucket[index];
};

var exampleTable = new HashTable();

exampleTable.add("simpleKey", 1234);
exampleTable.get("simpleKey");
// 1234

exampleTable.get("doesn't exist");
// undefined

exampleTable.add({complexKey: true}, {complexValue: "foo"});
exampleTable.get({complexKey: true});
// {complexValue: "foo"}
```
