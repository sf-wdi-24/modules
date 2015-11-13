## Solutions

1. Write a `post.js` file with a Post model with embedded Comment.

  ```js
    var mongoose = require('mongoose');
    var Schema = mongoose.Schema;

    var commentSchema = new Schema({
      body: {
        type: String,
        default: ""
      }
    });

    var postSchema = new Schema({
      title: {
        type: String,
        default: ""
      },
      body: String,
      comments: [commentSchema]   // EMBEDDING :D
    });

    var Post = mongoose.model('Post', postSchema);
    module.exports = Post;
  ```

1. Write a route to create a new User.

  ```js
  app.post('/users', function(req, res) {
    var user = req.body.user;
    User.create(user, function (err, user) {
      res.status(200).json(user);
    });
  });
  ```

1. Return an array of all the users.

  ```js
  app.get('/users', function(req, res) {
    User.find({}, function (err, users) {
      res.status(200).json(users);
    });
  });
  ```


1. Return an array of all tweets of a specific user.

  ```js
  app.get('/users/:userId/tweets', function(req, res) {
    User.find({ _id: req.params.userId }, function (err, user) {
      res.status(200).json(user.tweets);
    });
  });
  ```

1. Create a new tweet that belongs to a user (who's id is in the `req.params.id`).

  ```js
  app.post('/users/:userId/tweets', function(req, res) {
    User.find({ _id: req.params.userId }, function (err, user) {
      user.tweets.push(req.body.tweet);
      user.save(function(err) {
        res.status(200).json(user);
      });
    });
  });
  ```

1. Delete a tweet that belongs to a user (make sure to build the route to include the user and the tweet's id's - see example above).

  ```js
  app.delete('/users/:userId/tweets/:tweetId', function(req, res) {
    User.find({ _id: req.params.userId }, function (err, user) {
      user.tweets.findByIdAndRemove({ _id: req.params.tweetId });
      res.status(200).json(user);
    });
  });
  ```

1. Update a tweet that belongs to a user (ditto on their id's!).

  ```js
  app.put('/users/:userId/tweets/:tweetId', function(req, res) {
    User.find({ _id: req.params.userId }, function (err, user) {
      var tweet = req.body.tweet;
      user.tweets.findByIdAndUpdate(tweet, function (err, user) {
        res.status(200).json(user);
      });
    });
  });
  ```
