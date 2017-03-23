#!/usr/bin/env bash

## 2017 bios@spamers.net
## adapted from https://help.github.com/articles/changing-author-info/

if [ "$#" -ne 3 ];
then
	echo "Not enough arguments: OLD_EMAIL CORRECT_NAME CORRECT_EMAIL"
	exit 0;
fi


export OLD_EMAIL=${1}
export CORRECT_NAME=${2}
export CORRECT_EMAIL=${3}

#echo ${OLD_EMAIL}

git filter-branch --env-filter '
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
	    export GIT_COMMITTER_NAME="$CORRECT_NAME"
	        export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
	fi
	if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
	then
		    export GIT_AUTHOR_NAME="$CORRECT_NAME"
		        export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
		fi
		' --tag-name-filter cat -- --branches --tags
