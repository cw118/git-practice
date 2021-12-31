# git-practice

A repo I'm using to train my Git and GitHub skills.

## Basic commands

Starting by familiarizing myself with basic Git commands and following some tutorials:

- `git clone`: clone a repository
- `git status`: show changes, as well as tracked and untracked files, in a directory
- `git add`: tell Git to track certain or all files/changes in order to include them in a commit (using `git add .` will stage all files with Git, or in other words, cause all files to be tracked). **Saves pending changes, or the current project state, into commit history and prepares for a proper commit.** Typically used before the `commit` command (see below).
- `git commit`: commit (save) changes. See arguments below.
  - First `-m`: sets commit message (required)
  - Second `-m`: sets commit description (optional)
- `git push`: push commit changes live to remote repository (where your project is hosted)
  - `git push origin <branch-name>`: push commit changes to a branch of your remote/origin repository (the default tends to be `main` or `master`, depending on your configuration)
- `git remote`: depending on the arguments that follow, provides or modifies information on the remote repository
  - Argument `-v`: see your remote origin
  - Argument `set-url origin`: change the url of an existing origin