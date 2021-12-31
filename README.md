# git-practice

A repo I'm using to train my Git and GitHub skills (and command line as well).

## Basic commands

Starting by familiarizing myself with basic Git commands and following some tutorials:

- `git init`: initialize a (local) directory as a Git repository
  - *To undo, you can remove the hidden `.git` folder (verify its presence with the `ls -la` command in your terminal) using `rm -rf .git`.*
- `git clone`: clone a repository
- `git status`: show changes, as well as tracked and untracked files, in a directory
- `git add`: tell Git to track certain or all files/changes in order to include them in a commit (using `git add .` will stage all files with Git, or in other words, cause all files to be tracked). **Saves pending changes, or the current project state, into commit history and prepares for a proper commit.** Typically used before the `commit` command (see below).
  - Argument `<filename>`: add/save changes for the file specified (replace `<filename>` with the actual name of the file to be tracked)
  - Argument `.`: add/save changes for all files in the directory
- `git commit`: commit (save) changes. See arguments below.
  - First `-m`: sets commit message (required)
  - Second `-m`: sets commit description (optional)
- `git push`: push commit changes live to remote repository (where your project is hosted)
  - `git push origin <branch-name>`: push commit changes to a branch of your remote/origin repository (the default tends to be `main` or `master`, depending on your configuration)
  - Arguments `-u origin <branch-name>`: set an origin branch as **u**pstream *(simplifies pushing to the remote repo as `git push -u` without the `origin` and `<branch-name>` arguments)*
- `git remote`: depending on the arguments that follow, provides or modifies information on the remote repository
  - Argument `-v`: see your remote origin
  - Arguments `set-url origin <url>`: change the url of an existing origin
  - Arguments `add origin <url>`: add url to a remote origin (likely required if you began by creating a local directory instead of cloning)