# git-practice

A repo I'm using to train my Git, GitHub, and command line skills, as well as to save some of my notes on these topics.

### Table of contents

- [Tutorials](#tutorials)
- [Vocabulary](#vocabulary)
- [Basic commands](#basic-commands)
  - [Key/general commands](#keygeneral-commands)
- [Branching with Git](#branching-with-git)
  - [Branching commands](#branching-commands)
  - [Merge conflicts](#merge-conflicts)
- [Undoing in Git](#undoing-in-git)

## Tutorials

Here's a list of some tutorials that I've followed (or plan on following) on Git and GitHub:

- [Git and GitHub for Beginners - Crash Course](https://www.youtube.com/watch?v=RGOj5yH7evk) by [Gwen Faraday (Faraday Academy on YouTube)](https://www.youtube.com/channel/UCxA99Yr6P_tZF9_BgtMGAWA)
- [Git for Professionals Tutorial - Tools & Concepts for Mastering Version Control With Git](https://www.youtube.com/watch?v=Uszj_k0DGsg) by Tobias Günther from [Tower](https://www.git-tower.com/)

## Vocabulary

- **[Version control](https://www.atlassian.com/git/tutorials/what-is-version-control):** the practice of tracking and managing changes to software code (computer programs, websites, etc.) as well as to documents and various collections of information. *Also known as source control.*
  - For example, a version control system allows you to save an initial version of something like code, then as you update/modify the code, you can save it into the version control system again and again. You'll also be able to view the history of your code; that is, you can look back at all of the changes you've made over time.
  - Some other benefits of using a version control system: facilitates tracking down bugs, allows you to return/revert to a previous version of your code, makes collaboration on a project *(such as open source projects)* significantly easier, etc.
- **Git:** a free, open source version control system/tool installed locally on devices — (one of) the most widely used in development today.
  - Install Git here: https://git-scm.com/downloads
  - A helpful tutorial by Atlassian on installing Git: https://www.atlassian.com/git/tutorials/install-git
- **GitHub:** an online, cloud-based code hosting platform/service for version control and collaboration built around Git, often used to manage Git repositories
- **Directory:** in computing, a directory can be described simply as a folder.
- **Terminal (or command line):** a blank line and cursor on a computer screen allowing users to type text commands for immediate execution.
- **Command line interface (CLI):** a command line program that accepts text input for users to interact with operating systems — this includes managing files (creating, moving, deleting, etc.), running programs, configuring computers, etc.
  - Some examples of CLIs: Command Prompt (Windows), Terminal (Mac), Linux, etc.
  - Many applications use a command line and/or CLI, or create their own command line tool: npm (a package manager for JavaScript), Git, GitHub CLI, etc.

## Basic commands

Starting by familiarizing myself with basic Git commands and following some tutorials.

### Key/general commands

#### Terminal/Command line

- `clear`: move your terminal/command line scrollbar so that you see a clear screen *("removes clutter")*
- `q`: "escape" (often used after commands like `git diff`, `git log`, etc.)
- `ls`: list the files and directories in your current directory. See possible arguments/flags below and a usage example.
  - The `-l` flag indicates a long listing format
  - The `-a` flag enables viewing of **all** files, **including hidden ones** (such as the `.git` folder)
  - For example, the `ls -la` command lists all files and directories, including hidden files (such as the `.git` folder), in a long listing format.

#### Git

- `git init`: initialize a (local) directory as a Git repository
  - To undo, you can remove the hidden `.git` folder *(verify its presence with the `ls -la` command in your terminal)* using `rm -rf .git`.
- `git clone`: clone a repository
- `git status`: show changes, as well as tracked and untracked files, in a directory
- `git add`: tell Git to track certain or all files/changes in order to include them in a commit (using `git add .` will stage all files/changes with Git, or in other words, cause all files to be tracked). **Saves pending changes, or the current project state, into commit history and prepares (stages) for a proper commit.** Typically used before the `commit` command (see below).
  - Argument `<filename>`: add/save changes for the file specified (replace `<filename>` with the actual name of the file to be tracked)
  - Argument `.`: add/save changes for all files in the directory
- `git commit`: commit (save) changes. See arguments below.
  - ***First*** `-m "<message-here>"`: sets commit message **(required**, unless you're using another shorthand argument that has the same purpose such as `-am`). *Note the use of double quotes around the message text!*
  - ***Second*** `-m "<description-here>"`: sets commit description (optional). *Note the use of double quotes around the description text!*
  - `-am "<message-here>"`: a "shortcut" command combining `git add` and `git commit -m` into one. ***This only works for modified files*, not newly created ones.** *Note the use of double quotes around the message text!*
- `git log`: see a log/history of all commits. In reverse chronological order (starts with the most recent commit) by default.
  - Argument `--reverse`: show a log of commits in chronological order (starts with the first commit). *Reverses the default order.*
- `git push`: push commit changes live to remote repository (where your project is hosted). See possible arguments below.
  - `origin <branch-name>`: push commit changes to a branch of your remote/origin repository (the default tends to be `main` or `master`, depending on your configuration)
  - `-u origin <branch-name>`: set an origin branch as **u**pstream *(simplifies pushing to the remote repo as `git push -u` without the `origin` and `<branch-name>` arguments)*
    - ***Note:*** `-u` is a shorthand for `--set-upstream`.
  - `-u`: push commit changes to upstream — only possible once upstream has been set *(see the argument directly above)*
  - `--set-upstream origin <branch-name>`: push the current branch and set its upstream branch with a name of `<branch-name>` *(the name used for the upstream branch usually matches the name of the current local branch)*. Often used when a locally created branch does not yet have an upstream branch on the remote repository.
  - `origin --delete <branch-name>`: delete a branch on the **remote** (repository). *See [Branching commands](#branching-commands) for more on commands involving Git branches, as well as deleting local branches.)*
- `git pull`: pulls changes from the remote repository to your local copy. Typing this command without additional arguments will suffice if you have already set upstream *(see `git push` for more details)*. See possible arguments below.
  - `origin <branch-name>`: pull changes from a branch of your remote/origin repository (the default tends to be `main` or `master`, depending on your configuration) to your local copy
- `git remote`: depending on the arguments that follow, provides or modifies information on the remote repository
  - Argument `-v`: see your remote origin
  - Arguments `set-url origin <url>`: change the url of an existing origin
  - Arguments `add origin <url>`: add url to a remote origin (likely required if you began by creating a local directory instead of cloning)

## Branching with Git

**Git branching** involves the creation of **branches** used for *development* in addition to the main/default *(typically called `main` or `master`)* branch used for *production*. The term "branch" refers to the resemblance of a Git workflow to tree branches as shown in the diagram *(courtesy of [Atlassian's tutorial on Git branching](https://www.atlassian.com/git/tutorials/using-branches))* below:

![Diagram of branches in Git](git-branching.png)

When a branch is first created, its code and content is identical to those of the branch off of which it was based. For example, if a branch named `feature` were to be created from `main`, all code and content of the `feature` branch would be the same as the code and content of the `main` branch until you make modifications. 

Each branch only keeps track of the changes are made on its own copy of files, and has no way of "knowing" what changes were made to other branches — to continue with the `feature` and `main` example, if you pushed changes to the `feature` branch, then switched back to the `main` branch, you wouldn't see any of those modifications reflected in `main`. 

This is extremely useful whether you're working independently or collaborating with a group of people, because Git branches allow you to create and test new features for your project that may break your code *(you wouldn't want to save them to the production branch before fixing all bugs and issues)*. In addition, branches also allow you to work on code in a sort of "sandbox area", without having to push anything to production until you've finished developing code that functions properly (and that you're satisfied with). 

Branches can then be **merged**: if a feature has been successfully developed on the `feature` branch, merging it into `main` will then modify the files in main to reflect changes made in `feature`. Branch merging is often done through a **pull request**, often abbreviated as "PR" — it gets its name from the fact that you're making a request to have your code pulled into the main/master branch.

Pull requests allow collaborators and/or contributors to see and comment on your code, as well as review it and possibly request changes. Generally, after a PR has been approved and merged, you'll delete the source/feature branch and switch back to the main branch. When you want to make additional changes to the repository, you'll create a new branch and once again begin the process of modifying the files locally, then making a pull request when you're ready. The GitHub user interface (UI) is extremely helpful when it comes to making pull requests and will guide you through the process.

### Branching commands

- `git branch`: see all branches of the repository you're in. See below for more information and possible arguments.
  - The branch that is highlighted *(in a different color)* and that has an asterisk (`*`) preceding its name is the branch you're currently on (e.g. `* main` means you're currently on the main branch)
  - Argument `-d <branch-name>`: delete the branch `<branch-name>`
    - *In general, once a branch has been merged into `main`/`master`, it won't be used again and is deleted.*
- `git checkout`: manipulate branches of the repository you're in. See some possible arguments below:
  - `-b <branch-name>`: create and switch to a new branch named (whatever you type as) `<branch-name>`
  - `<branch-name>`: switch to the branch named `<branch-name>`
    - If you press the `tab` key, Git will also suggest/autocomplete the name of an existing branch based on what you've typed so far. For example, if there's a `main` and a `feature-readme-update` branch, you could type `git checkout ` then start typing "feature", then press `tab` for Git to autocomplete.
- `git diff`: shows the changes that have been made by comparing two versions of your code *(shows the **diff**erence between the lines of your files)*
  - Argument `<branch-name>`: shows the diff between the current branch and `<branch-name>`
- `git merge`: merge branches (update one branch with changes made in another)
  - Argument `<branch-name>`: merges `<branch-name>` into the current branch

### Merge conflicts

Merging branches won't always go smoothly, especially when you're working with others on a repository, in which case multiple people may be modifying the same files at the same time. This can cause **merge conflicts**.

If Git detects a merge conflict (meaning that the branches you're trying to merge make changes to the same file, and neither branch has been updated to match the other), it'll likely show a message like this: `Automatic merge failed; fix conflicts and then commit the result.` This is because Git doesn't know how to handle it — it's not sure which changes/version you want to keep (or perhaps you want to use both). You can get more information about resolving the conflict with the `git status` command.

Merge conflicts sometimes occur when you're merging locally with `git merge`, which is typically done when you're merging the `main`/`master` branch into your current one to stay up-to-date — `main`/`master` will probably be modified quite often when, for instance, you're working with a team, so you'll want to pull all of those changes to your local copy to get the "latest version". These conflicts can, however, also occur when attempts at merging are made through pull requests.

While fixing merge conflicts can be done at the terminal, the easiest way is often to fix them directly in your code editor, which offers a visual interface and compares the changes made on your current branch and the incoming change from the branch you're trying to merge into it. Once you've resolved the merge conflict, you can commit — if the fix was successful, Git will also merge the branches automatically.

## Undoing in Git

Sometimes you'll want to undo in Git, whether it be unstaging changes or undoing a commit. This section covers the commands that'll allow you to undo various actions in Git.

- `git reset`: unstage all changes in all files. May also take arguments (see below).
  - `<file-name>`: unstage the changes in the file named `<file-name>`
  - `HEAD~<number-here>`: **undo and unstage the changes** of one or several **commits** *(note the usage of `~`)*. Tells Git to point `HEAD` *(refers/points to the current commit you're viewing)* at a commit `<number-here>` commits before. For example, `git reset HEAD~1` tells Git to point at the previous commit, since it's one commit "before" the current one, thus undoing and unstaging the changes you just committed.
