Project Planning Practices
Workflow
Best Practices

Objectives

Create an effective strategy for planning projects
Understand and implement an MVP
Create and Adhere to a logical and productive Workflow
Understand and utilize organization technologies
Execute a project from beginning to end


Why?

Great planning is essential to saving time while creating a project.  Far too often programmers and students do not invest enough time into analyzing the creating a plan to build a project.  The end result of this is time wasted on creating features that are not necessary to the project or writing code that is not useful to the project.

Creating a roadmap for your work week helps one to become a more focused programmer.

Analyzing what issues you run into helps you to better plan how to approach the next day.


Outside in--building things as you need them.




## TIMELINE

* **Friday, July 17th by 9:00am** - **REQUIRED**:  Submit your project proposal to an instructor and make a Kaban board for it using Trello. Be ready to talk about the scope of your project -- you should only plan to build your [MVP (minimum viable product)](https://en.wikipedia.org/wiki/Minimum_viable_product). Before beginning work on your project, your project idea and the scope of your project must be checked-off by an instructor. You will need the following for an instructor check-off:
    * Wireframes (simple/hand drawn are great)
    * User narratives / user stories ("Users can create a meal with various foods." or "As a SpaceBook user looking for new friends, I want to be able to update my location to my current planet.")
    * Models and DB design (ERD)


* **Weekend** - Suggestion:
  - Build initial index file
    - add bootstrap
    - make a template to display the core resource (e.g. "Post", or "Article", or "Todo")
  - Use the template to show dummy data from an array in the client side javascript code (add jQuery)
  - Move array of static data to server (build server with 1 route to get all data)
  - Move array of static data to DB (add mongoose and seed local DB)


* **Monday, July 20th** - **REQUIRED**:  Deploy your code to Heroku by the end of the day. We know the project won't be finished; deploy whatever you have.  This will make your life easier. We will have a workshop on Monday afternoon on deploying to Heroku with Mongo.

  Also, Suggestion:
  - Build any forms or form templates
  - Add POST route(s)
  - Add route tests


* **Tuesday, July 21st** - Suggestion:

  - Build signup ui/template
  - Add User model and Signup route to server
  - Build login ui/template
  - Add login route to server
  - Push to Heroku


* **Wednesday, July 22nd** - Suggestion:

  - Add another resource or a "reach" feature
  - Push to Heroku


* **Thursday, July 23rd** - Suggestion:
  - Improve and customize styling
  - Final Push to Heroku


* **Friday, July 24th, 9:17am** - Project due and presentations!

## PLANNING

#### Before you start coding...

* **Getting Ideas** Think about problems you know of - things that suck or are broken in the world. Could you build something that could grow into a solution? Try to do one thing well and then iterate.
* **User stories** Outline your core user stories and divide them into sub-stories. Use your own [Trello](https://trello.com/) board to track your progress and keep you focused.
* **Wireframes** Sketch out what a your core pages will look like and how they will work.
* **Object Models** Use an entity relationship diagram to plan out the Models, their relationship(s), and properties.


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
