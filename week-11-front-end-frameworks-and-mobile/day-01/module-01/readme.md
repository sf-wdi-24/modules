# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Angular Auth with Satellizer

| Objectives |
| :--- |
| Compare and contrast Cookie-Session and Web Token authentication strategies |
| Use the Satellizer module to implement Web Token authentication in Angular |

## Background

With Express and Rails you learned the Cookie-Session authentication strategy. However, there's a better way to communicate authentication in **Single Page Applications**. You're going to use an encrypted chunk of JSON called a **JSON Web Token**, or JWT (pronounced *"jot"*), to communicate authentication between client and server.

![cookie-token-auth](https://cloud.githubusercontent.com/assets/7833470/12523189/095e1760-c10a-11e5-9c5a-09d4bf69f2c1.png)

> <a href="https://auth0.com/blog/2014/01/07/angularjs-authentication-with-cookies-vs-token" target="_blank">Cookies vs Tokens. Getting auth right with Angular.JS</a> [Auth0 Blog]

## Why Use JWT?

Aren't you tired of keeping track of all these things?

1. **Sessions:** JWT doesn't require sessions.
2. **Cookies:** With JWT, you save the web token to the client using `localStorage`.
3. **CSRF:** With JWT, you send the web token instead of a CSRF token.
4. **CORS:** Forget about it - if your JWT is valid, the data is on its way.

JWT also has these benefits:

1. **Speed:** You don't have to look up the session information.
2. **Storage:** You don't have to store the session information.
3. **Mobile-Ready:** Mobile apps don't let you set cookies, but they can save auth tokens.
4. **Testing:** You don't have to make logging in a special case in your tests - just send the web token.

## JWT FTW

A JWT is pretty easy to identify. It is three strings separated by `.`'s.

```
aaaaaaaaaa.bbbbbbbbbbb.cccccccccccc
```

Each part has a different significance:

![jwt](https://cloud.githubusercontent.com/assets/7833470/12523476/03e23c74-c10c-11e5-9626-d0f2045b4670.png)

#### JWT Example

##### Header

```js
var header = {
  "typ": "JWT",
  "alg": "HS256"
}
```

##### Payload

```js
var payload = {
  "iss": "scotch.io",
  "exp": 1300819380,
  "name": "Chris Sevilleja",
  "admin": true
}
```

##### Signature

```js
var encodedString = base64UrlEncode(header) + "." + base64UrlEncode(payload);

HMACSHA256(encodedString, 'secret');
```

> The `secret` acts as an encryption string known only by the two parties communicating via JWT. Protect your secrets!

##### JSON Web Token

```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzY290Y2guaW8iLCJleHAiOjEzMDA4MTkzODAsIm5hbWUiOiJDaHJpcyBTZXZpbGxlamEiLCJhZG1pbiI6dHJ1ZX0.03f329983b86f7d9a9f5fef85305880101d5e302afafa20154d094b229f75773
```

## Angular Interceptors

Angular interceptors allow you to "intercept" HTTP requests and responses and change them. You can use an interceptor to attach a JWT to every outgoing HTTP request, and handle 401 (Unauthorized) statuses in any HTTP response.

```js
/*
 * app.js
 */

app.factory('authInterceptor', ['$rootScope', '$q', '$window', function ($rootScope, $q, $window) {
  return {
    request: function (config) {
      config.headers = config.headers || {};
      if ($window.localStorage.jwtToken) {
        config.headers.Authorization = 'Bearer ' + $window.localStorage.jwtToken;
      }
      return config;
    },
    response: function (response) {
      if (response.status === 401) {
        // handle the case where the user is not authorized
      }
      return response || $q.when(response);
    }
  };
}]);

app.config(['$httpProvider', function ($httpProvider) {
  $httpProvider.interceptors.push('authInterceptor');
}]);
```

## JWT Flow

> <a href="http://blog.matoski.com/articles/jwt-express-node-mongoose" target="_blank">Express4 + Mongoose + JSON Web Token Authentication</a> [matoski.com]

#### Log In

1. User logs in with email and password (client).
2. Server checks email and password, and if valid sends back a JWT.
3. Client receives the JWT and stores it in `localStorage`.
4. Client makes requests to the server with the JWT (this happens automatically using an **Angular Interceptor**).
5. Server decodes the JWT and uses the token data to decide if user has access to the resource.

#### Sign Up

1. User signs up with email and password (client).
2. Server creates a new user if everything is valid and sends back a JWT.
3. Client receives the JWT and stores it in   `localStorage`.
4. Client makes requests to the server with the JWT (this happens automatically using an **Angular Interceptor**).
5. Server decodes the JWT and uses the token data to decide if user has access to the resource.

## Satellizer

<a href="https://github.com/sahat/satellizer" target="_blank">Satellizer</a> is an Angular modules that hides a lot of the complexity of using JWTs. This is both a good and a bad thing. Let's not lose sight of how Satellizer is helping us:

1. Provides methods to authenticate a user with email/password and any OAuth provider. These methods send requests to the server, and when the server responds, Satellizer takes care of saving the JWT to `localStorage`.
2. Sends the JWT with every request using an **Angular Interceptor**.

## Challenges

Work on the <a href="" target="_blank">Angular Auth Challenges</a>.

## Resources

* <a href="https://auth0.com/blog/2014/01/07/angularjs-authentication-with-cookies-vs-token" target="_blank">Cookies vs Tokens. Getting auth right with Angular.JS</a> [Auth0 Blog]
* <a href="http://blog.matoski.com/articles/jwt-express-node-mongoose" target="_blank">Express4 + Mongoose + JSON Web Token Authentication</a> [matoski.com]
* <a href="http://jwt.io" target="_blank">JSON Web Tokens</a> [jwt.io]
* <a href="https://developer.atlassian.com/static/connect/docs/latest/concepts/understanding-jwt.html" target="_blank">Understanding JWT</a> [Atlassian]
* <a href="https://scotch.io/tutorials/the-anatomy-of-a-json-web-token" target="_blank">The Anatomy of a JSON Web Token</a> [scotch.io]
* <a href="https://github.com/sahat/satellizer" target="_blank">Satellizer Docs</a>
