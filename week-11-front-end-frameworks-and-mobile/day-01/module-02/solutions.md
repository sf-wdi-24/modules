# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Angular Lab - Solutions


An example of how we would want to connect our data to the front end is using our nested resources.  Here's an example of how you can access individual answers:

```js
angular.module('questionApp').factory('Question', [
  '$resource', function($resource) {
    return $resource('questions/:id/:subResource', {}, {
      comments: {  // The `comments` action definition:
        params: {subResource: 'answers'},
        method: 'GET'
      }
    });
  }
]);
```
