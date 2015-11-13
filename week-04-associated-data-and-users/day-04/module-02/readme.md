# Project Planning Practices, Workflow, and Best Practices

| Objectives |
| ----------- |
| Create an effective strategy for planning projects |
| Understand and implement an MVP |
| Implement and Execute an effective git workflow |
| Understand and utilize organizational technologies |
| Plan and execute a project from beginning to end |


## Why?

 * Great planning is essential to saving time while creating a project.  Far too often programmers and students do not invest enough time into analyzing the creating a plan to build a project.  The end result of this is time wasted on creating features that are not necessary to the project or writing code that is not useful to the project.

 * Creating a roadmap for your work week helps one to become a more focused programmer.

 * Analyzing what issues you run into helps you to better plan how to approach the next day.

## Terms:
* MVP
* Agile Development
* User story
* Wireframes
* Git workflow



### MVP....that's the Most Valuable Player Right?!?!

**MVP** is short for **Minimal Viable Product**.

* For our purposes, the MVP is the smallest possible project we want to create.  

* It's the minimum goal that we want to accomplish when we are building out an application or a feature.
(For example, if I am building a blog, I might want to make my MVP a site that simply allows a user to sign in and CRUD posts.  Anything beyond that functionality is extra and would not be counted as my MVP.)

* Setting an MVP at the beginning of a project can help focus a developer on the features that are strictly needed to accomplish said project.

### Agile Development

* Agile methodology is an alternative to traditional project management, typically used in software development. It helps teams respond to unpredictability through incremental, iterative work cadences, known as sprints. Agile methodologies are an alternative to waterfall, or traditional sequential development.

### User stories

* A user story is a tool used in Agile software development to capture a description of a software feature from an end-user perspective. The user story describes the type of user, what they want and why. A user story helps to create a simplified description of a requirement.

### Wireframes

* We've seen wireframing before.  This is simply a slight blue print to help guide our design of the website.  

* Creating a wireframe at the beginning of a project can drastically same time during development as it guides where and why we place features on a page.

### Git workflow

* When you are creating a web app you will be creating many different features.

* Having a proper git workflow will allow you to create these new features without disturbing your finished product.

* When creating a new feature you will want to create a branch based on that feature:

```bash
git branch new-feature
```
You'll want to checkout into that branch once created.
```bash
git checkout new-feature
```
This will place you in your new working branch.  This branch has the latest version of your master branch implemented.  Anything you work on here will only effect the copy in your `new-feature` branch.

* Once you've completed the working features of your new branch you will want to go through the `git add` and `git commit` flow.

* When you're ready to merge these changes into your application you'll want to go though this flow.

    1. `git checkout master` or `develop` depending on the layout of your branches.
    2. Once you are in the `master` branch you can merge the feature branch into it. `git merge new-feature`.  This will merge everything that you have into your working app.
    3. If this merge is successful you should have no merge conflicts and you can push this branch into github `git push origin master`

**Why are we doing all of this work?**
*  Have you worked on a new feature and completely wrecked the working application you have?  If not....YOU'RE LYING!!!!
*  Creating new branches allows us to take our working apps and make a copy for us to mess with.  We can tweak these new features confidently knowing that it will not have any adverse consequences on our working application.
 


* **REMEMBER to build "outside-in"**
Start with the basics of your view: an index.html file with static data directly in the file. Then, create a template based on the structure in the html and use the template to display dynamic data stored on the client. Then, move the data to the server and get it with a GET call to a route on the server.  Then, move the data to your database.

## WHAT WE ARE LOOKING FOR
#### Code should be...

* Commented
* Modular
* DRY
* Frequently committed, with descriptive commit messages
* Properly indented

#### Workflow should be...

* Strategic —
*Were you mindful about balancing your own resourcefulness with seeking help when necessary? Did you think through logical units and plan (e.g., in comments) before starting to code?*

* Documented —
*Did you create a project README, illustrate wireframes, write user stories, draw an entity relationship diagram, etc?*
