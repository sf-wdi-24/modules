# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Angular Lab

![angular](https://cloud.githubusercontent.com/assets/8397980/12528448/7905981e-c14a-11e5-8231-8ce1c1f7a8ea.png)


| Objectives |
| :--- |
| Hook up your back-end (Mongo/Express/Node or Rails) with a client-side AngularJS app. |
| Implement RESTful routing with nested resources. |
| CRUD associated data. |

## Questions and Answers App

You are working for a company that wants to prototype an app that mimics the capability of Stack Overflow, Quora or <a href="http://gaqa.herokuapp.com/" target="_blank">this app</a>.  Your challenge is to create this app connecting an Angular front end with either a Rails back end or a MEN back end.  This is your chance to put all of the pieces together.  Be resourceful and persistent.  Practice makes perfect!!

**If the app you built for the weekend lab was a MEAN Stack app, then today you should use Rails and Angular. If the app you created over the weekend was built with Rails and Angular, today you should build a MEAN Stack app. If you created an app using Parse and/or Dropbox, you have your choice of either stack.**

## Project Setup

* Fork and clone <a href="https://github.com/sf-wdi-24/angularjs-lab" target="_blank">this</a> repo.  When you are finished creating your app submit a pull request.

*  Use <a href="https://github.com/sf-wdi-24/modules/tree/master/week-10-angular/day-04/module-01" target="_blank">this tutorial</a> as a guide on how to connect your front-end to your back-end.

*  Make sure to create the appropriate associations between your `Question` and `Answer` models.

## Challenges

**Use `$resource` to interact with the API.**

1. Create a home view that has a list of questions. Make these questions modifiable and deletable.

2. Add functionality to add new questions.

3. Each question should link to a page that displays the question with its answers. **Hint:** `/:id`.

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

5. Add functionality to add new answers to a question.
