# <img src="https://cloud.githubusercontent.com/assets/7833470/10423298/ea833a68-7079-11e5-84f8-0a925ab96893.png" width="60"> Contributing to SF WDI 24 Modules

## Weekly Folder Structure

```md
| week-01-controlling-the-dom
  | day-01
  | day-02
    | drill
      - readme.md
      - solutions.md
    | module-01
      - readme.md
      - solutions.md
    | module-02
      - readme.md
      - solutions.md
  | day-03
  | day-04
  | day-05
  - readme.md
```

## Folder & File Names

* Numbers in folder and file names should be zero-padded (e.g. `week-01` instead of `week-1`)
* Folder and file names should be all lowercase and dash-separated
* Folder and file names should only contain alpha-numerics [UTF-8] [0-9] [a-z]
* Readmes should be lowercase and should always be markdown, with a `.md` extension: `readme.md`

## Default File Names

* HTML: `index.html`
* CSS: `main.css`
* Client-Side JS (no framework): `main.js`
* Client-Side JS (with framework): `app.js`
* Server-Side JS: `server.js`

## Storing Images

* Use <a href="https://help.github.com/articles/file-attachments-on-issues-and-pull-requests">GitHub's Issue Attachment CDN</a> to upload and link to images. Essentially, pretend you're going to attach an image to a GitHub Issue, let it upload, and then copy and paste the image URL. See this <a href="http://solutionoptimist.com/2013/12/28/awesome-github-tricks" target="_blank">detailed blog post</a> on the subject.

## Making Contributions

* Work on feature branches off `develop` branch (e.g. `week-01-day-01-mod-02`)
* Make pull requests from feature branches to `develop` branch.
* Add `[WIP]` to the title for in-progress pull requests.
* Don't merge your own branch - at least one other instructor must review your branch before it's ready to merge into `develop`
* When done reviewing a pull request, add a comment with `+1`
* DiR merges pull requests from `develop` into `master`

## Drill Challenges

* Drills are included in the daily `readme`.
* Solutions to drills are included in the drill's `solutions.md` file.
* Drills may use external projects which are linked to via the `readme`.

## Homework

* Instructor assigned to `module-02` is always responsible for that night's homework.
* Homework should always live in a separate repo in `sf-wdi-24` and should be linked to from weekly schedule.
* Every homework repo should have a `solution` branch.
* Every homework repo should have a `readme` including "Getting Started" and "Submission" instructions:

> **Getting Started**
> * Fork this repo, and clone it into your `develop` folder on your local machine.
> * *Any other steps to get started*

> **Submission**
> * As you make code changes, frequently commit and push to GitHub.
> * Once you've finished the assignment and pushed your work to GitHub, make a pull request from your fork to the original repo.
