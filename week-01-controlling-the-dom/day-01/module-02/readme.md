# What is the Internet, Terminal, Git/GitHub

| Objectives |
| :--- |
| Explain how a client and a server interact |
| Navigate and manipulate files through the Terminal |
| Practice forking and cloning GitHub repositories |

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

## Git/GitHub

You'll be using git and GitHub every day throughout this course (and as a developer in the industry) for version control. **Version control** is a system that records changes to a file or set of files over time so that you can recall specific versions later.

More specifically, **a version control system allows you to:**

* Review changes made over time
* Revert files (or an entire project) back to a previous state
* Collaborate on a project with other developers
* Track down the origin of bugs in the code
* Back up your projects on a remote server

**Git** is a version control system and **GitHub** is a social network built around git.

### Git Basics

| Action | Command |
| :--- | :--- |
| Create new git repository | `git init` |
| Check status of git repo | `git status` |
| Check differences since last commit | `git diff <filename>` |
| Add file to git repo (stage for commit) | `git add <filename>` |
| Add (stage) all files in current directory | `git add .` |
| Commit (save) a version | `git commit -m "message describing changes"` |
| Push commits to GitHub (remote repository) | `git push <remote> <branch>` |
| Show version history | `git log <filename>` |
| Get help with git commands | `git help <command>` |

## Homework Submission with GitHub

1. Create a fork of the homework repository by clicking "Fork" on the top right. Homework repositories will always live in the `sf-wdi-24` GitHub organization.

  ![screen-shot-2015-10-20-at-17 26 49](https://cloud.githubusercontent.com/assets/7833470/10625501/b15a2bee-7758-11e5-8b12-2c84b785801b.png)

2. You'll see a screen like this while GitHub is forking the repo. Forking creates a copy of the original repo on your own GitHub account.

  ![screen-shot-2015-10-20-at-17 21 15-1](https://cloud.githubusercontent.com/assets/7833470/10625502/b422f2e8-7758-11e5-8cf1-09ae4fd7d946.png)

3. Now you have your own copy of the repo! Copy the "clone URL" from the bottom right.

  ![screen-shot-2015-10-20-at-17 22 43](https://cloud.githubusercontent.com/assets/7833470/10625504/b7243f42-7758-11e5-870c-56fdbb5ddd14.png)

4. Use the "clone URL" to clone the repo onto your local machine. Make sure you're in your `~/develop` directory before you clone!

  ```bash
  $ cd ~/develop
  $ git clone <clone-url>
  ```

5. Change directories into the repo you just cloned (in this example, `command-line-mystery`).

  ```bash
  $ cd command-line-mystery
  ```

6. At this point, begin writing code to complete the assignment. Make sure you're committing frequently and pushing to GitHub. A typical workflow looks something like this:

  ```bash
  # make changes using your text editor
  $ git status
  $ git add .
  $ git commit -m "message describing changes"
  $ git push origin master
  ```

7. Once you're done with the assignment and have committed and pushed ALL of your changes to GitHub, it's time to make a pull request back to the original homework repo. Go to your forked copy of the repo on GitHub, and click the "Pull Request" button.

  ![screen-shot-2015-10-20-at-17 25 24](https://cloud.githubusercontent.com/assets/7833470/10625506/ba15d4cc-7758-11e5-8302-a9c412567cc0.png)

8. GitHub takes you to a new view and asks if you want to create the pull request. Click the green button, and that's it - you've now created a pull request to submit your homework!

  ![screen-shot-2015-10-20-at-17 25 49](https://cloud.githubusercontent.com/assets/7833470/10625507/bc97d38a-7758-11e5-8fe9-e4846e06e454.png)

## Resources

* <a href="https://github.com/0nn0/terminal-mac-cheatsheet/wiki/Terminal-Cheatsheet-for-Mac-(-basics-)" target="_blank">Terminal Cheatsheet for Mac</a>
* <a href="https://training.github.com/kit/downloads/github-git-cheat-sheet.pdf" target="_blank">Git Cheat Sheet</a>
