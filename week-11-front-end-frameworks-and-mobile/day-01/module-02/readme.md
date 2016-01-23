# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Angular Lab



| Objectives |
| :--- |
| Hook up our backend (Node.js, Express, and MongoDB or Rails) with a front end (Angular.js) |
| Implement RESTful routing |
| CRUD data |

## Questions and Answers App

We're going to add a front end on our previously "headless" app.

## Project Structure Setup

```bash
cd QnA
mkdir public
cd public
mkdir scripts
touch scripts/app.js
mkdir views
touch views/index.html
cd views
mkdir templates
touch templates/home.html
touch templates/answers.html
cd ../..
```

## Challenges

**Use `$resource` to interact with the database.**

1. Create a home view that has a list of questions. Make these questions modifiable and deletable.

2. Add functionality to add new questions.

3. Make the questions hyperlinks that link to a page that displays the question with its answers. **Hint:** `/:id`

4. Make the answers on the answers page modifiable and deletable. **Hint:**

  ```js
  app.service('Answer', ['$resource', function ($resource) {
    return $resource('/api/questions/:questionId/answers/:id', {id: '@_id'}, {
      update: {
        method: 'PUT'
      }
    });
  }]);
  ```

5. Add functionality to add new answers.

If you'd like, you can now safely get rid of the `#` in the url!

```js
$locationProvider.html5Mode({
  enabled: true,
  requireBase: false
});
```
