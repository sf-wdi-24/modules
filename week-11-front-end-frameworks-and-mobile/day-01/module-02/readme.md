# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Angular Lab

![angular](https://cloud.githubusercontent.com/assets/8397980/12528448/7905981e-c14a-11e5-8231-8ce1c1f7a8ea.png)


| Objectives |
| :--- |
| Hook up our backend (Node.js, Express, and MongoDB or Rails) with a front end (Angular.js) |
| Implement RESTful routing |
| CRUD data |

## Questions and Answers App

You are working for a company that wants to prototype an app that mimics the capability of Stack Overflow, Quora or <a href="http://gaqa.herokuapp.com/" target="_blank">this app</a>.  Your challenge is to create this app connecting an Angular front end with either a Rails back end or a MEN back end.  This is your chance to put all of the pieces together.  Be resourceful and persistent.  Practice makes perfect!!

**If the app you built for the weekend lab was created as a MEAN app you will be connecting Angular with Rails.  If the app you created was made with Rails and Angular, you will be creating a MEAN version of this app.  If you created an app using Parse or Dropbox you have your choice of either set up.**

## Project Structure Setup

*  Use <a href="https://github.com/sf-wdi-24/modules/tree/master/week-10-angular/day-04/module-01" target="_blank">this</a> as a guide on how to connect your front end to your back end.

*  Make sure to create the appropriate associations between you 'Questions' and 'Answers' models.

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
