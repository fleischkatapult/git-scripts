# git-scripts

Some useful git (annex) scripts. At least for me ;)

* `recreate_commit_timeline.sh` - if you forgot to properly commit a few files, this script will add the files and commit them on their creation date, using faketime
* `git-whoami.sh` - just a stupid git demo I once created for a workshop. It has no real purpose as you hopefully know who you are ;)
* `git_annex_find_duplicates.sh` - to find duplicate files in your git-annex
* `git_rewrite_author_commiter_history.sh OLD_EMAIL CORRECT_NAME CORRECT_EMAIL` - change your name and email in a git history, if you committed something with a misspelled email address or the wrong user name. Required arguments are `OLD_EMAIL` which will be used to filter for matching commits and both `CORRECT_NAME` and `CORRECT_EMAIL` which will be used in the new, overwritten commit.

