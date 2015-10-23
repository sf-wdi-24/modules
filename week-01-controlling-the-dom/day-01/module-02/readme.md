# What is the Internet, Terminal, Git/GitHub

| Objectives |
| :--- |
| Explain how a client and a server interact |
| Navigate and manipulate files through the Terminal |
| Practice forking and cloning GitHub repositories |

## Client vs Server

Clients (ex. your computer) make requests to servers and servers send back responses. This is a really important mental model to have. Throughout this course, we'll be learning to write code that lives either on the client or on the server and it's important to know where it is.

![client-server.png](https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Client-server-model.svg/2000px-Client-server-model.svg.png)

Servers respond with `HTML`, `CSS`, `Javascript`, and/or pure data. Browsers have been created to know what to do with the code that servers send back.

* TCP/IP Basics


## Living in the Command Line

Web programmers have to live on the command line.  It gives us fast, reliable, and automatable control over computers.  Web servers usually don't have graphical interfaces, so we need to interact with them through command line and programmatic interfaces.  Once you become comfortable using the command line, staying on the keyboard will also help you keep an uninterrupted flow of work going without the disruption of shifting to the mouse.

![Careful with scripts](http://www.commitstrip.com/wp-content/uploads/2014/05/Strip-Roulette-russe-650-finalenglish.jpg)

Regarding scripts which you may find on the web while searching for solutions, assume they are going to do something bad

Important Note:

*** You should not copy / paste scripts from web pages and run them in your terminal until you have read them and understand what they do, bad things can happen, particularly with sudo and su commands ***

## Topics

* [Introduction](#terminal-introduction)
  * What is the Terminal
  * Opening the Terminal Application
* [Current Working Directory](#current-working-directory)
  * Current Directory
  * Home Directory
  * `ls`,`pwd`, commands
* [Navigating Around](#navigating-around)
  * Root Directory
  * `cd`
  * Absolute and Relative Paths
  * Tab Completion
* [File Manipulation](#file-manipulation)
  * `mkdir`
  * Editing Files
  * Moving, Copying and Removing

# Terminal Introduction

```zsh
➜  ~  man man
```

## What is the Terminal?

Terminal is a modern version of an 'original' `User Interface` for Unix based computers. At that time a [Text Terminal](http://en.wikipedia.org/wiki/Computer_terminal#Text_terminals) is all you would have seen, no windows, no mouse. Because of this history, it's very powerful but sometimes a little cryptic.

Don't worry though, with a bit of practice you'll be flying around like a pro!

Terms related to a terminal environment.

  * Shell
  * bash 'Bourne-Again shell'
  * Command Line
  * Text Terminal
  * DOS Prompt (on windows machines)
  * SSH (Secure Shell)
  * csh
  * ksh
  * sh
  * [UNIX Shell](http://en.wikipedia.org/wiki/Unix_shell)
  * ZSH!

## Opening the Terminal

__Follow Along:__

1.  In the top right of the screen click the Magnifying Glass icon to bring up 'Spotlight' and type 'Terminal'.
2.  Once Terminal starts locate the icon in the doc and select `Options->Keep In Dock` so that it's always handy.


## Current Working Directory

The file structure you see in the Terminal is the same as the one you see in the `Finder` application. Finder tends to hide some of the folders from you to keep things simple for most users, but everywhere that you go in Finder is accessible through 'Terminal'.

## Where am I?

Typically the shell will start in your `HOME` directory, each user has their own `HOME` directory, but on your computer it is common for you to be the only real user. At any given time a terminal shell process has one __current working directory__.

__Follow Along:__

```zsh
➜  ~  pwd
```

For me this is `/Users/erikerwitt`, what is the __current working directory__ of your shell process?

Wherever we are, `pwd`, short for __print working directory__, will show us which directory we are in.

__Follow Along:__

```zsh
➜  ~  open .
```

Wherever we are, `open .`, opens a `Finder` window in the current directory, this can be handy sometimes but only works on Mac!

## Looking Around

What can we find out about the  __current working directory__?

One of the most useful commands is:

```zsh
➜  ~  ls
```

Which lists the files and directories in the current working directory.

## Hidden Files

Have you ever heard of `hidden files`?

```zsh
➜  ~  ls -a
```

Hidden Files are typically used by applications to store configurations and there will be a many of them in your home directory. Most users don't want to be editing these files so they don't show up in `Finder`, but you as a software developer will be editing some these for yourself later on in the course.

Hidden files are hidden because their names begin with "`.`".

## Navigating Around

## Root Directory
Another important directory is the root directory `/`

```zsh
➜  /  cd /
➜  /  pwd
```

As we discovered the files on your computer are structured in a tree. The 'top' of the file system is know as the `root` directory.

We can move to the __root directory__ with the command `cd /`.

We can move back to your __home directory__ with the command `cd ~`.

## Relative Paths


```zsh
➜  ~  cd ../
➜  /Users  pwd
```

What happened? Which directory are you in?

* `../` prefixes paths relative to the parent directory.

## Tab Completion

Hitting `<TAB>` auto completes.  Hit `<TAB>` sometimes.

## Pair Practice

__Exercise: 5 minutes in Pairs__

1. Using Finder: Pick a directory somewhere under the /Users directory on your partner's computer.
2. Your Task: Navigate to that directory in a single command from your home directory using a relative or absolute path.
3. Help your partner if they are having trouble and use Tab Completion.

## File Manipulation

## mkdir

Now that we know how to move around, it's time to make some changes. We can make directories with the `mkdir` command.

__Operands__ (or arguments or parameters) are what comes after a command, so we write `mkdir living_room` to make a new directory, where we will keep our books.

__Try This__

```zsh
➜  ~  cd ~
➜  ~  mkdir living_room
```

## Adding and Editing Files

Let's `cd` into our new `living_room`  Look around with `ls`, and `ls -la`.  What do you see?

__Exercise__

I want my living room to have a bookshelf full of books.  Let's make a file that lists all of our books.  Open Sublime Text and make a new file called `books.txt` and save them on your Desktop.  Add a few books, copy and paste the section below so we all have some books in common, and save the file.  Make sure the books you add are in the same format:  `<author_given_name>, <author_last_name>:<title>`.

```
Carroll, Lewis:Through the Looking-Glass
Shakespeare, William:Hamlet
Bartlett, John:Familiar Quotations
Mill, John :On Nature
London, Jack:John Barleycorn
Bunyan, John:Pilgrim's Progress, The
Defoe, Daniel:Robinson Crusoe
Mill, John Stuart:System of Logic, A
Milton, John:Paradise Lost
Johnson, Samuel:Lives of the Poets
Shakespeare, William:Julius Caesar
Mill, John Stuart:On Liberty
Bunyan, John:Saved by Grace
```

Now try `ls` again.  Do you see the `books.txt` file? No? Why not?

We'll find it on your Desktop `ls ~/Desktop`.

Look at the contents with `cat` (catenate).

But using `cat` is a horrid idea, anyone guess why? Let's use `less`.

## Copying

We want the books in our living room! Let's copy them there with the command `cp`.

```zsh
➜  ~  cp ~/Desktop/books.txt ~/living_room/
```

## Moving

Wait... Now we have two lists of books.

```zsh
➜  ~  ls ~/Desktop/book*
➜  ~  ls ~/living_room/book*
```

Let's remove the books from the living room with the `rm` command and try moving them instead `mv`.

```zsh
➜  ~  rm ~/living_room/books.txt
```

Now we're going to move them.

```zsh
➜  ~  mv ~/Desktop/books.txt ~/living_room/
```

Are the old books still there?

```zsh
➜  ~  ls ~/Desktop/books.txt
```

### Terminal Cheat Sheet

[Bookmark This](http://bit.ly/terminalcheats)

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
