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
| Show version history | `git log <filename>` |
| Get help with git commands | `git help <command>` |

### Forking a GitHub Repo

Forking a GitHub repository creates a remote copy of that repo on your GitHub account.

<!-- @TODO: Add screenshots of forking/cloning -->

## Resources

* <a href="https://github.com/0nn0/terminal-mac-cheatsheet/wiki/Terminal-Cheatsheet-for-Mac-(-basics-)" target="_blank">Terminal Cheatsheet for Mac</a>
* <a href="https://training.github.com/kit/downloads/github-git-cheat-sheet.pdf" target="_blank">Git Cheat Sheet</a>
