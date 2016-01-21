# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60"> Angular with Parse & Dropbox (Serverless)

| Objectives |
| :--- |
| Host an Angular app with a BAAS. |
| Describe use cases for JAWS. |
| Initialize an Angular environment for Hackathons. |

## Serverless

![Serverless](https://cloud.githubusercontent.com/assets/1329385/12457048/6016644a-bf57-11e5-9287-f7a41ccf94aa.gif)

There have been a number of projects which don't use a custom made server released recently. Instead of using a server they've branded themselves "serverless".

The term serverless is misleading because these systems use servers to host shared data. The difference is that serverless projects rely on external services providing the server architecture. Although this process is easier to get setup with it comes with an additional price.

These services will often fall under the umbrella of Backend As A Service (BAAS). This means they're designed as a service which gives you features commonly found on your backend (server environment).

We'll go over a few services with their corresponding positive and negative traits. There isn't a one-size fits all solution.

## Parse

> Building apps isn't easy, but we get you pretty close. <a href="https://parse.com/" target="_blank">Parse.com</a>

Pros:

* Used in production.
* Quick FB/Twitter auth setup.
* Good documentation.
* Push notifications support.
* Allows custom code.

Cons:

* Can get expensive.

Using Angular with Parse is a challenge, in order to get around it we'll use a feature of Angular called `$q`. `$q` is used to create JavaScript promises which are what power much of Angular.

* <a href="http://tumba.solutions/blog/angularjs-and-parse" target="_blank">Details on Angular with Parse</a>
* <a href="https://parse.com/apps/quickstart#hosting/unix" target="_blank">Hosting Apps with Parse</a>
* <a href="https://parse.com/apps/quickstart#parse_data/web/existing" target="_blank">Working with Parse Data</a>

## Dropbox

> The Datastore API lets you effortlessly sync all of your app's structured data such as contacts, to-do items, and game state. It enables your app to sync data quickly, manage conflicting changes, and even work offline. <a href="https://www.dropbox.com/developers-v1/datastore/sdks/other" target="_blank">Dropbox API</a>

Pros:

* Easy setup and changes.

Cons:

* No ability to access all user accounts.
* Hard to work with your synchronized data.
* May require a paid account.

If you want to serve HTML from Dropbox you need a paid account to get a Public folder:

> Dropbox links give you everything you need to share and preview files and folders. However, if you’re just a diehard fan of Public folders, click here to enable one on your account. Currently only Pro and Dropbox Business users can enable Public folders, so you may have to upgrade first. [<a href="https://www.dropbox.com/en/help/16" target="_blank">Dropbox Help</a>]

Working with the DataStore API in Angular requires a new Angular service named `dropstore-ng`:

* <a href="https://github.com/AnalogJ/dropstore-ng" target="_blank">Dropstore NG GitHub</a>

## JAWS

> Serverless Framework – Build and maintain web, mobile and IoT applications running on AWS Lambda and API Gateway (formerly known as JAWS) <a href="https://github.com/serverless/serverless" target="_blank">Serverless</a>

Pros:

* Can be used in a production environment.

Cons:

* High learning curve.
* Initial setup isn't quick.

Details:

* <a href="https://github.com/serverless/serverless" target="_blank">Serverless</a>
* <a href="http://docs.serverless.com/docs/backstory" target="_blank">What is Serverless</a>

### Side Note

What is AWS? You'll come across Amazon Web Services constantly and should be able to understand what AWS "is".

* <a href="https://aws.amazon.com/what-is-aws/" target="_blank">What is AWS?</a>
* <a href="https://aws.amazon.com/lambda/" target="_blank">AWS Lambda</a>
* <a href="https://aws.amazon.com/api-gateway/" target="_blank">AWS API Gateway</a>
* <a href="https://aws.amazon.com/ec2/" target="_blank">AWS EC2</a>
* <a href="https://aws.amazon.com/s3/" target="_blank">AWS S3</a>

## Hackathons

Creatively hosting your prototype projects shares what you've created. We've been using Heroku but it won't always work in a short time frame. Sometimes you won't have time to setup your server environment and maintain server routes while building a Hackathon prototype.

In Hackathons these "serverless" environments can be incredibly useful. You'll be able to have a shareable prototype within the time frame of the Hackathon.

## Exercise

We've seen a few approaches to hosting a quick prototype. Today we're building something and getting it hosted on one of these platforms.

You are required to deliver a project which:

1. Performs all CRUD operations.
1. Is hosted on a service other than Heroku.
1. Uses Angular Routing.

Further information is <a href="https://github.com/sf-wdi-24/ng-serverless" target="_blank">found on the ng-serverless repository</a>.

## Other Routes to Host

It isn't important to know all these routes but it's useful to understand the number of choices when hosting your application in a "production" environment. Find a way you understand well and use it when you need a quick environment.

* <a href="https://support.google.com/drive/answer/2881970?hl=en" target="_blank">Google Drive Hosting</a>
* <a href="https://pages.github.com/" target="_blank">GitHub Pages Hosting</a>
* <a href="https://msdn.microsoft.com/en-us/library/dn589776.aspx" target="_blank">Microsoft Hosting</a>
* <a href="https://www.bitballoon.com/" target="_blank">BitBalloon Hosting</a>
* <a href="http://www.androidguys.com/2014/04/22/host-website-android-device/" target="_blank">Hosting on your Phone</a>
* <a href="https://cloud.google.com/" target="_blank">Hosting with GCloud</a>
* <a href="https://www.rackspace.com/knowledge_center/article/serve-static-content-for-websites-by-using-cloud-files" target="_blank">RackSpace Hosting</a>
