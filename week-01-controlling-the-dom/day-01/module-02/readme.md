# What is the Internet, Terminal, Git/GitHub

## Client vs Server

* TCP/IP Basics

## Terminal Introduction

Items to cover.
* `grep`
* `cat`
* Working with file systems
  * `cd`
  * `mkdir`
  * `rmdir`
  * `rm`
  * `ls`
  * `touch`
* `find`
* `locate`
* `man`
* `--help`, `-h` and `-help`

## Create Development Directory

As a developer, you'll want to have a designated directory on your computer where you keep all your projects. This makes it faster to navigate to specific projects, since you know you can find them all in one place.

Follow these steps to set up your development directory (which we'll call `develop`):

1. Change into your home directory:

  ```bash
  $ cd ~
  ```

2. Create a new directory called `develop`:

  ```bash
  $ mkdir develop
  ```

3. Whenever you start a new project, change into your `develop` directory, then you're ready to go!

  ```bash
  $ cd ~/develop
  ```

**Important:** DO NOT turn your home (`~`) or development (`~/develop`) directory into a git repository. This would be done by running `git init` in either directory (which you DO NOT want to do). If `~` or `~/develop` is a git repository, any project you create inside `~/develop` won't be properly tracked by GitHub.

## Start Homework

In person start the homework, walk over process to fork the repository and clone it locally then create a pull request to submit it.
