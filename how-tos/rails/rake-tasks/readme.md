# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Custom Rake Tasks

<img src="http://cdn.meme.am/instances/400x/58907263.jpg">


## Why?
* Creating custom rake tasks help companies and developers automate redundant activities that are needed for the maintenance of a website.

* These tasks can be run with a rake command allow for the website to be optimized more effectively in production.

## How?

To check all of the rake tasks available to you in the terminal:
```cli
rake -T
```

To create a custom task you can go into your terminal and run:
```cli
touch lib/tasks/fun_task.rake
```
**Note:  You will want to name the file with .rake in order to allow Rails to look for it.  You will be able to write all of your code using standard Ruby conventions**

This will allow you to house all of your tasks in the
* A description
* The name that identifies the task
* The code to be executed by the task

```rb
desc "Rocky looks for Adrian after facing Creed"
task :yo_adrian => :environment do
  puts "Yo Adrian!  I did it!!!"
end
```

To run this task you can simply type:
```cli
rake yo_adrian
```
which should output:
```cli
Yo Adrian!  I did it!!!
```

You can add as many tasks as you want into the same file.  Doing so will help with your organization of the code.


## Demo

Note: Feel free to watch a demo of how to implement a custom rake task.  The resources below will be a definitive guide for you as you begin to construct your own tasks in your applications.

**Let's imagine that we have a data base of users.  Some users have expired accounts while others don't.  We need to create a task that will email users about their expired accounts.**

### Resources

<a href="http://www.stuartellis.eu/articles/rake/" target="_blank">Using Rake to Automate Tasks</a>

<a href="http://edelpero.svbtle.com/everything-you-always-wanted-to-know-about-writing-good-rake-tasks-but-were-afraid-to-ask" target="_blank">Everything You Always Wanted to Know</a>

<a href="https://www.youtube.com/watch?v=RS1juns_Sj0" target="_blank">Rails Casts</a>

<a href="https://www.youtube.com/watch?v=B1E6dyRZWdg" target="_blank">Writing Custom Rake Tasks</a>
